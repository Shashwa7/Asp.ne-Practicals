using System;

namespace FinalProject
{
    public partial class MySite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["trainer_name"] != null)
            {
                //Sign in session
                logIN.Visible = false;
                signUP.Visible = false;

                userInfo.Visible = true;
                logOUT.Visible = true;
                myCollection.Visible = true;

                //set useInfo text
                userInfo.Text ="User: "+Session["trainer_name"].ToString();

            }
            else
            {
                //default
                logIN.Visible = true;
                signUP.Visible = true;

                userInfo.Text = "";
                userInfo.Visible = false;
                logOUT.Visible = false;
                myCollection.Visible = false;

            }
        }

        protected void logIN_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void signUP_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void logOUT_Click(object sender, EventArgs e)
        {
            //destroying created session
            if (Session["trainer_name"] != null)
                Session["trainer_name"] = null;

            //redirecting to homepage
            Response.Redirect("index.aspx");
        }

        protected void myCollection_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyCollections.aspx");
        }

        protected void userInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
        }
    }
}