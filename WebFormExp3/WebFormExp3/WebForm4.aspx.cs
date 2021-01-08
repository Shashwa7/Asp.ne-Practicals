using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormExp3
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        double Calculate(char g, double h, double w, double a, double act, double t)
        {
            double cals;

            if (g.Equals('m'))
                cals = 66.5 + (13.75 * w) + (5.003 * h) - (6.775 * a);
            else
                cals = 655.1 + (9.563 * w) + (1.85 * h) - (4.676 * a);

            //Calculating calories to be burnt per hr as per client activity
            cals = (cals * act) / 24;

            //Actual Calories burnt by the client by performing the activity for t amount of time
            double calsBurnt = (cals * t) / 60; // min -> h

            return Math.Round(calsBurnt);
        }
        protected void calculate_Click(object sender, EventArgs e)
        {
            //Required Client Information
            double height = double.Parse(inHeight.Text);
            double weight = double.Parse(inWeight.Text);
            double age = double.Parse(inAge.Text);
            double activityValue = double.Parse(inActivity.SelectedValue);
            string activity = inActivity.SelectedItem.Text;
            char gender = char.Parse(inGender.SelectedValue);
            double time= double.Parse(inTime.Text);

            double totalCalsBurnt = Calculate(gender, height, weight, age, activityValue, time);

            result.Text = "<h1>------ Client Stats ------</h1>" +
                           $"Client Height : {height} cm" + "<br>" +
                           $"Client Weight: {weight} kg" + "<br>" +
                           $"Client Activity: {activity}" + "<br>" +
                           $"Performance Time: {time} min" + "<br>" +
                           $"Total Calories burnt: {totalCalsBurnt} kcal";

        }

        protected void inGender_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}