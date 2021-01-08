using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Lifetime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormExp3
{
    public partial class UserRegisteration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int a = 0;
                int b = 9 / a;
            }
            catch (Exception ex)
            {
                Trace.Warn("UserAction", "processing 9/a", ex);
            }
        }
       /* protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            Application["userNameAs"] = username.Text;
            Session["userNameSs"] = username.Text;
            Session["UserEmail"] = email.Text.ToString();
            Session["UserPwd"] = pwd.Text.ToString();

            Response.Redirect("UserLogin.aspx");
        } */

    }
}