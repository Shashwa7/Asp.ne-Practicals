using System;
namespace WebFormExp3
{
    public partial class WebForm7 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void Calculate(char opr, float x, float y)
        {
            switch (opr)
            {
                case 'a':
                    ShowResult.Text =  (x + y).ToString();
                    break;
                case 's':
                    ShowResult.Text = (x - y).ToString();
                    break;
                case 'p':
                    ShowResult.Text = (x * y).ToString();
                    break;
                case 'd':
                    ShowResult.Text =  (x / y).ToString();
                    break;
                case 'm':
                    ShowResult.Text = (x % y).ToString();
                    break;
                default:
                    ShowResult.Text =  "Invalid Response!";  
                    break;

            }
        }

        protected void operations_SelectedIndexChanged(object sender, EventArgs e)
        {
            char[] opr = operations.SelectedItem.Value.ToCharArray();
            float x = float.Parse(inputX.Text.ToString());
            float y = float.Parse(inputY.Text.ToString());

            Calculate(opr[0], x, y);
        }
    }
}