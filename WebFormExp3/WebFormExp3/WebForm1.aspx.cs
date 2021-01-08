using System;
using System.Web.UI.WebControls;

namespace WebFormExp3
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void colorPalleteSelector(object sender, EventArgs e)
        {
            string color = colorPallete.SelectedValue;

            switch (color)
            {
                case "red": userMssg.Style.Add("color", color);  break;
                case "blue": userMssg.Style.Add("color", color);  break;
                default: userMssg.Style.Add("color", color);  break;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            userMssg.Text = txtMssg.Text;
        }

        protected void fontStyle_SelectedIndexChanged(object sender, EventArgs e)
        { 
            foreach(ListItem item in fontStyle.Items)
            {
                if (item.Selected)
                {
                    switch (item.Value)
                    {
                        case "bold": userMssg.Style["font-weight"] = item.Value; break;
                        case "italic": userMssg.Style["font-style"] = item.Value; break;
                        case "underline": userMssg.Style["text-decoration"] = item.Value; break;
                    }
                }
                else
                {
                    switch (item.Value)
                    {
                        case "bold": userMssg.Style["font-weight"] = ""; break;
                        case "italic": userMssg.Style["font-style"] = ""; break;
                        case "underline": userMssg.Style["text-decoration"] = ""; break;
                    }
                }
            }   
         
        }
    }
}