using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace DB_basics
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection conx;

        protected void Page_Load(object sender, EventArgs e)
        {

            conx = new SqlConnection(connectionString); //establish a connection to the database.
            conx.Open();

        }
        public static byte[] HashPassword(string password)
        {
            var provider = new SHA1CryptoServiceProvider();
            var encoding = new UnicodeEncoding();
            return provider.ComputeHash(encoding.GetBytes(password));
        }


        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            try
            {
                EncryptPWD encryterObj = new EncryptPWD();
                if (conx.State == ConnectionState.Closed)
                    conx.Open();

                string sql = "INSERT INTO [dbo].[registered_users]([user_id],[user_fname],[user_lname],[user_name] ,[user_gender],[user_email],[user_pwd]) VALUES (@id,@f_name,@l_name,@name,@gender,@email,@pwd)";

                SqlCommand command = new SqlCommand(sql, conx);

                command.Parameters.AddWithValue("@id", int.Parse(u_ID.Text.Trim()));
                command.Parameters.AddWithValue("@f_name", u_Fname.Text.Trim());
                command.Parameters.AddWithValue("@l_name", u_Lname.Text.Trim());
                command.Parameters.AddWithValue("@name", u_name.Text.Trim());
                command.Parameters.AddWithValue("@gender", ddl_genders.SelectedValue);
                command.Parameters.AddWithValue("@email", u_email.Text.Trim());
                command.Parameters.AddWithValue("@pwd", encryterObj.EncryptString(u_pwd.Text.ToString()));
                


                command.ExecuteNonQuery();  //here the data is being inserted in the DB
                command.Dispose();
                //Response.Write("<script>alert('User Registered Successfully')</script>");
                conx.Close();

                Response.Redirect("LoginPage.aspx");     
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}')</script>");
            }

        }

    }
}