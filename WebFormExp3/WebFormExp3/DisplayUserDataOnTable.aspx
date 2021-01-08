<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayUserDataOnTable.aspx.cs" Inherits="WebFormExp3.DisplayUserDataOnTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" >
        <div>
            <h2>Register User</h2>
        </div>
        <div id="userCred">
            <asp:TextBox ID="tb_userName" runat="server" placeholder="Enter Username:"></asp:TextBox><br /><br />
            <asp:TextBox ID="tb_userEmail" runat="server"  placeholder="Enter Email:"></asp:TextBox><br /><br />
            <asp:TextBox ID="tb_userCountry" runat="server"  placeholder="Enter Country:"></asp:TextBox><br /><br />
            <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click" />
        </div><br />

        <!-- The HTML Markup consists of a Literal control. for dynamically displaying  table-->
        <asp:Literal ID = "TableUsers" runat = "server" />
        
    </form>
</body>
</html>
