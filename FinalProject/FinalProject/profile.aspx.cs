using FinalProject.classModels;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web.UI.WebControls;
using Type = FinalProject.classModels.Type;

namespace FinalProject
{
    public partial class profile : System.Web.UI.Page
    {
        // for capitalizing the text
        public TextInfo myTI = new CultureInfo("en-US", false).TextInfo;

        WebResponse res;
        Stream res_stream;
        StreamReader res_stream_reader;
        JObject parsed_res;
        static List<Pokedox> pokemonDB = new List<Pokedox>();
        Button btnAddPoke;
        static int pokemon_A, pokemon_B;

        //DB objects
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection conx;

        protected void Page_Load(object sender, EventArgs e)
        {
            //intializind conx string
            conx = new SqlConnection(connectionString); //establish a connection to the database

            //Generating dynamic btn for adding pokemon to collection
            btnAddPoke = new Button();

            btnAddPoke.Text = "Add defeated pokemon to your collection!";
            btnAddPoke.ID = "btnAddPoke";
            btnAddPoke.Click += new EventHandler(btnAddPoke_Click);
            btnAddPoke.ControlStyle.CssClass = "btn btn-success my-4 btn-block";
            BtnPannel.Controls.Add(btnAddPoke);
            btnAddPoke.Visible = false;
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
        bool check_if_pokemon_already_exist(int pokeID, string trainerID)
        {
            bool pokemonFound = false;
           
            //chekking if pokemon already in the collection
            string qryR = $"Select * FROM [dbo].[Pokemon_masterCollection] WHERE [trainerName] = '{trainerID}' AND [pokemon_id] = '{pokeID}'";
            conx.Open();
            SqlCommand cmd = new SqlCommand(qryR, conx);
            SqlDataReader reader = cmd.ExecuteReader();

            //now we can simply check if any record was found or not
            if (reader.HasRows)
                pokemonFound = true;
            else
                pokemonFound =  false;

            conx.Close();
            return pokemonFound;

        }
        void addPokemonToCollection(int pokemonID, string pokemonName)
        {
            //checking for session variable trainerName
            if (Session["trainer_name"] != null)
            {
                string trainerID = Session["trainer_name"].ToString();

                //cheking id pokemon already exist in the collection
                if (check_if_pokemon_already_exist(pokemonID, trainerID))
                {
                    //Don't add to collection
                    //avoid duplicate
                    Response.Write($"<script>alert('Pokemon:{pokemonName} already present in {trainerID} collection!')</script>");
                }
                else
                {
                    //Add pokemon to the collection
                    //establishing coonection with pokemon collection table
                    string qryW = "INSERT INTO [dbo].[Pokemon_masterCollection] ([pokemon_id],[pokemon_name],[trainerName]) VALUES (@pID,@pName,@tID)";
                    SqlCommand cmd = new SqlCommand(qryW, conx);
                    cmd.Parameters.AddWithValue("pID", pokemonID);
                    cmd.Parameters.AddWithValue("pName", pokemonName);
                    cmd.Parameters.AddWithValue("tID", trainerID);

                    conx.Open();
                    cmd.ExecuteNonQuery();  //here the data is being inserted in the DB
                    cmd.Dispose();
                    conx.Close();
                    Response.Write($"<script>alert('Pokemon:{pokemonName} added Successfuly to {trainerID} collection!')</script>");

                }
            }
            else
            {
                Response.Write($"<script>alert('You must be logged IN, to add any pokemon to collection!')</script>");
            }
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
        void detailedCardTemplate(Pokedox poke, string color = "")
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

        //stat calculation for card game
        int getStatTotal(Pokedox poke)
        {
            int stat_total = 0;
            foreach (Stat pokeStat in poke.stats)
            {
                stat_total += pokeStat.base_stat;
            }
            return stat_total;

        }


        void generatePokemonCards(int cardType)
        {
            if (cardType == 1)
            {
                foreach (Pokedox poke in pokemonDB)
                {
                    detailedCardTemplate(poke);
                }
            }
            else
            {
                //Card Game Cards
                Pokedox poke_A = pokemonDB[0];
                Pokedox poke_B = pokemonDB[1];

                //player1 avatar
                StringBuilder sb = new StringBuilder();
                sb.Append("<div style='width: 10rem; '>");
                sb.Append("<img src='images/pokemon-trainer.svg' style='width:100%'/>");
                sb.Append("</div>");
                pokemonContainer.InnerHtml += sb.ToString();

                if (getStatTotal(poke_A) > getStatTotal(poke_B))
                {
                    detailedCardTemplate(poke_A, "alert-success");
                    btnAddPoke.Text = $"Congratulations,You can add {myTI.ToTitleCase(poke_B.name)} to your collection!";
                    btnAddPoke.Visible = true;
                }
                else
                {
                    detailedCardTemplate(poke_A, "alert-danger");
                    btnAddPoke.Visible = false;
                }

                StringBuilder sb1 = new StringBuilder();
                sb1.Append("<div style='width: 18rem; '>");
                sb1.Append("<img src='images/fight.svg' style='width:100%'/>");
                sb1.Append("</div>");
                pokemonContainer.InnerHtml += sb1.ToString();

                if (getStatTotal(poke_A) < getStatTotal(poke_B))
                    detailedCardTemplate(poke_B, "alert-success");
                else
                    detailedCardTemplate(poke_B, "alert-danger");

                //player2 avatar
                StringBuilder sb2 = new StringBuilder();
                sb2.Append("<div style='width: 10rem; '>");
                sb2.Append("<img src='images/player.svg' style='width:100%'/>");
                sb2.Append("</div>");
                pokemonContainer.InnerHtml += sb2.ToString();
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            pokemonContainer.InnerHtml = null;
            pokemonDB.Clear();
            if (poke_search.Equals(""))
            {
                Response.Write("<script>alert('Provide pokemon name!')</script>");
            }
            else
            {
                searchPokemonByName(poke_search.Text.Trim());
                generatePokemonCards(1);
            }

        }

        protected void btnPlay_Click(object sender, EventArgs e)
        {
            pokemonContainer.InnerHtml = null;
            pokemonDB.Clear();

            Random rnd = new Random();
            pokemon_A = rnd.Next(1, 894);
            pokemon_B = rnd.Next(1, 894);
            searchPokemonByID(pokemon_A);
            searchPokemonByID(pokemon_B);
            generatePokemonCards(2);

        }

        protected void btnSurprise_Click(object sender, EventArgs e)
        {
            pokemonContainer.InnerHtml = null;
            pokemonDB.Clear();

            //Generating random poekmons on load
            List<int> randomNums = GetRandomNumber(1, 895, 10);
            foreach (int num in randomNums)
                searchPokemonByID(num);

            generatePokemonCards(1);
        }

        protected void btnAddPoke_Click(object sender, EventArgs e)
        {
            //adding pokemon to user's collection
            int poke_ID = pokemon_B;
            string poke_name = pokemonDB[1].name.ToString();
            addPokemonToCollection(poke_ID, poke_name);
        }
    }
}