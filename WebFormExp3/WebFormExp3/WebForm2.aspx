<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebFormExp3.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Detect Palindrome</h1>
        </div>

        <div id="app">
            <p>
                Enter Your Text:&nbsp&nbsp<asp:TextBox ID="userText" runat="server" Height="21px" Width="254px"></asp:TextBox>
            </p>
            <p>
               <asp:Button ID="Check" runat="server" Text="Check" OnClick="Check_Click" Width="91px" />
            </p>
            <p>
                <asp:Label ID="result" runat="server" Text="Result:"></asp:Label>
            </p>

        </div>

    </form>
</body>
</html>
