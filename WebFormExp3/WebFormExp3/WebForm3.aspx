<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebFormExp3.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calorie Calculator</title>
    <style>
        body{
            display:flex;
            padding:10px;
            font-family: monospace;
        }
        #AppName{
            color: rebeccapurple;
            font-size:25px;
            font-weight:bold;
        }
        form{
            width:100%;
            padding: 5px;
            padding: 5px;
        }
        label{
            padding: 2px;
        }
       
       #calcCalories{
           margin:5px;
           padding: 5px;
           background: cornflowerblue;
           border-radius:4px;
           color:aliceblue;
           font-weight:bold;
           border:none;
       }
       #finalStatus h2{
           color: darkorange;
       }
       #result{
           font-size: 20px;
           font-style: italic;
           color: blue;
           margin: 5px 5px;
       }
    </style>
</head>
<body>
   
    <form id="form1" runat="server">
        
        <div>
            <asp:Label runat="server" id="AppName"></asp:Label>
             <small> &copy;Shashwa7</small>
        </div>

        <div id="inputCntr">
          <h3><label>Fat:&nbsp;&nbsp;&nbsp;&nbsp; </label><asp:TextBox ID="fatInput" runat="server"></asp:TextBox></h3>  
          <h3><label>Carbs:&nbsp;&nbsp; </label>
              <asp:TextBox ID="carbsInput" runat="server"></asp:TextBox></h3>
          <h3><label>Protien: </label><asp:TextBox ID="protienInput" runat="server"></asp:TextBox></h3>
          <h3><label>Qnty:&nbsp;&nbsp;&nbsp;&nbsp;</label><asp:TextBox ID="quantityInput" runat="server"></asp:TextBox></h3>
        </div>

        <div id ="buttonCntr">
            <asp:Button ID="calcCalories" runat="server" Text="Calculate Claories" OnClick="calcCalories_Click" />
        </div>

        <div id="finalStatus">
            <h2>:: Your Total Calorie Intake ::</h2>
            <asp:Label runat="server" Text="" ID="result"></asp:Label>
        </div>
    </form>
</body>

</html>
