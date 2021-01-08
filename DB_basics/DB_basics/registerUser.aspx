<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registerUser.aspx.cs" Inherits="DB_basics.WebForm1" %>

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

        #SignUp_form {
            width: 50vw;
            padding: .8rem;
        }
    </style>

    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

    <title>Registeration Form</title>
</head>
<body>
    <form id="SignUp_form" runat="server">
        <div id="appTitle">
            <p class="h2 mb-6 text-center">Sign up</p>
        </div>


        <!-- User's ID -->
        <div class="form-group">

            <asp:TextBox ID="u_ID" runat="server" TextMode="Number" class="form-control" placeholder="User ID" />

             <div>
                   <span class="badge badge-warning">Only nums.</span>
             </div>

            <!-- Req field validator -->
            <asp:RequiredFieldValidator ID="ID_RqF" runat="server"
                ErrorMessage="User ID field can't be empty!"
                ControlToValidate="u_ID"
                ForeColor="Red" />

        </div>



        <!-- User's First & Last name -->
        <div class="form-group">
            <div class="form-row mb-4">
                <div class="col">
                    <!-- First name -->
                    <asp:TextBox ID="u_Fname" runat="server" type="text" class="form-control " placeholder="First name" />
                    <!-- Req field validator -->
                    <asp:RequiredFieldValidator ID="Fname_RqF" runat="server"
                        ErrorMessage="Firstname field can't be empty!"
                        ControlToValidate="u_Fname"
                        ForeColor="Red" />
                </div>
                <div class="col">
                    <!-- Last name -->
                    <asp:TextBox ID="u_Lname" runat="server" type="text" class="form-control" placeholder="Last name" />
                    <!-- Req field validator -->
                    <asp:RequiredFieldValidator ID="Lname_RqF" runat="server"
                        ErrorMessage="Lastname field can't be empty!"
                        ControlToValidate="u_Lname"
                        ForeColor="Red" />
                </div>
            </div>

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

        <!-- User's Gneder -->
        <div class="form-group">
            <asp:DropDownList ID="ddl_genders" runat="server" CssClass="form-control textSize">
                <asp:ListItem>Select Gender</asp:ListItem>
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem>Other</asp:ListItem>
            </asp:DropDownList>


            <!-- Req field validator -->
            <asp:RequiredFieldValidator ID="gender_RqF" runat="server"
                ErrorMessage="Kindly select a valid gender!"
                ControlToValidate="ddl_genders"
                ForeColor="Red"
                InitialValue="Select Gender" />
            <!-- in-case user selects 'Select Gender' as value it will throw the error!-->
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
            <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click1" class="btn btn-info my-4 btn-block" />
        </div>

        <script src="Scripts/ClientSideValidation.js"></script>
    </form>

</body>
</html>
