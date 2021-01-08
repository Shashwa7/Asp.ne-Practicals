using System;
using System.Web.UI;


namespace WebFormExp3
{
    public partial class Registeration_Validation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Response.Write("<script>alert('User Successfully Registered!')</script>");
            }
            else
                Response.Write("<script>alert('User Registeration Failed!')</script>");
        }
    }
}