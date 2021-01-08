<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObjectCachingExample.aspx.cs" Inherits="WebFormExp3.ObjectCachingExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Caching Object</title>
    <style>
        #form1, input, button{
           font-size: 1.2rem;
           font-family: monospace;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="et_name" runat="server" placeholder ="Enter name"></asp:TextBox><br /><br />
            <asp:Button ID="cacheBtn" runat="server" Text="Cache Name" OnClick="cacheBtn_Click" />
            &nbsp;
            <asp:Button ID="loadBtn" runat="server" Text="Load" OnClick="loadBtn_Click" />
            <h3>-- Message --</h3>
            <asp:Label ID="lblinfo" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
