using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace AIRLINES_PROJECT
{
    public partial class AddFlightInfo_aspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"INSERT INTO tblFlights 
                (FlightCode, Source, Destination, ArrivalTime, DepartureTime, FlightName,
                 ExecSeats, ExecFare, EcoSeats, EcoFare, GenSeats, GenFare) 
                 VALUES 
                (@FlightCode, @Source, @Destination, @ArrivalTime, @DepartureTime, @FlightName,
                 @ExecSeats, @ExecFare, @EcoSeats, @EcoFare, @GenSeats, @GenFare)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FlightCode", txtFlightCode.Text);
                cmd.Parameters.AddWithValue("@Source", txtSource.Text);
                cmd.Parameters.AddWithValue("@Destination", txtDestination.Text);
                cmd.Parameters.AddWithValue("@ArrivalTime", TimeSpan.Parse(txtArrival.Text));
                cmd.Parameters.AddWithValue("@DepartureTime", TimeSpan.Parse(txtDeparture.Text));
                cmd.Parameters.AddWithValue("@FlightName", txtFlightName.Text);
                cmd.Parameters.AddWithValue("@ExecSeats", int.Parse(txtExecSeats.Text));
                cmd.Parameters.AddWithValue("@ExecFare", int.Parse(txtExecFare.Text));
                cmd.Parameters.AddWithValue("@EcoSeats", int.Parse(txtEcoSeats.Text));
                cmd.Parameters.AddWithValue("@EcoFare", int.Parse(txtEcoFare.Text));
                cmd.Parameters.AddWithValue("@GenSeats", int.Parse(txtGenSeats.Text));
                cmd.Parameters.AddWithValue("@GenFare", int.Parse(txtGenFare.Text));

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Flight Inserted Successfully!";
                    lblMessage.CssClass = "success";
                    lblMessage.Visible = true;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.CssClass = "error";
                    lblMessage.Visible = true;
                }
            }
        }
    }
}
    
