using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AIRLINES_PROJECT
{
    public partial class BookingDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFlightDetails();
                
            }
        }
        private void LoadFlightDetails()
        {
            string connStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT FlightCode, FlightName, Source, Destination, DepartureTime, ArrivalTime FROM tblFlights";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvFlights.DataSource = dt;
                gvFlights.DataBind();
            }
        }

       

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmpMenu.aspx");
        }
    }
}