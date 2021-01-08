using System;
using System.Collections.Generic;
using System.Data;
using System.Text;


namespace WebFormExp3
{
    public partial class DisplayUserDataOnTable : System.Web.UI.Page
    {
        static List<UserDB_table> allusers = new List<UserDB_table>();

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            showUsersInTable();
            clearAllFields();
        }

        private void showUsersInTable()
        {

            string username = tb_userName.Text;
            string userCountry = tb_userCountry.Text;
            string userEmail = tb_userEmail.Text;

            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Username", typeof(string)),
                    new DataColumn("Email", typeof(string)),
                    new DataColumn("Country",typeof(string)) });

            UserDB_table userObj = new UserDB_table(username, userEmail, userCountry);
            allusers.Add(userObj);
            foreach (UserDB_table user in allusers)
            {
                dt.Rows.Add(user.getName(), user.getEmail(), user.getCountry());
            }


            StringBuilder sb = new StringBuilder();
            //Table start.
            sb.Append("<table cellpadding='5' cellspacing='0' style='border: 1px solid #ccc;font-size: 9pt;font-family:Arial'>");

            //Adding HeaderRow.
            sb.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                sb.Append("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>" + column.ColumnName + "</th>");
            }
            sb.Append("</tr>");


            //Adding DataRow.
            foreach (DataRow row in dt.Rows)
            {
                sb.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + row[column.ColumnName].ToString() + "</td>");
                }
                sb.Append("</tr>");
            }

            //Table end.
            sb.Append("</table>");
            TableUsers.Text = sb.ToString();
        }

        private void clearAllFields()
        {
            tb_userName.Text = tb_userCountry.Text = tb_userEmail.Text = "";
        }
    }

}