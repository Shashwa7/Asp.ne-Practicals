<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SqlDS.aspx.cs" Inherits="DB_basics.SqlDS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="user_id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="user_id" HeaderText="user_id" ReadOnly="True" SortExpression="user_id" />
                <asp:BoundField DataField="user_fname" HeaderText="user_fname" SortExpression="user_fname" />
                <asp:BoundField DataField="user_lname" HeaderText="user_lname" SortExpression="user_lname" />
                <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name" />
                <asp:BoundField DataField="user_gender" HeaderText="user_gender" SortExpression="user_gender" />
                <asp:BoundField DataField="user_email" HeaderText="user_email" SortExpression="user_email" />
                <asp:BoundField DataField="user_pwd" HeaderText="user_pwd" SortExpression="user_pwd" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:usersDBConnectionString %>"  SelectCommand="SELECT * FROM [registered_users] ORDER BY [user_id]"></asp:SqlDataSource>
    </form>
</body>
</html>
