<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="FinalProject.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         #appTitle {
            margin: 1.5rem;
        }
        .formContainer {
            width:80%;
            padding: 2rem;
            text-align:center;
             margin: auto;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formContainer">
        <div id="appTitle">
            <img src="images/pokemon-login.png" />
            <p class="h2 mb-6 text-center">Sign In</p>
        </div>

        <!-- User's Email -->
        <div class="form-group">
            <asp:TextBox ID="u_email" runat="server" TextMode="Email" class="form-control " placeholder="E-mail" />
            <!-- Req field validator -->
            <asp:RequiredFieldValidator ID="email_RqF" runat="server"
                ErrorMessage="Email field can't be empty!"
                ControlToValidate="u_email"
                ForeColor="Red" />
        </div>

        <!-- User Password -->
        <div class="form-group">
            <asp:TextBox ID="u_pwd" runat="server" TextMode="Password" class="form-control " placeholder="Password" />
            <!-- Req field validator -->
            <asp:RequiredFieldValidator ID="u_pwd_RqF" runat="server"
                ErrorMessage="Password field can't be empty!"
                ControlToValidate="u_pwd"
                ForeColor="Red" />
        </div>

        <div class="form-group">
            <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-info my-4 btn-block" OnClick="btnLogin_Click1" />
        </div>
       
        <a href="Register.aspx"" class="btn btn-dark btn-info my-4 btn-block">Register</a>
        <br>
        <br>
         <div>
            <asp:Label ID="showError" runat="server" Text="" class="alert alert-danger" role="alert" Visible="false"></asp:Label>
        </div>
    </div>

</asp:Content>
