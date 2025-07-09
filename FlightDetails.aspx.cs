using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AIRLINES_PROJECT
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string conStr = "Data Source=RAMMMM\\SQLEXPRESS;Initial Catalog=VistaraDb;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                BindData();
            }
           
        }
        void BindData() {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblFlights", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvFlightDetails.DataSource = dt;
                gvFlightDetails.DataBind();
            }
        }
    }
}