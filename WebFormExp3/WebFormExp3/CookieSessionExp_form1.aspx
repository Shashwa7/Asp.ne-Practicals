<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CookieSessionExp_form1.aspx.cs" Inherits="WebFormExp3.CookieSessionExp_form1" %>

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

         <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Register" class="btn btn-info my-4 btn-block" OnClick="btnSubmit_Click" />
        </div>

        <script src="Scripts/ClientSideValidation.js"></script>

    </form>
    
</body>
</html>
