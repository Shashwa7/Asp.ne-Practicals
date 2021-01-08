<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorHandling.aspx.cs" Inherits="WebFormExp3.ErrorHandling" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

</head>
<body>
    <form id="form1" runat="server">

        <div id="appTitle">
            <p class="h2 mb-6 text-center">Error handling Exception</p>
        </div>


        <div class="form-group">

            <asp:TextBox ID="pincode" runat="server" class="form-control" placeholder="Enter Pincode" />

            <!-- Req field validator -->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ErrorMessage="Pincode field can't be empty!"
                ControlToValidate="pincode"
                ForeColor="Red"
                Display="Dynamic" />
        </div>

        <div>
            <span class="badge badge-warning">Only Numbers</span>
        </div>

        <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Register" class="btn btn-info my-4 btn-block" OnClick="btnSubmit_Click" />
        </div>

    </form>
</body>
</html>
