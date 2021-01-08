<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestRegexValidator.aspx.cs" Inherits="WebFormExp3.TestRegexValidator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        * {
            box-sizing: border-box;
        }

        html {
            font-size: 1.2rem;
        }

        body {
            width: 100vw;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        #appTitle {
            margin: 1.5rem;
        }

        #form1 {
            width: 50vw;
            padding: .8rem;
        }
    </style>

    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="appTitle">
            <p class="h2 mb-6 text-center">Password Regex Validator</p>
        </div>
        <!-- User Password -->
        <div class="form-group">
            <asp:TextBox ID="u_pwd" runat="server"  class="form-control " />
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
                ForeColor="IndianRed" 
                Display="Dynamic"
               />
            <!-- Regex Validator -->
            <asp:RegularExpressionValidator ID="u_pwd_regx" runat="server"  
                ControlToValidate="u_pwd" ErrorMessage="Invalid Password!"
                ValidationExpression="(?=.*\W)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                Display="Dynamic"
                ForeColor="IndianRed" />
        </div>

        <div class="form-group">
            <asp:Button ID="btn_pwd" runat="server" Text="SubmitPass" onClick="btn_pwd_Click" class="btn btn-info my-4 btn-block" />
        </div>
     
        <script src="Scripts/WebForms/PasswordValidationCS.js"></script>
    </form>
</body>
</html>
