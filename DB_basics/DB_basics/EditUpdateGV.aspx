<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUpdateGV.aspx.cs" Inherits="DB_basics.EditUpdateGV" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="u_name" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="u_name" HeaderText="u_name" ReadOnly="True" SortExpression="u_name" />
                    <asp:BoundField DataField="u_email" HeaderText="u_email" SortExpression="u_email" />
                    <asp:BoundField DataField="u_password" HeaderText="u_password" SortExpression="u_password" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:usersDBConnectionString %>" DeleteCommand="DELETE FROM [BasicUserTabel] WHERE [u_name] = @u_name" InsertCommand="INSERT INTO [BasicUserTabel] ([u_name], [u_email], [u_password]) VALUES (@u_name, @u_email, @u_password)" SelectCommand="SELECT * FROM [BasicUserTabel]" UpdateCommand="UPDATE [BasicUserTabel] SET [u_email] = @u_email, [u_password] = @u_password WHERE [u_name] = @u_name">
                <DeleteParameters>
                    <asp:Parameter Name="u_name" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="u_name" Type="String" />
                    <asp:Parameter Name="u_email" Type="String" />
                    <asp:Parameter Name="u_password" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="u_email" Type="String" />
                    <asp:Parameter Name="u_password" Type="String" />
                    <asp:Parameter Name="u_name" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
