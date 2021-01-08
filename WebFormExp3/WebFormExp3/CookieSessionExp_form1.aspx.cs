using System;
using System.Web;


namespace WebFormExp3
{
    public partial class CookieSessionExp_form1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (u_ID.Text != null && u_email.Text != null && u_name.Text != null)
            {

                //setting up an persitent cookie that can be used until browser is closed
                HttpCookie cookieP = new HttpCookie("UserInfo_p");
                cookieP["userID"] = u_ID.Text.ToString();
                cookieP["userName"] = u_name.Text;
                cookieP["userEmail"] = u_email.Text;

                //setting up a non-persitent cookie(has expiry)
                HttpCookie cookieNP = new HttpCookie("UserInfo_np");
                cookieNP["userID"] = u_ID.Text.ToString();
                cookieNP["userName"] = u_name.Text;
                cookieNP["userEmail"] = u_email.Text;
                cookieNP.Expires = DateTime.Now.AddSeconds(5);

                //adding cookie
                Response.Cookies.Add(cookieNP);
                Response.Cookies.Add(cookieP);

                //setting up a session
                Session["userID_s"] = u_ID.Text.ToString();
                Session["userName_s"] = u_name.Text;
                Session["userEmail_s"] = u_email.Text;

                //redirecting to other activity
                Response.Redirect("UserProfile.aspx");
            }
            else
            {
                Response.Write("<script>alert('Form incomplete!')</script>");
            }
        }
    }
}