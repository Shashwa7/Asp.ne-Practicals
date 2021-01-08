<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration_Validation.aspx.cs" Inherits="WebFormExp3.Registeration_Validation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        * {
            box-sizing: border-box;
        }

        html {
            font-size: 1rem;
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

    <title>Registeration Form</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <div id="appTitle">
            <p class="h2 mb-6 text-center">Sign up</p>
        </div>

        <!-- User's ID -->
        <div class="form-group">

            <asp:TextBox ID="u_ID" runat="server" class="form-control" placeholder="User ID" />

            <div>
                <span class="badge badge-warning">Atleast-1:(Num,Uppercase) & Min(char):7</span>
            </div>

            <!-- Req field validator -->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ErrorMessage="User's ID field can't be empty!"
                ControlToValidate="u_ID"
                ForeColor="Red"
                Display="Dynamic" />

            <!-- Regex Validator -->
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                ControlToValidate="u_ID" ErrorMessage="Invalid User ID!"
                ValidationExpression="(?=.*\d)(?=.*[A-Z]).{7,20}"
                Display="Dynamic"
                ForeColor="Red" />
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
                ForeColor="Red"
                Display="Dynamic" />
        </div>

        <!-- User's Age -->
        <div class="form-group">

            <asp:TextBox ID="u_age" runat="server" TextMode="Number" class="form-control" placeholder="User Age" />

            <div>
                <span class="badge badge-warning">Only nums.</span>
            </div>

            <!-- Req field validator -->
            <asp:RequiredFieldValidator ID="age_RqF" runat="server"
                ErrorMessage="User's Age field can't be empty!"
                ControlToValidate="u_age"
                ForeColor="Red"
                Display="Dynamic" />

            <!-- Range Vlaidator -->
            <asp:RangeValidator ID="RangeValidator1" runat="server"
                ControlToValidate="u_age"
                ErrorMessage="You must be 21-Yo or less!"
                ForeColor="Red"
                MaximumValue="21"
                MinimumValue="1"
                SetFocusOnError="True"
                Type=" Integer"></asp:RangeValidator>
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
                ForeColor="Red"
                Display="Dynamic" />

            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                ErrorMessage="Invalid Email!"
                ControlToValidate="u_email"
                ValidationExpression="([\w.%])+@([\w])+\.([a-z]){2,3}"
                Display="Dynamic"
                ForeColor="Red"></asp:RegularExpressionValidator>
        </div>

        <!-- User Password -->
        <div class="form-group">
            <asp:TextBox ID="u_pwd" runat="server" class="form-control" placeholder="Password" />
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
                ForeColor="Red" Display="Dynamic" />
            <!-- Regex Validator -->
            <asp:RegularExpressionValidator ID="u_pwd_regx" runat="server"
                ControlToValidate="u_pwd" ErrorMessage="Invalid Password!"
                ValidationExpression="(?=.*\W)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                Display="Dynamic"
                ForeColor="Red" />
        </div>
        <!-- User Re_enter Password -->
        <div class="form-group">
            <asp:TextBox ID="u_pwdCopy" runat="server" class="form-control" placeholder="Re-Enter Password" />

            <!-- Req field validator -->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ErrorMessage="Password field can't be empty!"
                ControlToValidate="u_pwdCopy"
                ForeColor="Red" Display="Dynamic" />
            <asp:CompareValidator ID="CompareValidator1" runat="server"
                ControlToCompare="u_pwd"
                ControlToValidate="u_pwdCopy"
                Display="Dynamic" 
                ErrorMessage="Password not matching."
                ForeColor="Red"></asp:CompareValidator>
        </div>

        <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Register" class="btn btn-info my-4 btn-block" OnClick="btnSubmit_Click" />
        </div>

        <script src="Scripts/ClientSideValidation.js"></script>

    </form>

</body>
</html>
