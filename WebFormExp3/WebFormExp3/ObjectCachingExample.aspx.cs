using System;
using System.Text;

namespace WebFormExp3
{
    public partial class ObjectCachingExample : System.Web.UI.Page
    {
       
        protected void cacheBtn_Click(object sender, EventArgs e)
        {

            StringBuilder sb = new StringBuilder();

            if (Cache["userName"] == null)
            {
                sb.Append("Caching Processes Initiated<br/>");
                string name = et_name.Text;
                sb.Append("Storing name in cache ");
                sb.Append("for 5 seconds.<br/>");
                Cache.Insert("userName", name, null,
                DateTime.Now.AddSeconds(5), TimeSpan.Zero);
                
            }
            lblinfo.Text = sb.ToString();
        }

        protected void loadBtn_Click(object sender, EventArgs e)
        {
            if (Cache["userName"] != null)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("Retrieving user name<br/>");
                sb.Append($"Entered Name: {Cache["userName"]} <br />");
                lblinfo.Text = sb.ToString();
            }
            else
            {
                lblinfo.Text = "Cache obj is expired or doesn't exist.";
            }
        }
    }
}