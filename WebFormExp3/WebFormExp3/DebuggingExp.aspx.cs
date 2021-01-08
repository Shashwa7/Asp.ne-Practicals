using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormExp3
{
    public partial class DebuggingExp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

          int calFact(int num)
        {
            if (num == 1)
                return 1;
            else
                return num * calFact(num - 1);
        }

        protected void btn_calcFact_Click(object sender, EventArgs e)
        {
            int num = Convert.ToInt32(tb_num.Text);
            tb_num.Text = calFact(num).ToString();
        }
    }
}