﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="DB_basics.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <title>Index</title>
</head>
<body>
    <form id="IndexPage" runat="server">

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Database Basix</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="registerUser.aspx">Register</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="LoginPage.aspx">Sign In</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="DisplayUserInGrid.aspx">Database</a>
                    </li>
                    
                </ul>
            </div>
        </nav>
    </form>
</body>
</html>
