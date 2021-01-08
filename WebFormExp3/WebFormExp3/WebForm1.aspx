<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebFormExp3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="padding: 5px;">
    <form id="form2" runat="server">

        <div>
            <h1>
                <asp:Label runat="server" ID="HelloWorldLabel"></asp:Label></h1>
        </div>

        <div id="colorPallets">
            <h3>:: Font Color Pallete ::
            </h3>
            <asp:RadioButtonList ID="colorPallete" runat="server" AutoPostBack="true" OnSelectedIndexChanged="colorPalleteSelector" RepeatDirection="Horizontal">
                <asp:ListItem Value="reg">Regular</asp:ListItem>
                <asp:ListItem Value="red">Red</asp:ListItem>
                <asp:ListItem Value="blue">Blue</asp:ListItem>
            </asp:RadioButtonList>

                <br />
        </div>

        <div id="fontStyles">
            <h3>:: Font Style ::
            </h3>
            <asp:CheckBoxList ID="fontStyle" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="fontStyle_SelectedIndexChanged">
                <asp:ListItem Value="bold">Bold</asp:ListItem>
                <asp:ListItem Value="italic">Italic</asp:ListItem>
                <asp:ListItem Value="underline">UnderLine</asp:ListItem>
            </asp:CheckBoxList>
        </div>


        <div id="mssgContainer">
            <h3>:: Type Message ::</h3>
            <asp:TextBox ID="txtMssg" runat="server" Font-Names="monospace" Height="57px" Width="211px" BackColor="#99CCFF"></asp:TextBox>
            <br />
            <br />

            <asp:Button ID="submitMssg" runat="server" OnClick="Button1_Click" Text="Submit Mssg" />

            <h3>:: User Message ::</h3>
            <asp:TextBox ID="userMssg" runat="server" Height="60px" Width="213px" Font-Names="monospace">
            </asp:TextBox>
        </div>


    </form>


</body>
</html>
