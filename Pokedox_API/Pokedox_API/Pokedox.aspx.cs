using Newtonsoft.Json.Linq;
using Pokedox_API.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Net;
using System.Text;
using Type = Pokedox_API.Models.Type;

namespace Pokedox_API
{
    public partial class Pokedox : System.Web.UI.Page
    {
        // for capitalizing the text
        public TextInfo myTI = new CultureInfo("en-US", false).TextInfo;

        WebResponse res;
        Stream res_stream;
        StreamReader res_stream_reader;
        JObject parsed_res;
        List<Pokemon> pokemonDB = new List<Pokemon>();

        void fetchPokemonDetails(WebRequest pokeRequestObj)
        {
            if (pokemonContainer.Visible == false)
                pokemonContainer.Visible = true;

            try
            {
                //recording reponse for the request made
                res = pokeRequestObj.GetResponse();
                //getting the response stream
                res_stream = res.GetResponseStream(); //returns set of results

                //making the result accessible
                res_stream_reader = new StreamReader(res_stream);
                //Parsing the result set into string format
                string res_from_server = res_stream_reader.ReadToEnd();
                //further parsing string into JSON format
                parsed_res = JObject.Parse(res_from_server); //more readable 

                //now finally mapping the JSON obj into C# object using the model class 'Pokemon.cs'
                Pokemon myPokemon = parsed_res.ToObject<Pokemon>();
                pokemonDB.Add(myPokemon);
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Invalid Pokemon!: {ex.Message}')</script>");
                pokemonContainer.Visible = false;
            }

        }
        int getStatTotal(Pokemon poke)
        {
            int stat_total = 0;
            foreach (Stat pokeStat in poke.stats)
            {
                stat_total += pokeStat.base_stat;
            }
            return stat_total;

        }

        void searchPokemonByID(int ID)
        {
            //Making API request
            string url = $"https://pokeapi.co/api/v2/pokemon/{ID}";
            WebRequest req = WebRequest.Create(url);
            fetchPokemonDetails(req);
        }

        void searchPokemonByName(string name)
        {
            //Making API request
            string url = $"https://pokeapi.co/api/v2/pokemon/{name}";
            WebRequest req = WebRequest.Create(url);
            fetchPokemonDetails(req);
        }

        void cardTemplate(Pokemon poke, string color = "")
        {
            StringBuilder sb = new StringBuilder();

            sb.Append($"<div class='card border-primary {color} mb-3 pokemonCard' style='width: 18rem;'>");
            sb.Append($"<img src = 'https://pokeres.bastionbot.org/images/pokemon/{poke.id}.png' class='card-img-top p-3' />");
            sb.Append("<div class='card-body'>");
            sb.Append($"<h5 class='card-title'>{ myTI.ToTitleCase(poke.name) }</h5>");

            sb.Append("<p class='card-text'>");
            sb.Append("<b>Type: </b>");

            foreach (Type pokeType in poke.types)
            {
                if (pokeType == poke.types[poke.types.Count - 1])
                    sb.Append($"<span>{myTI.ToTitleCase(pokeType.type.name)}.</span>");
                else
                    sb.Append($"<span>{myTI.ToTitleCase(pokeType.type.name)},</span>");
            }
            sb.Append("</p>");
            foreach (Stat pokeStat in poke.stats)
            {
                sb.Append("");
                sb.Append($"<p class='card-text'> <b>{myTI.ToTitleCase(pokeStat.stat.name)}:</b> {pokeStat.base_stat}</p>");
            }
            sb.Append("</div>");
            sb.Append("</div>");

            pokemonContainer.InnerHtml += sb.ToString();
        }

        void generatePokemonCards(int cardType)
        {
            if (cardType == 1)
            {
                foreach (Pokemon poke in pokemonDB)
                {
                    cardTemplate(poke);
                }
            }
            else
            {
                Pokemon poke_A = pokemonDB[0];
                Pokemon poke_B = pokemonDB[1];

                //player1 avatar
                StringBuilder sb = new StringBuilder();
                sb.Append("<div style='width: 10rem; '>");
                sb.Append("<img src='https://www.flaticon.com/svg/static/icons/svg/287/287226.svg' style='width:100%'/>");
                sb.Append("</div>");
                pokemonContainer.InnerHtml += sb.ToString();

                if (getStatTotal(poke_A) > getStatTotal(poke_B))
                    cardTemplate(poke_A, "alert-success");
                else
                    cardTemplate(poke_A, "alert-danger");

                StringBuilder sb1 = new StringBuilder();
                sb1.Append("<div style='width: 18rem; '>");
                sb1.Append("<img src='https://i.pinimg.com/originals/06/1d/de/061dde1c16977f7d2ae3a2c6976e6a99.png' style='width:100%'/>");
                sb1.Append("</div>");
                pokemonContainer.InnerHtml += sb1.ToString();

                if (getStatTotal(poke_A) < getStatTotal(poke_B))
                    cardTemplate(poke_B, "alert-success");
                else
                    cardTemplate(poke_B, "alert-danger");

                //player2 avatar
                StringBuilder sb2 = new StringBuilder();
                sb2.Append("<div style='width: 10rem; '>");
                sb2.Append("<img src='https://www.flaticon.com/svg/static/icons/svg/188/188978.svg' style='width:100%'/>");
                sb2.Append("</div>");
                pokemonContainer.InnerHtml += sb2.ToString();

            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            pokemonContainer.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            pokemonContainer.InnerHtml = null;
            string name = poke_search.Text.ToLower().Trim();
            searchPokemonByName(name);
            generatePokemonCards(1);
        }

        protected void btnSearchTop100_Click(object sender, EventArgs e)
        {
            pokemonContainer.InnerHtml = null;
            for (int pokemon = 1; pokemon <= 20; pokemon++)
            {
                searchPokemonByID(pokemon);  //pokemonDB
            }
            generatePokemonCards(1);
            
        }

        protected void btnBattle_Click(object sender, EventArgs e)
        {
            pokemonContainer.InnerHtml = null;
            Random rnd = new Random();
            int pokemon_A = rnd.Next(1, 895);
            int pokemon_B = rnd.Next(1, 895);
            searchPokemonByID(pokemon_A);
            searchPokemonByID(pokemon_B);
            generatePokemonCards(2);
           
        }
    }
}