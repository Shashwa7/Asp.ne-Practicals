<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegisteration.aspx.cs" Inherits="WebFormExp3.UserRegisteration" Trace="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registeration</title>
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
            <h2>User Register</h2>
        </div>
   <div class="useInfo">
       
    <div class="form-group">
        <label class="control-label col-sm-2" for="username">Username:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
   
    <div class="form-group">
        <label class="control-label col-sm-2" for="email">Email:</label>
        <div class="col-sm-10">
         <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="pwd">Password:</label>
        <div class="col-sm-10">
        <asp:TextBox ID="pwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnSubmit" CssClass="btn btn-default btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click1" />
        </div>
    </div>

  </div>
 </form>
</body>
</html>
