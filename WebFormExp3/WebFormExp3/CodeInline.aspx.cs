using System;


namespace WebFormExp3
{
    public partial class CodeInline : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            nums.Text = "Numbers: ";
            for(int i = 0; i < 20; i += 2)
            {
                nums.Text += i + " ";
            }
        }
    }
}