using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QRCoder;
using System.Drawing;
using System.IO;



namespace AIRLINES_PROJECT
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string upiId = "8179067809@ibl"; // Change to your actual UPI ID
                string passenger = Session["passenger"]?.ToString();
                string email = Session["Email"]?.ToString();
                string bookingIdStr = Session["BookingID"]?.ToString();
                string amountStr = Session["Amount"]?.ToString();

                if (!string.IsNullOrEmpty(amountStr) && !string.IsNullOrEmpty(bookingIdStr))
                {
                    lblPassenger.Text = "Passenger: " + passenger;
                    lblEmail.Text = "Email: " + email;
                    lblBookingID.Text = "Booking ID: " + bookingIdStr;
                    lblAmount.Text = "Amount: ₹" + amountStr;

                    // Generate QR Code
                    string upiUrl = $"upi://pay?pa={upiId}&pn=VistaraAirways&am={amountStr}&cu=INR";
                    GenerateQRCode(upiUrl);

                    // Save to DB with pending status
                    SavePayment(Convert.ToInt32(bookingIdStr), upiId, Convert.ToInt32(amountStr));
                }
                else
                {
                    lblAmount.Text = "❌ Amount or Booking ID not found in session.";
                }
            }
        }

        private void GenerateQRCode(string upiUrl)
        {
            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            {
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(upiUrl, QRCodeGenerator.ECCLevel.Q);
                using (QRCode qrCode = new QRCode(qrCodeData))
                {
                    using (Bitmap qrCodeImage = qrCode.GetGraphic(20))
                    {
                        using (MemoryStream ms = new MemoryStream())
                        {
                            qrCodeImage.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                            byte[] byteImage = ms.ToArray();
                            string base64Image = Convert.ToBase64String(byteImage);
                            imgQRCode.ImageUrl = "data:image/png;base64," + base64Image;
                        }
                    }
                }
            }
        }

        private void SavePayment(int bookingId, string upiId, int amount)
        {
            string connStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(@"
                    INSERT INTO tblPayments (BookingID, UpiID, Amount, PaymentStatus)
                    VALUES (@BookingID, @UpiID, @Amount, 'Pending')", con);
                cmd.Parameters.AddWithValue("@BookingID", bookingId);
                cmd.Parameters.AddWithValue("@UpiID", upiId);
                cmd.Parameters.AddWithValue("@Amount", amount);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void btnCompletePayment_Click(object sender, EventArgs e)
        {
            if (Session["BookingID"] == null || Session["Email"] == null)
            {
                lblStatus.Text = "❌ Session expired. Please try again.";
                return;
            }

            int bookingId = Convert.ToInt32(Session["BookingID"]);
            string email = Session["Email"].ToString();
            string connStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("UPDATE tblPayments SET PaymentStatus = 'Completed', PaymentDate = GETDATE() WHERE BookingID = @BookingID", con);
                cmd.Parameters.AddWithValue("@BookingID", bookingId);
                con.Open();
                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    SendEmail(email, bookingId);
                    lblStatus.Text = "✅ Payment marked as completed and email sent!";
                    Response.Redirect("BookingDetails.aspx");
                }
                else
                {
                    lblStatus.Text = "❌ Payment update failed.";
                }
            }
        }

        private void SendEmail(string toEmail, int bookingId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;
            string bookingDetails = "";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblBookings WHERE BookingID = @BookingID", con);
                cmd.Parameters.AddWithValue("@BookingID", bookingId);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    bookingDetails = $@"
                    <b>Booking ID:</b> {reader["BookingID"]}<br/>
                    <b>Passenger:</b> {reader["PassengerName"]}<br/>
                    <b>Flight:</b> {reader["FlightName"]}<br/>
                    <b>Date:</b> {reader["FlyDate"]}<br/>
                    <b>Seat:</b> {reader["SeatNo"]}<br/>
                    <b>Class:</b> {reader["Class"]}<br/>
                    <b>Fare:</b> ₹{reader["Fare"]}";
                }
            }

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("rammmm0713@gmail.com"); // Replace with your Gmail
            mail.To.Add("chirusudheer@gmail.com");
            mail.Subject = "✅ Vistara Airlines - Booking Confirmation";
            mail.Body = $"<h3>Thank you for your payment!</h3><p>{bookingDetails}</p>";
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential("rammmm0713@gmail.com", "qtfy snxh vjeh vhmi"); // Use App Password
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
    }
}
        
    

    
