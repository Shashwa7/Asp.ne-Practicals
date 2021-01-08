<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SimpleADO_Sql.aspx.cs" Inherits="DB_basics.SimpleADO_Sql" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADO Connection</title>
    <style>
        #form1, input, button{
            font-size: 1rem;
            margin-top: .3rem;
            font-family:monospace;
        }
        #display_data{
            margin-top:1rem;
            font-size: 1rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2> -- ADO.NET SQL CON/INSERT -- </h2>
        <div id="get_data">
            <asp:TextBox ID="et_name" runat="server" placeholder="Enter username"></asp:TextBox><br />
            <asp:TextBox ID="et_email" runat="server" placeholder="Enter email"></asp:TextBox><br />
            <asp:TextBox ID="et_pwd" runat="server" placeholder="Enter password"></asp:TextBox><br />
            <asp:Button ID="insertBtn" runat="server" Text="Insert" OnClick="insertBtn_Click" />
            <asp:Button ID="loadBtn" runat="server" Text="LoadData" OnClick="loadBtn_Click" />
        </div>

        <div id="display_data">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" style="margin-top: 1px">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
