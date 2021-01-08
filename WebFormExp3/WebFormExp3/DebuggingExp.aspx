<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DebuggingExp.aspx.cs" Inherits="WebFormExp3.DebuggingExp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        html{
            font-size:1.2rem;
        }
        #tb_num,#btn_calcFact{
            font-size: 1.1rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Check Factorial</h2>
        </div>

        <div>
            <asp:TextBox ID="tb_num" runat="server" placeholder="Enter num:"></asp:TextBox>           
        </div>
   
            <asp:Button ID="btn_calcFact" runat="server" Text="Fact!" OnClick="btn_calcFact_Click" />
        
        
    </form>
</body>
</html>
