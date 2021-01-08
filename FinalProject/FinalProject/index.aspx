<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FinalProject.WebForm1" %>

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
            padding: 1rem;
            border: 2px solid black;
            border-radius: 5px;
            width: 100%;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            flex-wrap: nowrap;
        }

        .info {
            flex: 2;
        }

        .img-container1 {
            flex: 1;
        }

        .img-container2 {
            flex: 1;
        }

        .formContainer {
            text-align: center;
            min-width: 1200px;
            padding: 1rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="formContainer">

        <div class="infoContent">
            <div class="img-container1">
                <img src="images/pikas.jpg" style="width: 100%; object-fit: contain;" />
            </div>


            <div class="info">
                <div class="appTitle">
                    <img src="https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png" />
                </div>
                <h2>
                    <img src="images/pikachu.svg" width="50" height="50">
                    Welcome to Pokedox
                <img src="images/game-console.svg" width="50" height="50">
                </h2>
                <h4>
                    <img src="images/api.svg" width="70" height="70">This website integrates POKEDOX API.</h4>
                <h4>
                    <img src="images/database.svg" width="50" height="50">Here you have the access to POKEDOX Database.</h4>
                <h4>
                    <img src="images/pokemon-trainer.svg" width="50" height="50">First you must sign-up for the service. (Absolutely Free)</h4>
                <h3>
                    <img src="images/pokemon-go.svg" width="50" height="50">What features available after signing up?</h3>
                <h4>
                    <img src="images/dratini.svg" width="50" height="50">User can search pokemon by name.</h4>
                <h4>
                    <img src="images/pgo.svg" width="70" height="70">Detailed Pokemon card with the proper sats!</h4>
                <h4>
                    <img src="images/videogames.svg" width="50" height="50">User can play pokemon games.</h4>
                <h4>
                    <img src="images/gotcha.svg" width="70" height="70">User can add pokemon to their collection.</h4>
            </div>

            <div class="img-container2">
                <img src="images/ashPika.png" style="width: 100%; object-fit: contain;" />
            </div>

        </div>

        <br />
        <asp:Button ID="btnSurprise" runat="server" class="btn btn-secondary btn-lg btn-block" Text="Surprise Me" OnClick="btnSurprise_Click" />
        <br />
        <div id="pokemonContainer" class="pokemonBox" runat="server"></div>

    </div>

</asp:Content>
