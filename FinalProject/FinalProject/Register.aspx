<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FinalProject.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #appTitle {
            margin: 1.5rem;
        }

        .formContainer {
            width: 80%;
            padding: 2rem;
            text-align: center;
            margin: auto;
        }
    </style>
    
    <script src="customJS/ClientValidationScript.js"></script>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formContainer">
        <div id="appTitle">
            <img width="150px" src="images/pokemon-trainer.svg" />
            <p class="h2 mb-6 text-center">Sign up</p>
        </div>

        <!-- Users's Username -->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <div class="input-group-text">@</div>
                </div>
                <asp:TextBox ID="u_name" runat="server" type="text" class="form-control " placeholder="Username" />
            </div>

            <div>
                <span class="badge badge-warning">Only nums & letters.</span>
            </div>

            <!-- Req field validator -->
            <asp:RequiredFieldValidator ID="name_RqF" runat="server"
                ErrorMessage="User name field can't be empty!"
                ControlToValidate="u_name"
                ForeColor="Red" />
        </div>

        <!-- User's Email -->
        <div class="form-group">
            <asp:TextBox ID="u_email" runat="server" TextMode="Email" class="form-control " placeholder="E-mail" />
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Invalid!
            </div>
            <!-- Req field validator -->
            <asp:RequiredFieldValidator ID="email_RqF" runat="server"
                ErrorMessage="Email field can't be empty!"
                ControlToValidate="u_email"
                ForeColor="Red" />
        </div>

        <!-- User Password -->
        <div class="form-group">
            <asp:TextBox ID="u_pwd" runat="server" TextMode="Password" class="form-control " placeholder="Password" />
            <div class="regexBadges">
                <span class="badge badge-pill badge-secondary uRq">Upper char</span>
                <span class="badge badge-pill badge-secondary lRq">Lower char</span>
                <span class="badge badge-pill badge-secondary sRq">Special char</span>
                <span class="badge badge-pill badge-secondary dRq">Number</span>
                <span class="badge badge-pill badge-secondary minRq">8 chars long</span>
            </div>
            <!-- Req field validator -->
            <asp:RequiredFieldValidator ID="u_pwd_RqF" runat="server"
                ErrorMessage="Password field can't be empty!"
                ControlToValidate="u_pwd"
                ForeColor="Red" />
        </div>

        <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Register" class="btn btn-info my-4 btn-block" OnClick="btnSubmit_Click" />
        </div>
      
        <a href="login.aspx"" class="btn btn-dark btn-info my-4 btn-block">Login</a>
        <br>
    </div>
</asp:Content>
