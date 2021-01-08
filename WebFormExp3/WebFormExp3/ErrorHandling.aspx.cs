using System;

namespace WebFormExp3
{
    public partial class ErrorHandling : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int pin = int.Parse(pincode.Text);
                Response.Write($"<script>alert('{pin} is a Valid Pincode!')</script>");
            }
            catch(Exception ex)
            {
                Response.Write($"<script>alert('{ex.Message}')</script>");
            }
        }
    }
}