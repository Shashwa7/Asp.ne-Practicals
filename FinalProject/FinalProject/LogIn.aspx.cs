using System;
using System.Configuration;
using System.Data.SqlClient;

namespace FinalProject
{
    public partial class LogIn : System.Web.UI.Page
    {

        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection conx;

        protected void Page_Load(object sender, EventArgs e)
        {
            conx = new SqlConnection(connectionString); //establish a connection to the database.
        }

        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            try
            {
                string user_email = u_email.Text.Trim().ToString();
                string user_pwd = u_pwd.Text.ToString();

                string sql = $"SELECT * FROM [dbo].[Pokemon_masterTable] WHERE [trainerEmail]  = '{user_email}' AND [trainerPwd] = '{user_pwd}' ";
               
                SqlCommand command = new SqlCommand(sql, conx);
                conx.Open();
                SqlDataReader result = command.ExecuteReader();

                if (result.HasRows)
                {
                    while (result.Read())
                    {
                        //Login Successful!
                        //create a session token
                        Session["trainer_name"] = result.GetValue(0).ToString();
                        Response.Redirect("profile.aspx");
                    }
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
    }
}