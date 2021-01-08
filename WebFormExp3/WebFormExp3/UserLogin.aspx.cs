using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormExp3
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null && Session["UserPwd"]!= null)
            {
                emailLogin.Text = Session["UserEmail"].ToString();
                pwdLogin.Text = Session["UserPwd"].ToString();
            }
            else
            {
                emailLogin.Text = "No session object found!";
                pwdLogin.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
}