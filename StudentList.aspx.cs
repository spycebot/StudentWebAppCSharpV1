using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentWebAppCSharpV1
{
    public partial class StudentList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
                BindGrid();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

        private void BindGrid()
        {
            string connStr = ConfigurationManager.ConnectionStrings["StudentDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Students", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvStudents.DataSource = dt;
                gvStudents.DataBind();
            }

        }
        protected void gvStudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvStudents.DataKeys[e.RowIndex].Value);
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentDBConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Students WHERE Id=@Id", conn);
                cmd.Parameters.AddWithValue("@Id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
                BindGrid();
            }
        }

        protected void gvStudents_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvStudents.EditIndex = e.NewEditIndex;
            BindGrid();
        }


        protected void gvStudents_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvStudents.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvStudents.Rows[e.RowIndex];
            string name = ((TextBox)row.Cells[1].Controls[0]).Text;
            string email = ((TextBox)row.Cells[2].Controls[0]).Text;
            string course = ((TextBox)row.Cells[3].Controls[0]).Text;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentDBConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Students SET Name=@Name, Email=@Email, Course=@Course WHERE Id=@Id", conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Course", course);
                cmd.Parameters.AddWithValue("@Id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
                gvStudents.EditIndex = -1;
                BindGrid();
            }
        }


        protected void gvStudents_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvStudents.EditIndex = -1;
            BindGrid();
        }

    }
}