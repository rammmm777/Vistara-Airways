using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AIRLINES_PROJECT
{
    public partial class BookTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFlightNames();

            }
        }

        private void LoadFlightNames()
        {
            string connStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT FlightName FROM tblFlights", con);
                SqlDataReader reader = cmd.ExecuteReader();


                ddlFlightName.DataSource = reader;
                ddlFlightName.DataTextField = "FlightName";

                ddlFlightName.DataBind();
            }


        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            int bookingId = 0;
            string connStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(@"
            INSERT INTO tblBookings 
            (FlightName, FlyDate, PassengerName, Address, PhoneNo, Email, Class, SeatNo, Amount, Fare)
            OUTPUT INSERTED.BookingID
            VALUES 
            (@FlightName, @FlyDate, @PassengerName, @Address, @PhoneNo, @Email, @Class, @SeatNo, @Amount, @Fare)", con);

                cmd.Parameters.AddWithValue("@FlightName", ddlFlightName.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@FlyDate", txtFlyDate.Text);
                cmd.Parameters.AddWithValue("@PassengerName", txtPassenger.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Class", ddlClass.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@SeatNo", txtSeatNo.Text);

                // Safe decimal conversion with fallback
                decimal amount = 0;
                decimal fare = 0;
                decimal.TryParse(ddlAmount.SelectedItem.Value, out amount);
                decimal.TryParse(ddlFare.SelectedItem.Value, out fare);
                cmd.Parameters.AddWithValue("@Amount", amount);
                cmd.Parameters.AddWithValue("@Fare", fare);

                con.Open();
                bookingId = Convert.ToInt32(cmd.ExecuteScalar());
            }

            // ✅ Place this right here before redirect:
            Response.Write("Amount selected: " + ddlAmount.SelectedItem.Value); // For testing
            Session["Amount"] = ddlAmount.SelectedItem.Value;

            // Set session for Payment page
            Session["BookingID"] = bookingId;
            Session["passenger"] = txtPassenger.Text;
            Session["Email"] = txtEmail.Text;

            Response.Redirect("Payment.aspx");
        }
        
       

        

        protected void ddlFlightName_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadFare();
        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadFare();
        }

        private void LoadFare()
        {
            ddlFare.Items.Clear();
            ddlAmount.Items.Clear();

            string selectedFlight = ddlFlightName.SelectedValue;
            string selectedClass = ddlClass.SelectedValue;

            if (string.IsNullOrEmpty(selectedFlight) || string.IsNullOrEmpty(selectedClass))
                return;

            string query = "";
            switch (selectedClass)
            {
                case "Executive":
                    query = "SELECT ExecFare AS Fare FROM tblFlights WHERE FlightName = @FlightName";
                    break;
                case "Economy":
                    query = "SELECT EcoFare AS Fare FROM tblFlights WHERE FlightName = @FlightName";
                    break;
                case "General":
                    query = "SELECT GenFare AS Fare FROM tblFlights WHERE FlightName = @FlightName";
                    break;
            }

            string connStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FlightName", selectedFlight);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    string fare = dr["Fare"].ToString();

                    // Populate both dropdowns
                    ddlFare.Items.Add(new ListItem(fare, fare));
                    ddlAmount.Items.Add(new ListItem(fare, fare)); // Same value unless business logic differs
                }

                ddlFare.Items.Insert(0, new ListItem("--Select Fare--", ""));
                ddlAmount.Items.Insert(0, new ListItem("--Select Amount--", ""));
            }

        }

        

        protected void ddlAmount_SelectedIndexChanged1(object sender, EventArgs e)
        {
            LoadFare();
        }

        
    }
}
    
