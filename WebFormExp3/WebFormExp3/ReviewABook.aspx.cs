using System;

namespace WebFormExp3
{
    public partial class ReviewABook : System.Web.UI.Page
    {
        static float reviewTotal = 0;
        static float goodTotal = 0;
        static float avgTotal = 0;
        static float badTotal = 0;
       
        protected void Page_Load(object sender, EventArgs e)
        {
       
       
        }

        void updateReviewStats()
        {
            tr.Text =  $"Total Reviews: {reviewTotal}";
            tgr.Text = $"Good Reviews: {goodTotal}, {goodTotal / reviewTotal * 100}%";
            tsr.Text = $"Satifactory Reviews: {avgTotal}, {avgTotal / reviewTotal * 100}%";
            tbr.Text = $"Bad Reviews: {badTotal}, {badTotal / reviewTotal * 100}%";
        }
        protected void goodBtn_Click(object sender, EventArgs e)
        {
            reviewTotal++;
            goodTotal++;
            updateReviewStats();
        }

        protected void avgBtn_Click(object sender, EventArgs e)
        {
            reviewTotal++;
            avgTotal++;
            updateReviewStats();
        }

        protected void badBtn_Click(object sender, EventArgs e)
        {
            reviewTotal++;
            badTotal++;
            updateReviewStats();
        }
    }
}