using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI.WebControls;

namespace DB_basics
{
    public partial class DisplayUserInGrid : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection conx;
        //Enryptor 
        EncryptPWD encryptObj = new EncryptPWD();


        protected void Page_Load(object sender, EventArgs e)
        {
                try
                {
                conx = new SqlConnection(connectionString); //establish a connection to the database.
                conx.Close();

                if(!Page.IsPostBack)
                    gvbind();
                }
                catch (Exception ex)
                {
                    Debug.WriteLine(ex.Message.ToString());
                }

        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.html");
        }

        // Bind GridView
        protected void gvbind()
        {
            conx.Open();

            SqlDataAdapter SqlAdapter = new SqlDataAdapter("select * from [dbo].[registered_users]", conx);

            DataTable DS = new DataTable();
            SqlAdapter.Fill(DS);
            UsersGrid.DataSource = DS;

            UsersGrid.DataBind();
            SqlAdapter.Dispose();

            conx.Close();

            if (DS.Rows.Count > 0)
            {
               UsersGrid.DataSource = DS;
               UsersGrid.DataBind();

            }
        }

        // Delete GridView's Row
        protected void UsersGrid_DeleteRow(object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve row-id which is deleting
            string id = UsersGrid.DataKeys[e.RowIndex].Value.ToString();
            string qry = $"Delete from  [dbo].[registered_users] where user_id= {int.Parse(id)}";
                SqlCommand cmd = new SqlCommand(qry, conx);

                conx.Open();

                cmd.ExecuteNonQuery();

                conx.Close();

                // Refresh the GridView
                gvbind();

            }

        protected void UsersGrid_EditRow(object sender, GridViewEditEventArgs e)
        {
            UsersGrid.EditIndex = e.NewEditIndex;
            gvbind();
        }


        protected void UsersGrid_UpdateRow(object sender, GridViewUpdateEventArgs e)
        {

            // find student id of edit row

            string u_id = UsersGrid.DataKeys[e.RowIndex].Value.ToString();

            // find updated values for updation
            //note: FindControl(textBox: ID); textBox belongs to Edit Item template 
            TextBox u_name = UsersGrid.Rows[e.RowIndex].FindControl("tb_uName") as TextBox; 
            TextBox f_name = UsersGrid.Rows[e.RowIndex].FindControl("tb_ufname") as TextBox;
            TextBox l_name = UsersGrid.Rows[e.RowIndex].FindControl("tb_ulname") as TextBox;
            DropDownList u_gender = UsersGrid.Rows[e.RowIndex].FindControl("ddl_genders") as DropDownList;
            TextBox u_email = UsersGrid.Rows[e.RowIndex].FindControl("tb_uEmail") as TextBox;
            TextBox u_pwd =  UsersGrid.Rows[e.RowIndex].FindControl("tb_uPwd") as TextBox;

            try
            {

                string qry = "UPDATE[dbo].[registered_users] SET [user_fname] = @fname, [user_lname] = @lname,[user_name] = @name,[user_gender] = @gender,[user_email] = @email, [user_pwd] = @pwd WHERE user_id = @id";
                SqlCommand cmd = new SqlCommand(qry, conx);

                cmd.Parameters.AddWithValue("@fname", f_name.Text.Trim());
                cmd.Parameters.AddWithValue("@lname", l_name.Text.Trim());
                cmd.Parameters.AddWithValue("@name", u_name.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", u_gender.SelectedValue.ToCharArray());
                cmd.Parameters.AddWithValue("@email", u_email.Text.Trim());
                cmd.Parameters.AddWithValue("@pwd", encryptObj.EncryptString(u_pwd.Text.ToString()));
                cmd.Parameters.AddWithValue("@id", int.Parse(u_id));
                conx.Open();

                cmd.ExecuteNonQuery();

                conx.Close();


                UsersGrid.EditIndex = -1;
                gvbind();
            }
            catch(Exception ex)
            {
                Debug.Write($"Updation Error: {ex.Message}");
            }
        }

        protected void UsersGrid_CancelUpdate(object sender, GridViewCancelEditEventArgs e)
        {
            UsersGrid.EditIndex = -1;
            gvbind();
        }


        // insert new record in database: OnSelectedIndexChanging
        protected void UsersGrid_InsertNewRow(object sender, GridViewSelectEventArgs e)

        {
            // find values for update

            TextBox uName = UsersGrid.FooterRow.FindControl("tb_insert_uName") as TextBox;
            TextBox u_fName = UsersGrid.FooterRow.FindControl("tb_insert_ufName") as TextBox;
            TextBox u_lName = UsersGrid.FooterRow.FindControl("tb_insert_ulName") as TextBox;
            TextBox uID = UsersGrid.FooterRow.FindControl("tb_insert_uID") as TextBox;
            DropDownList uGender = UsersGrid.FooterRow.FindControl("ddl_insert_genders") as DropDownList;
            TextBox uEmail= UsersGrid.FooterRow.FindControl("tb_insert_uEmail") as TextBox;
            TextBox uPwd= UsersGrid.FooterRow.FindControl("tb_insert_uPwd") as TextBox;


            // insert values into database
            string qry = "INSERT INTO [dbo].[registered_users]([user_id],[user_fname],[user_lname],[user_name] ,[user_gender],[user_email],[user_pwd]) VALUES (@id,@fname,@lname,@name,@gender,@email,@pwd)";
            SqlCommand command = new SqlCommand(qry, conx);

            command.Parameters.AddWithValue("@id", int.Parse(uID.Text.Trim()));
            command.Parameters.AddWithValue("@fname", u_fName.Text.Trim());
            command.Parameters.AddWithValue("@lname", u_lName.Text.Trim());
            command.Parameters.AddWithValue("@name", uName.Text.Trim());
            command.Parameters.AddWithValue("@gender", uGender.SelectedValue);
            command.Parameters.AddWithValue("@email", uEmail.Text.Trim());
            command.Parameters.AddWithValue("@pwd", encryptObj.EncryptString(uPwd.Text.ToString()));


            conx.Open();

            command.ExecuteNonQuery();

            conx.Close();

            gvbind();

        }

    }

 }