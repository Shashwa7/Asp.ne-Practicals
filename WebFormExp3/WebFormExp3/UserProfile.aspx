<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="WebFormExp3.UserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>
    <%-- Bootstrap --%>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            display: flex;
            height: 100vh;
            width: 100vw;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="card" id="cookieCard" style="width: 18rem;">
            <div class="card-header">
               <h5 class="card-title">Persistent Cookie</h5> 
            </div>
            <ul class="list-group list-group-flush">
                <asp:Label ID="user_ID" runat="server" class="list-group-item"></asp:Label>
                <asp:Label ID="user_name" runat="server" class="list-group-item"></asp:Label>    
                <asp:Label ID="user_email" runat="server" class="list-group-item"></asp:Label>
            </ul>
        </div>
        <div class="card" id="sessionCard" style="width: 18rem;">
            <div class="card-header">
               <h5 class="card-title">Saved Session</h5>
            </div>
            <ul class="list-group list-group-flush">
                <asp:Label ID="user_ID_s" runat="server" class="list-group-item"></asp:Label>
                <asp:Label ID="user_name_s" runat="server" class="list-group-item"></asp:Label>    
                <asp:Label ID="user_email_s" runat="server" class="list-group-item"></asp:Label>
                     
            </ul>
        </div>
    </form>
</body>
</html>
