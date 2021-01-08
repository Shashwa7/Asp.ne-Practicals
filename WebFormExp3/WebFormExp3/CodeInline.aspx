<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CodeInline.aspx.cs" Inherits="WebFormExp3.CodeInline" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Code Inline</title>
  
</head>
<body>
    <form id="form1" runat="server" style="font-family:monospace; font-size:20px;">
        <div>
            <h2>Inline Code: Print first 10 even no.</h2>
        </div>
        <div>
            <span>Number: </span> 
            <% for (int i = 0; i < 20; i += 2)
                {%>
                <span><%= i %> </span>
            <%} %>
        </div>
        <hr />
        <div>
            <h2>Code Behind: Print first 10 even no.</h2>
            <asp:Label ID="nums" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
