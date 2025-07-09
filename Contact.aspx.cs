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
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            string connStr = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO tblContactUs (Name, Email, Message) VALUES (@Name, @Email, @Message)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Message", message);

                try
                {
                    con.Open();
                    int rows = cmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        
                        Response.Write("<script>alert('Thank you! Your message has been submitted.');</script>");
                        txtName.Text = "";
                        txtEmail.Text = "";
                        txtMessage.Text = "";
                    }
                    else
                    {
                        Response.Write("<script>alert('Something went wrong. Please try again.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
    }
    }
