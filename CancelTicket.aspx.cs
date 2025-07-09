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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelTicket_Click(object sender, EventArgs e)
        {
            string seatNo = txtSeatNo.Text.Trim();

            if (string.IsNullOrEmpty(seatNo))
            {
                lblStatus.Text = "Please enter a seat number.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("DELETE FROM tblBookings WHERE SeatNo = @SeatNo", con);
                cmd.Parameters.AddWithValue("@SeatNo", seatNo);

                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    lblStatus.Text = "Ticket cancelled successfully.";
                    lblStatus.ForeColor = System.Drawing.Color.Green;

                    // Optional redirect after 2 seconds
                    Response.AddHeader("REFRESH", "2;URL=EmpMenu.aspx");
                }
                else
                {
                    lblStatus.Text = "No ticket found with the given seat number.";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}