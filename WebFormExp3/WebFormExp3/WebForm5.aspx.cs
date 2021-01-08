using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormExp3
{
    public partial class WebForm5 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {

            if (Page.IsValid) {
                Response.Cookies["user"]["name"] = userName.Text;
                Response.Cookies["user"]["email"] = userEmail.Text;
                Response.Cookies["user"].Expires = DateTime.Now.AddMinutes(1);

                if (Request.Cookies["user"] != null)
                {
                    formStatus.Text =
                        "<h3>Form Submitted!</h3>" +
                        "<h3>Saved Cookies!</h3>" +
                        $"<h4>{Request.Cookies["user"].Value}</h4>";
                }
                else
                    formStatus.Text = "<h3>No cookies found</h3>";

            }
            else
                formStatus.Text = "<h3>Error Submitting the form!</h3>";
        }
    }
}