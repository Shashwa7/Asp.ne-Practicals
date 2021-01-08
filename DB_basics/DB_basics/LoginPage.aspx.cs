using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DB_basics
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection conx;
        protected void Page_Load(object sender, EventArgs e)
        {

            conx = new SqlConnection(connectionString); //establish a connection to the database.
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                EncryptPWD decryptObj = new EncryptPWD();
                string user_email = u_email.Text.Trim().ToString(); 
                string user_pwd = u_pwd.Text.ToString();

                string sql = $"SELECT[user_email],[user_pwd] FROM[dbo].[registered_users] WHERE [user_email]  = @email";
                SqlCommand command = new SqlCommand(sql, conx);
                command.Parameters.AddWithValue("@email", user_email);

                conx.Open();
                SqlDataReader result = command.ExecuteReader();
                if (result.Read() && decryptObj.DecryptString(result["user_pwd"].ToString()) == user_pwd)
                {
                    Response.Redirect("DisplayUserInGrid.aspx");
                }
                else
                {
                    showError.Visible = true;
                    showError.Text = "Incorrect User email or password!";
                }
                conx.Close();
            }
            catch (Exception ex)
            {
                Response.Write($"Error: {ex.Message}");
            }

        }

        protected void rememberMeCheck_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}