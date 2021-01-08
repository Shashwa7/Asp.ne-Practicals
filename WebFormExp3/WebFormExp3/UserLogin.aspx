<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="WebFormExp3.UserLogin" Trace="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
     <%-- Bootstrap --%>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
     <style>
        body{
            display: flex;
            height:100vh;
            width:100vw;
            flex-direction: column;
            justify-content:center;
            align-items:center;
            font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif !important;
        }

        #form1{
            padding:2rem;
            width:60vw;
        }
        .userInfo{
            border: 1px solid black;
        }
        #appTitle{
            margin: 2rem 0;
        }
        </style>
</head>
<body>
    <form id="form1" class="form-horizontal" runat="server">
       <div id="appTitle">
           <h2>User Login</h2>
       </div>
        <div class="useInfo">

            <div class="form-group">
                <label class="control-label col-sm-2" for="emailLogin">Email:</label>
                <div class="col-sm-10">
                 <asp:TextBox ID="emailLogin" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="pwdLogin">Password:</label>
                <div class="col-sm-10">
                 <asp:TextBox ID="pwdLogin" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
                </div>
            </div>

             <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="btnLogin" CssClass="btn btn-default btn-primary" runat="server" Text="Login" OnClick="btnLogin_Click" />
                </div>
             </div>

        </div>
    </form>
</body>
</html>
