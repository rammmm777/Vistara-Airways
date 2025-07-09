using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AIRLINES_PROJECT
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            
            Response.Redirect("Login.aspx");
        }
    }
}