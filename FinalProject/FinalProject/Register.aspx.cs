using System;
using System.Configuration;
using System.Data.SqlClient;

namespace FinalProject
{
    public partial class Register : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection conx;

        protected void Page_Load(object sender, EventArgs e)
        {
            conx = new SqlConnection(connectionString); //establish a connection to the database.
        }
        bool check_if_user_already_exist(string trainerID, string trainerEmail)
        {
            bool userFound = false;

            //chekking if pokemon already in the collection
            string qryR = $"Select * FROM [dbo].[Pokemon_masterTable] WHERE [trainerName] = '{trainerID}' OR [trainerEmail] = '{trainerEmail}'";
            conx.Open();
            SqlCommand cmd = new SqlCommand(qryR, conx);
            SqlDataReader reader = cmd.ExecuteReader();

            //now we can simply check if any record was found or not
            if (reader.HasRows)
                userFound = true;
            else
                userFound = false;

            conx.Close();
            return userFound;
        }
        void insertUser()
        {
            try
            {
                if (u_name.Text != null && u_email.Text != null && u_pwd.Text != null)
                {
                    if (check_if_user_already_exist(u_name.Text, u_email.Text))
                    {
                        //user already exists.
                        //wither email or username matched
                        Response.Write($"<script>alert('User already exists with the username or useremail!')</script>");
                    }
                    else
                    {
                        string qry = "INSERT INTO [dbo].[Pokemon_masterTable] ([trainerName],[trainerEmail],[trainerPwd]) VALUES (@uname,@uemail,@upwd)";
                        SqlCommand cmd = new SqlCommand(qry, conx);
                        cmd.Parameters.AddWithValue("uname", u_name.Text.Trim());
                        cmd.Parameters.AddWithValue("uemail", u_email.Text.Trim());
                        cmd.Parameters.AddWithValue("upwd", u_pwd.Text.Trim());

                        conx.Open();
                        cmd.ExecuteNonQuery();  //here the data is being inserted in the DB
                        cmd.Dispose();
                        conx.Close();
                        Response.Write($"<script>alert('User:{u_name.Text} Registered Successfuly!')</script>");
                        u_email.Text = u_name.Text = u_pwd.Text = "";
                        Response.Redirect("login.aspx");
                    }
                }
                else
                {
                    Response.Write($"<script>alert('All Fields Are Required!')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}')</script>");
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            insertUser();
        }
    }
}