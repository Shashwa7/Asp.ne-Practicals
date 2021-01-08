using System;
using System.Web.UI;

namespace WebFormExp3
{
    public partial class TestRegexValidator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_pwd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Response.Write("<script>alert('Password is Valid!')</script>");
                u_pwd.Text = "";
            }
            else
                Response.Write("<script>alert('Password is In-Valid!')</script>");
        }
    }
}