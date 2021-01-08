<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="DB_basics.WebForm2" %>

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

        #login_form {
            width: 50vw;
            padding: .8rem;
            text-align: center;
        }
    </style>

    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

    <title>Login Page</title>
</head>
<body>
    <form id="login_form" runat="server">
        <div>
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

        <!-- login btn -->
        <div class="form-group">
            <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-info my-4 btn-block" OnClick="btnLogin_Click" />
        </div>
        <div class="d-flex justify-content-around">
            <div>
                <!-- Remember me -->
                <div class="custom-control custom-checkbox">
                    <asp:CheckBox ID="rememberMeCheck" runat="server" OnCheckedChanged="rememberMeCheck_CheckedChanged" AutoPostBack="true"/>
                    <label class="custom-control-label" for="defaultLoginFormRemember">Remember me</label>
                </div>
            </div>
            <div>
                <!-- Forgot password -->
                <a href="DisplayUserInGrid.aspx">Forgot password?</a>
            </div>
        </div>

        <div>
            <asp:Label ID="showError" runat="server" Text="" class="alert alert-danger" role="alert" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
