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
    public partial class ModifyFlightInfo : System.Web.UI.Page
    {
        string conStr = "Data Source=RAMMMM\\SQLEXPRESS;Initial Catalog=VistaraDb;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadFlightCodes();
        }
        private void LoadFlightCodes()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT FlightCode FROM tblFlights", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                ddlFlightCode.Items.Clear();
                ddlFlightCode.Items.Add("--Select--");
                while (dr.Read())
                {
                    ddlFlightCode.Items.Add(dr["FlightCode"].ToString());
                }
            }
        }

        protected void ddlFlightCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFlightCode.SelectedIndex == 0) return;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblFlights WHERE FlightCode = @FlightCode", con);
                cmd.Parameters.AddWithValue("@FlightCode", ddlFlightCode.SelectedValue);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtSource.Text = dr["Source"].ToString();
                    txtDestination.Text = dr["Destination"].ToString();
                    txtArrival.Text = dr["ArrivalTime"].ToString();
                    txtDeparture.Text = dr["DepartureTime"].ToString();
                    txtFlightName.Text = dr["FlightName"].ToString();
                    txtExecSeats.Text = dr["ExecSeats"].ToString();
                    txtExecFare.Text = dr["ExecFare"].ToString();
                    txtEcoSeats.Text = dr["EcoSeats"].ToString();
                    txtEcoFare.Text = dr["EcoFare"].ToString();
                    txtGenSeats.Text = dr["GenSeats"].ToString();
                    txtGenFare.Text = dr["GenFare"].ToString();
                }
            }
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            if (ddlFlightCode.SelectedIndex == 0)
            {
                lblMessage.Text = "Please select a valid Flight Code.";
                lblMessage.CssClass = "error";
                lblMessage.Visible = true;
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(@"UPDATE tblFlights SET 
                    Source=@Source, Destination=@Destination, ArrivalTime=@Arrival, DepartureTime=@Departure,
                    FlightName=@FlightName, ExecSeats=@ExecSeats, ExecFare=@ExecFare, 
                    EcoSeats=@EcoSeats, EcoFare=@EcoFare, GenSeats=@GenSeats, GenFare=@GenFare 
                    WHERE FlightCode=@FlightCode", con);

                cmd.Parameters.AddWithValue("@FlightCode", ddlFlightCode.SelectedValue);
                cmd.Parameters.AddWithValue("@Source", txtSource.Text);
                cmd.Parameters.AddWithValue("@Destination", txtDestination.Text);
                cmd.Parameters.AddWithValue("@Arrival", txtArrival.Text);
                cmd.Parameters.AddWithValue("@Departure", txtDeparture.Text);
                cmd.Parameters.AddWithValue("@FlightName", txtFlightName.Text);
                cmd.Parameters.AddWithValue("@ExecSeats", txtExecSeats.Text);
                cmd.Parameters.AddWithValue("@ExecFare", txtExecFare.Text);
                cmd.Parameters.AddWithValue("@EcoSeats", txtEcoSeats.Text);
                cmd.Parameters.AddWithValue("@EcoFare", txtEcoFare.Text);
                cmd.Parameters.AddWithValue("@GenSeats", txtGenSeats.Text);
                cmd.Parameters.AddWithValue("@GenFare", txtGenFare.Text);

                con.Open();
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    lblMessage.Text = "Flight information successfully modified.";
                    lblMessage.CssClass = "success";
                }
                else
                {
                    lblMessage.Text = "Modification failed.";
                    lblMessage.CssClass = "error";
                }
                lblMessage.Visible = true;
            }
        }
    }
}
    
