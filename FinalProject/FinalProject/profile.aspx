<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="FinalProject.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .appTitle{
            margin:1rem;
            padding:.5rem;
        }
         .pokemonBox {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-evenly;
            align-items: center;
        }

          .pokemonCard {
            z-index: -1;
        }

        .formContainer {
            text-align: center;
            padding: 1.5rem;
            min-width: 800px;
        }

        .searchDiv{
            padding:.5rem;
            margin:1rem;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formContainer">
        <div class="appTitle">
            <img src="images/goPlus.png" style="width:450px;" />
        </div>
        
        <div id="searchDiv">
            <asp:TextBox ID="poke_search" runat="server" class="form-control" placeholder="Enter Pokemon"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-dark my-4 btn-block" OnClick="btnSearch_Click" />
            <asp:Button ID="btnPlay" runat="server" Text="Play Game" class="btn btn-warning my-4 btn-block" OnClick="btnPlay_Click" />
            <asp:Button ID="btnSurprise" runat="server" Text="Surprise Me!" class="btn btn-info my-4 btn-block" OnClick="btnSurprise_Click" />
        </div>

        <div id="pokemonContainer" class="pokemonBox" runat="server"></div>
        <asp:Panel ID = "BtnPannel" runat="server">
</asp:Panel>
    </div>
</asp:Content>
