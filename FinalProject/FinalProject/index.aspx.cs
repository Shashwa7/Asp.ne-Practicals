﻿using FinalProject.classModels;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web.UI.WebControls;
using Type = FinalProject.classModels.Type;

namespace FinalProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // for capitalizing the text
        public TextInfo myTI = new CultureInfo("en-US", false).TextInfo;

        WebResponse res;
        Stream res_stream;
        StreamReader res_stream_reader;
        JObject parsed_res;
        static List<Pokedox> pokemonDB = new List<Pokedox>();

        protected void Page_Load(object sender, EventArgs e)
        {
            pokemonContainer.InnerHtml = null;
            pokemonDB.Clear();

            //Generating random poekmons on load
            List<int> randomNums = GetRandomNumber(1, 895, 10);
            foreach (int num in randomNums)
                searchPokemonByID(num);

            generatePokemonCards();
        }

        public List<int> GetRandomNumber(int min, int max, int totalNums)
        {
            var random = new Random();
            HashSet<int> numbers = new HashSet<int>();
            while (numbers.Count < totalNums)
            {
                numbers.Add(random.Next(min, max));
            }
            return numbers.ToList();
        }


        void fetchPokemonDetails(WebRequest pokeRequestObj)
        {

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
                Pokedox myPokemon = parsed_res.ToObject<Pokedox>();
                pokemonDB.Add(myPokemon);
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Invalid Pokemon!: {ex.Message}')</script>");
                pokemonContainer.Visible = false;
            }

        }

        void simpleCardTemplate(Pokedox poke)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append($"<div class='card border-primary  mb-3 pokemonCard' style='width: 18rem;'>");
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
            sb.Append("</div>");
            sb.Append("</div>");

            pokemonContainer.InnerHtml += sb.ToString();

        }
       

        void generatePokemonCards()
        {

            foreach (Pokedox poke in pokemonDB)
            {
                simpleCardTemplate(poke);
            }
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

        protected void btnSurprise_Click(object sender, EventArgs e)
        {
            pokemonContainer.InnerHtml = null;
            pokemonDB.Clear();

            //Generating random poekmons on load
            List<int> randomNums = GetRandomNumber(1, 895, 10);
            foreach (int num in randomNums)
                searchPokemonByID(num);

            generatePokemonCards();
        }

    }
}