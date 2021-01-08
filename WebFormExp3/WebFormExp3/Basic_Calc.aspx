<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Basic_Calc.aspx.cs" Inherits="WebFormExp3.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Basic Calculator</title>
    <style>
        body{
            display:flex;
            justify-content:center;
            align-items:center;
            width:100vw;
            height:100vh;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">.
        <h2>Calculator</h2>
        <div>
            <asp:TextBox ID="inputX" runat="server" placeholder="Enter num1"></asp:TextBox>
            <br /><br />
            <asp:TextBox ID="inputY" runat="server" placeholder="Enter num2"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:DropDownList ID="operations" runat="server" AutoPostBack="true" OnSelectedIndexChanged="operations_SelectedIndexChanged">
                <asp:ListItem> Select Operation</asp:ListItem>
                <asp:ListItem Value="a">Add</asp:ListItem>
                <asp:ListItem Value="s">Subtract</asp:ListItem>
                <asp:ListItem Value="p">Product</asp:ListItem>
                <asp:ListItem Value="d">Divide</asp:ListItem>
                <asp:ListItem Value="m">Mod</asp:ListItem>
            </asp:DropDownList>
      </div>
        <br />
      <div>
            <asp:TextBox ID="ShowResult" runat="server" Text="" placeholder="Result"></asp:TextBox>
      </div>   
        
    </form>
</body>
</html>
