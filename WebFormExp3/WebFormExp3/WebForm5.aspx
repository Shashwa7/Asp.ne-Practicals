<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="WebFormExp3.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Form Validation</title>
    <%-- Bootstrap --%>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body{
            display:flex;
            width:100vw;
            height: 100vh;
            flex-direction:column;
            justify-content:center;
            align-items:center;
        }
        .appTitle{
            color: darkblue;
        }
        form{
            text-align: center;
            border: 1px solid;
            border-radius: 1rem;
            width: 50vw;
            padding: 2rem;
        }
        .userInfo{
            margin: 1rem 0;
            padding:1rem;
            width: 100%;
        }

       .userInput{
           width:50%;
       }
       .inputLabels{
          display:inline-block;
          width:25%;
          color: darkblue;
          font-size:1.8rem;
          margin: 1rem 0;

       }
       .guideTextA, .guideTextB{
           display:block;
           text-align:center;
           font-weight:normal;
           font-size:small;
           color:dimgrey;
          font-family:monospace;
       }
       #btnContainer{
           margin: 2rem 0;
       }
       .validateData{
           font-size:small;
           color: crimson;
       }
       #btnContainer h3{
           color: forestgreen;
       }
       .bnt{
           margin: 1rem;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server"> 
        <div class="jumbotron jumbotron-fluid appTitle">
            <h1 class="display-4 text-success" >Form Validation</h1>
        </div>
        <div class="userInfo">
            <asp:Label ID="u_name" runat="server" Text="Username: " CssClass="inputLabels"></asp:Label>
            <asp:TextBox ID="userName" CssClass="userInput" runat="server"></asp:TextBox>  
            <label class="guideTextA">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Min: 4 chars & Only L_case chars + Digits</label>
               <div class="validateData">
                   <%-- Display = "Dynamic", the error mssg will not take any space in our html page doc until executed--%>
                   <%-- By default, Display = "static" which mean the err mssg will take some visible space on you html page--%>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="userName" ErrorMessage="Only Lower_chars and digits!" ValidationExpression="^([a-z0-9]){4,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="userName" ErrorMessage="Field Can't be empty!" Display="Dynamic"></asp:RequiredFieldValidator>
               </div>
        </div>
        <div class="userInfo">
             <asp:Label ID="f_name" runat="server" Text="Fullname: " CssClass="inputLabels"></asp:Label>
     
            <asp:TextBox ID="fullName" CssClass="userInput" runat="server"></asp:TextBox>
           
             <div class="validateData">
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="fullName" ErrorMessage="Field Can't be empty!" CSclass="valid-data" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
       </div>
        <div class="userInfo">
             <asp:Label ID="email" runat="server" Text="Email: " CssClass="inputLabels"></asp:Label>
            
            <asp:TextBox ID="userEmail" CssClass="userInput" runat="server"></asp:TextBox>
            
             <div class="validateData">
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="userEmail" ErrorMessage="Invalid Email" ValidationExpression="^([\w.%])+@([\w])+\.([a-z]){2,3}$" Display="Dynamic"></asp:RegularExpressionValidator>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="userEmail" ErrorMessage="Field Can't be empty!" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        
        <div class="userInfo">
            <asp:Label ID="pwd" runat="server" Text="Enter Password:" CssClass="inputLabels"></asp:Label>
            
            <asp:TextBox ID="userPwd" runat="server" CssClass="userInput" TextMode="Password"></asp:TextBox>
            <label class="guideTextB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Min: 8-chars => Inc(1:l_char,1:U_char,1:num,1:sp_char)</label>
          
            <div class="validateData">
             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="userPwd" ErrorMessage="Min:1(dig,U_char,l_char,s_char), min_length:8" ValidationExpression="^(?=.*\W)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="userPwd" ErrorMessage="Field Can't be empty!" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
         </div>

        <div class="userInfo">
            <asp:Label ID="Label1" runat="server" Text="Re-Enter Password:" CssClass="inputLabels" ></asp:Label>
           
            <asp:TextBox ID="cmfPwd" runat="server" CssClass="userInput"  TextMode="Password"></asp:TextBox> 
            
            <div class="validateData">
             <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Miss-matching password!" ControlToValidate="cmfPwd" ControlToCompare="userPwd" Display="Dynamic"></asp:CompareValidator>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cmfPwd" ErrorMessage="Field Can't be empty!" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
           
        </div>

        <div id="btnContainer">
            <asp:Button ID="submitBtn" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="submitBtn_Click"/>
            <br />
            <asp:Label ID="formStatus" runat="server" Text=""></asp:Label>
        </div>         
    </form>
</body>
</html>
