using System;
using System.Configuration;
using System.Data.SqlClient;


namespace DB_basics
{
    public partial class SimpleADO_Sql : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection conx;

        protected void Page_Load(object sender, EventArgs e)
        {
            conx = new SqlConnection(connectionString); //establish a connection to the database.
            
        }

        void displayAllData()
        {
            try
            {
                SqlCommand qry = new SqlCommand("SELECT * FROM [dbo].[BasicUserTabel]", conx);
                conx.Open();

                SqlDataReader sqlDR = qry.ExecuteReader();
                GridView1.DataSource = sqlDR;
                GridView1.DataBind();
                conx.Close();
            }catch(Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}')</script>");
            }
        }

        void insertUser()
        {
            try
            {
                if (et_name.Text != null && et_email.Text != null && et_pwd.Text != null)
                {
                    string qry = "INSERT INTO [dbo].[BasicUserTabel] ([u_name],[u_email],[u_password]) VALUES (@uname,@uemail,@upwd)";
                    SqlCommand cmd= new SqlCommand(qry, conx);
                    cmd.Parameters.AddWithValue("uname", et_name.Text.Trim());
                    cmd.Parameters.AddWithValue("uemail", et_email.Text.Trim());
                    cmd.Parameters.AddWithValue("upwd", et_pwd.Text.Trim());

                    conx.Open();
                    cmd.ExecuteNonQuery();  //here the data is being inserted in the DB
                    cmd.Dispose();
                    conx.Close();
                    Response.Write($"<script>alert('User Inserted Successfuly!')</script>");

                }
                else
                {
                    Response.Write($"<script>alert('All Fields Are Required!')</script>");
                }
            }catch(Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}')</script>");
            }

        }

        protected void insertBtn_Click(object sender, EventArgs e)
        {
            insertUser();
        }

        protected void loadBtn_Click(object sender, EventArgs e)
        {
            displayAllData();
        }
    }
}