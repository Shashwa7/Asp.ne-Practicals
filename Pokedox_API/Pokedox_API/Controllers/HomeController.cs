using Newtonsoft.Json.Linq;
using Pokedox_API.Models;
using System.IO;
using System.Net;
using System.Web.Mvc;

namespace Pokedox_API.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //Making API request
            WebRequest request = WebRequest.Create("https://pokeapi.co/api/v2/pokemon/1");
            
            //recording reponse for the request made
            WebResponse response = request.GetResponse();
            //getting the response stream
            Stream res_stream = response.GetResponseStream(); //returns set of results

            //making the result accessible
            StreamReader res_stream_reader = new StreamReader(res_stream);
            //Parsing the result set into string format
            string res_from_server = res_stream_reader.ReadToEnd();
            //further parsing string into JSON format
            JObject parsed_res = JObject.Parse(res_from_server); //more readable 

            //now finally mapping the JSON obj into C# object using the model class 'Pokemon.cs'
            Pokemon myPokemon = parsed_res.ToObject<Pokemon>();

            //now we have aceess to every property of the received pokemon
           


            return View(myPokemon);
        }
    }
}