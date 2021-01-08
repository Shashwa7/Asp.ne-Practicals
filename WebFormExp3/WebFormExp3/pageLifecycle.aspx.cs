using System;

namespace WebFormExp3
{

    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            //Work and It will assign the values to label.  
            Response.Write("Page Pre-Init<br>");
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            //Work and It will assign the values to label.  
            Response.Write("Page Init<br>");
        }
        protected void Page_InitComplete(object sender, EventArgs e)
        {
            //Work and It will assign the values to label.  
            Response.Write("Page Pre-Init-Complete<br>");
        }
        protected override void OnPreLoad(EventArgs e)
        {
            Response.Write("Page PreLoad<br>");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("Page Load<br>");
        }
        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            Response.Write("Page Load Complete<br>");
        }
        protected override void OnPreRender(EventArgs e)
        {
            Response.Write("Page Pre Render<br>");
        }
        protected override void OnPreRenderComplete(EventArgs e)
        {
            Response.Write("Page Pre Render Complete<br>");
        }
        protected void Page_UnLoad(object sender, EventArgs e)
        { 
          //  Response.Write("Page Unloaded(Web form Obj destroyed!)");
          // this will throw error because the form obj is destroyed and so does the Respond obj corrensponding to the form.
          //So Can't execute this using response obj.
        }
    }
}