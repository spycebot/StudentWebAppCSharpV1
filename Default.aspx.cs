using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentWebAppCSharpV1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["StudentDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Role FROM Users WHERE Username=@user AND Password=@pass";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@user", txtUsername.Text);
                cmd.Parameters.AddWithValue("@pass", txtPassword.Text);
                conn.Open();
                object role = cmd.ExecuteScalar();

                if (role != null)
                {
                    Session["user"] = txtUsername.Text;
                    Session["role"] = role.ToString();
                    //Response.Redirect("StudentForm.aspx");
                    Response.Redirect("MainMenu.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid credentials.";
                }

            }
        }
    }
}