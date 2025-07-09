using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AIRLINES_PROJECT
{
    public partial class DeleteFlightInfo : System.Web.UI.Page
    {
        string conStr = "Data Source=RAMMMM\\SQLEXPRESS;Initial Catalog=VistaraDb;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFlightCodes();
            }

        }
        private void BindFlightCodes()
        {
            ddlFlightCode.Items.Clear();
            ddlFlightCode.Items.Add("-- Select Flight Code --");

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT FlightCode FROM tblFlights", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ddlFlightCode.Items.Add(dr["FlightCode"].ToString());
                }
            }
        }

        protected void ddlFlightCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            string code = ddlFlightCode.SelectedValue;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblFlights WHERE FlightCode = @Code", con);
                cmd.Parameters.AddWithValue("@Code", code);
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

                dr.Close();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (ddlFlightCode.SelectedIndex <= 0)
            {
                lblMessage.Text = "Please select a flight to delete.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM tblFlights WHERE FlightCode = @Code", con);
                cmd.Parameters.AddWithValue("@Code", ddlFlightCode.SelectedValue);
                con.Open();
                int rows = cmd.ExecuteNonQuery();
                con.Close();

                if (rows > 0)
                {
                    lblMessage.Text = "Flight deleted successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Visible = true;
                    ClearFields();
                    BindFlightCodes();
                }
                else
                {
                    lblMessage.Text = "Error occurred. Try again.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Visible = true;
                }
            }
        }
        private void ClearFields()
        {
            txtSource.Text = "";
            txtDestination.Text = "";
            txtArrival.Text = "";
            txtDeparture.Text = "";
            txtFlightName.Text = "";
            txtExecSeats.Text = "";
            txtExecFare.Text = "";
            txtEcoSeats.Text = "";
            txtEcoFare.Text = "";
            txtGenSeats.Text = "";
            txtGenFare.Text = "";
        }
    }

}
    
