<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exp6.aspx.cs" Inherits="Sem5_lab_practical_exam.Exp6" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            font-family:monospace;
            padding: 10px;
        }
        #appName h1{
            color: darkblue;
        }
        form{
            padding: 10px;
            text-align:center;
            border: 1px solid;
        }
        #calculate{
            background-color:coral;
            font-weight:bold;
        }
        #resultCnt{
            margin:10px 0px;
            font-weight:bold;
            font-size:17px;
            color: darkblue;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="appName">
            <h1>Calories Burned Calculator</h1>
            &copy;shashwa7
        </div>
       
        <div id="clientInfo">
           <h3><label>Heigth(cm)&nbsp; </label><asp:TextBox ID="inHeight" runat="server" Width="288px"></asp:TextBox></h3>
           <h3><label>Weight(kg)&nbsp; </label><asp:TextBox ID="inWeight" runat="server" Width="288px"></asp:TextBox></h3>
           <h3><label>Age(yrs)&nbsp;&nbsp;&nbsp;&nbsp;</label><asp:TextBox ID="inAge" runat="server" Width="288px"></asp:TextBox></h3>
            <h3><label>Gender:<asp:RadioButtonList ID="inGender" runat="server" Height="16px" RepeatDirection="Horizontal" Width="196px" BorderStyle="None" TextAlign="Left" align="center">
                 <asp:ListItem value="m">Male</asp:ListItem>
                 <asp:ListItem value="f">Female</asp:ListItem>
             </asp:RadioButtonList>
                </label>
&nbsp;</h3>
            <h3>
                <label>Activity&nbsp;&nbsp;&nbsp;&nbsp;</label><asp:DropDownList ID="inActivity" runat="server" Width="294px" Height="19px" style="margin-left: 0px">
                    <asp:ListItem value="5">Light Training</asp:ListItem>
                    <asp:ListItem value="8">Moderate Training</asp:ListItem>
                    <asp:ListItem value="11">Vigorous Training</asp:ListItem>
                    <asp:ListItem value="15">High-Intensity Interval Training(HIIT)</asp:ListItem>
                </asp:DropDownList>
            </h3>
            <h3><label>Time(min)&nbsp;&nbsp; <asp:TextBox ID="inTime" runat="server" Width="288px" style="margin-bottom: 0px"></asp:TextBox> </label></h3>
        </div>
        <div id="btnCnt">
            <asp:Button ID="calculate" runat="server" Text="Calculate" OnClick="calculate_Click" Height="43px" Width="118px" BackColor="#FF9933" />
            <br />
        </div>

        <div id="resultCnt">
            <asp:Label ID="result" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>