using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AIRLINES_PROJECT
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = -1;
            }

        }



        protected void rblRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblRole.SelectedValue == "Admin")
            {
                MultiView1.ActiveViewIndex = 0;
            }
            else if (rblRole.SelectedValue == "Employee")
            {
                MultiView1.ActiveViewIndex = 1;
                MultiViewEmployee.ActiveViewIndex = 0; // Show sign-in view
            }
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {

                
                SqlCommand cmd = new SqlCommand("prc_login", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Username", txtAdminUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@pwd", txtAdminPassword.Text.Trim());

                con.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count == 1)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Login successful! Redirecting...";
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Invalid login. Try again.";
                }
            }
        }

        protected void btnEmpLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT COUNT(*) FROM tblEmployee WHERE Username = @username AND Password = @password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", txtEmpUsername.Text);
                cmd.Parameters.AddWithValue("@password", txtEmpPassword.Text);

                con.Open();
                int count = (int)cmd.ExecuteScalar();

                if (count > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Login successful! Redirecting...";
                    Response.Redirect("EmployeeDashboard.aspx");
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Invalid login. Try again.";
                }
            }
        }

        protected void btnEmpSignUp_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "INSERT INTO tblEmployee (Username, Email, Password) VALUES (@username, @email, @password)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", txtNewEmpUsername.Text);
                cmd.Parameters.AddWithValue("@email", txtNewEmpEmail.Text);
                cmd.Parameters.AddWithValue("@password", txtNewEmpPassword.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Signup successful. Please log in.');</script>");
                MultiViewEmployee.ActiveViewIndex = 0; 
            }
        }

        protected void lnkGoToSignIn_Click(object sender, EventArgs e)
        {
            MultiViewEmployee.ActiveViewIndex = 0;
        }

        protected void lnkGoToSignUp_Click(object sender, EventArgs e)
        {
            MultiViewEmployee.ActiveViewIndex = 1;
        }
    }

}


