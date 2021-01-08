using System;
using System.Linq;


namespace Sem5_lab_practical_exam
{
    public partial class Exp15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void getAllUsers()
        {
            //gateway to our DB
            Exp15_DCDataContext data_context = new Exp15_DCDataContext();

            //retreive data from DB using LINQ query
            //setting data source for our gridview
            //this query will work with LIINQ to SQL provider in order to transact data
            //And all this is possible because of the dataCotnext obj

            allUsers.DataSource = from user in data_context.BasicUserTabels
                                  select user; //all user from table

            //finally binding all received data to our gridview
            allUsers.DataBind();
        }

        protected void btnGetAllUser_Click(object sender, EventArgs e)
        {
            getAllUsers();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            //using(): automatically closes the the DB
            using (Exp15_DCDataContext data_context = new Exp15_DCDataContext())
            {
                BasicUserTabel new_user = new BasicUserTabel
                {
                    u_name = et_userName.Text.ToString().Trim(),
                    u_email = et_userEmail.Text.ToString().Trim(),
                    u_password = et_userPwd.Text.ToString().Trim()
                };
                data_context.BasicUserTabels.InsertOnSubmit(new_user);
                data_context.SubmitChanges();
            }
            getAllUsers();
            et_userEmail.Text = et_userName.Text = et_userPwd.Text = "";
        }

        protected void btnDltUser_Click(object sender, EventArgs e)
        {
            using (Exp15_DCDataContext data_context = new Exp15_DCDataContext())
            {
                //deleting user using user's username
                BasicUserTabel user = data_context.BasicUserTabels.SingleOrDefault(x => x.u_name == et_dltUser.Text.ToString().Trim());
                data_context.BasicUserTabels.DeleteOnSubmit(user);
                data_context.SubmitChanges();
            }
            getAllUsers();
            et_dltUser.Text = "";
        }
    }
}