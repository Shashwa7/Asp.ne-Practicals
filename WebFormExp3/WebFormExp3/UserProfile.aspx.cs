using System;
using System.Web;

namespace WebFormExp3
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* if (Application["userNameAs"] != null && Session["userNameSs"] != null)
             {
                username.Text = "Session State Stored username: " + Session["userNameSs"].ToString()+"_ss<br>";
                username.Text += "\nApplication State Stored username: " + Application["userNameAs"].ToString()+"_as";
             }
             else
                 username.Text = "Session Obj Expired!"; */

            
            HttpCookie savedCookie = Request.Cookies["UserInfo_p"];
            user_ID.Text = savedCookie["userID"];
            user_email.Text = savedCookie["userEmail"];
            user_name.Text = savedCookie["userName"];


           /* HttpCookie savedCookie2 = Request.Cookies["UserInfo_np"];
            if (savedCookie2 != null)
            {
                user_ID_s.Text = savedCookie2["userID"];
                user_email_s.Text = savedCookie2["userEmail"];
                user_name_s.Text = savedCookie2["userName"];
            }
            else
            {
                user_ID_s.Text = "data_exprired";
                user_email_s.Text = "data_exprired";
                user_name_s.Text = "data_exprired";
            } */
            
            user_ID_s.Text = Session["userID_s"].ToString();
            user_email_s.Text = Session["userEmail_s"].ToString();
            user_name_s.Text = Session["userName_s"].ToString();
        }
    }
}