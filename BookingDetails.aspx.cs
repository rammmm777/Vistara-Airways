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
    public partial class BookingDetails1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        private void BindGrid()
        {
            string connStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblBookings", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }


        

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmpMenu.aspx");
        }

        

        

       
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteBooking")
            {
                int bookingId = Convert.ToInt32(e.CommandArgument);
                string connStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM tblBookings WHERE BookingID = @BookingID", con);
                    cmd.Parameters.AddWithValue("@BookingID", bookingId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    BindGrid(); // Refresh grid
                }
            }
        }
    }
}