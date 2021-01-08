<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="MyCollections.aspx.cs" Inherits="FinalProject.MyCollections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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

        .infoContent {
            margin: 1rem;
            text-align: center;
        }

        .formContainer {
            text-align: center;
            padding: 1.5rem;
            min-width: 800px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formContainer">

        <div class="infoContent">

            <div class="info">
                <div class="appTitle">
                    <img src="https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png" />
                </div>
                <h2>
                    <img src="images/pikachu.svg" width="50" height="50" />
                    <img src="images/dratini.svg" width="50" height="50" />
                    <img src="images/jigglypuff.svg" width="50" height="50" />
                    <img src="images/snorlax.svg" width="50" height="50" />
                    Your Pokemon Collections
                    <img src="images/pokeballs.svg" width="50" height="50" />
                    <img src="images/game-console.svg" width="50" height="50" />
                    <img src="images/player.svg" width="50" height="50" />
                    <img src="images/pokedex.png" width="50" height="50"/>
                </h2>
            </div>
        </div>

        <br />
        <div id="pokemonContainer" class="pokemonBox" runat="server"></div>

    </div>

</asp:Content>
