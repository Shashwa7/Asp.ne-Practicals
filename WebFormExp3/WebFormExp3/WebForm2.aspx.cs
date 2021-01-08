using System;
using System.Text.RegularExpressions;


namespace WebFormExp3
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Check_Click(object sender, EventArgs e)
        {
            string inputTxt = userText.Text;
            inputTxt =  Regex.Replace(inputTxt, @"\W+", "").ToLower(); //removes all white spaces and special chars

            int i = inputTxt.Length-1;
            char[] mirror = new char[i+1];

            foreach(char ltr in inputTxt)
            {
                mirror[i] = ltr;
                i--;
            }
            string reverseTxt = new string(mirror);

            if (reverseTxt == inputTxt)
                result.Text = "Result: Indeed a Plaindrome!";
            else
                result.Text = "Result: Not a Plaindrome!";


        }
    }
}