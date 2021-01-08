using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormExp3
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AppName.Text = "Calories Calculator";
        }

        protected void calcCalories_Click(object sender, EventArgs e)
        {
            float fatIntake = float.Parse(fatInput.Text);
            float carbsIntake = float.Parse(carbsInput.Text);
            float protienIntake = float.Parse(protienInput.Text);
            float quantity = float.Parse(quantityInput.Text);

            float totalCalories = (9 * fatIntake) + (4 * carbsIntake) + (4 * protienIntake)*quantity;

            result.Text = "Total Calories Consumed:" + totalCalories.ToString()+"kcal";
        }
    }
}