<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pokedox.aspx.cs" Inherits="Pokedox_API.Pokedox" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pokedox</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <style>
        * {
            box-sizing: border-box;
        }

        html {
            font-size: 1rem;
        }

        #appTitle {
            margin: 1.5rem;
            text-align: center;
        }

        #form1 {
            padding: .8rem;
            width: 100%;
        }

        #pokemonContainer {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-evenly;
            align-items: center;
            padding: 1rem;
            border: 1px solid black;
            border-radius: 10px;
        }

        .pokemonCard {
            margin: .5rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div id="appTitle">
            <img src="https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png" />
        </div>

        <div class="form-group">
            <asp:TextBox ID="poke_search" runat="server" class="form-control" placeholder="Enter Pokemon"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-dark my-4 btn-block" OnClick="btnSearch_Click" />
        </div>
        <div class="form-group">
            <asp:Button ID="btnSearchTop100" runat="server" Text="Search Top 100 Pokemons" class="btn btn-success my-4 btn-block" OnClick="btnSearchTop100_Click" />
        </div>
        <div class="form-group">
            <asp:Button ID="btnBattle" runat="server" Text="Random Battle" class="btn btn-danger my-4 btn-block" OnClick="btnBattle_Click" />
        </div>

        <div id="pokemonContainer" runat="server"></div>

    </form>
</body>
</html>
