<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exp15.aspx.cs" Inherits="Sem5_lab_practical_exam.Exp15" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exp 15</title>
    <style>
        .inputMargin {
            margin: .2rem 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>:: LINQ DB CONX ::</h2>
        <div id="insertOpr">
             <h3>:: Insert ::</h3>
            <asp:TextBox ID="et_userName" runat="server" class="inputMargin" placeholder="Enter Username"></asp:TextBox><br />
            <asp:TextBox ID="et_userEmail" runat="server" class="inputMargin" placeholder="Enter Email"></asp:TextBox><br />
            <asp:TextBox ID="et_userPwd" runat="server" class="inputMargin" placeholder="Enter Password"></asp:TextBox><br />
            <asp:Button ID="btnInsert" runat="server" Text="Insert User" OnClick="btnInsert_Click" />
        </div>

        <br />
        <hr />

        <div id="userGV">
            <h3>:: Display ::</h3>
            <asp:GridView ID="allUsers" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <br />
            <asp:Button ID="btnGetAllUser" runat="server" Text="Get All Users" OnClick="btnGetAllUser_Click" />
        </div>

        <br />
        <hr />
        <div id="deleteOpr">
            <h3>:: Delete::</h3>
            <asp:TextBox ID="et_dltUser" runat="server" class="inputMargin" placeholder="Enter Username"></asp:TextBox><br />
            <asp:Button ID="btnDltUser" runat="server" Text="Delete User" OnClick="btnDltUser_Click"  />
        </div>
        <br />
    </form>
</body>
</html>
