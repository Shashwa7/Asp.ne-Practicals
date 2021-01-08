using System;
using System.Linq;


namespace DB_basics
{
    public partial class linqDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        void getAllUsers()
        {
            //gateway to our DB
            BasicLinqDB_classDataContext dataContext = new BasicLinqDB_classDataContext();

            //retreive data from DB using LINQ query
            //setting data source for our gridview
            //this query will work with LIINQ to SQL provider in order to transact data
            //And all this is possible because of the dataCotnext obj

            allUsers.DataSource = from user in dataContext.BasicUserTabels
                                  select user; //all user from table

            //finally binding all received data to our gridview
            allUsers.DataBind();
        }
    }
}