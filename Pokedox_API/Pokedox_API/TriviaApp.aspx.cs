using Newtonsoft.Json.Linq;
using Pokedox_API.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web.UI.WebControls;

namespace Pokedox_API
{
    public partial class TriviaApp : System.Web.UI.Page
    {
        static List<Result> queBank = new List<Result>();
        static List<Answer> answers = new List<Answer>();
        static int que_no = 0;
        static bool revealAns = false;

        void fetchTriviaDetails(WebRequest triviaRequestObj)
        {  
            que_no = 0;
            queBank.Clear();
            answers.Clear();
            revealAns = false;
            triviaResult.Visible = false;

            WebResponse res;
            Stream res_stream;
            StreamReader res_stream_reader;
            JObject parsed_res;

            try
            {
                if (queBank.Count != 0)
                    queBank.Clear();

                //recording reponse for the request made
                res = triviaRequestObj.GetResponse();
                //getting the response stream
                res_stream = res.GetResponseStream(); //returns set of results

                //making the result accessible
                res_stream_reader = new StreamReader(res_stream);
                //Parsing the result set into string format
                string res_from_server = res_stream_reader.ReadToEnd();

                //further parsing string into JSON format
                parsed_res = JObject.Parse(res_from_server); //more readable 

                CSTrivia triviaList = parsed_res.ToObject<CSTrivia>();

                foreach (Result que in triviaList.results)
                {
                    queBank.Add(que);
                }
                triviaCardTemplate(queBank[que_no]);

            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Invalid CS Trivia Request!: {ex.Message}')</script>");
            }
        }

        void displayNextQuestion()
        { 
            if (que_no < queBank.Count-1)
                triviaCardTemplate(queBank[++que_no]);
            else
                triviaCardTemplate(queBank[que_no]);

        }

        void displayPreviousQuestion()
        {
            if (que_no > 0)
                triviaCardTemplate(queBank[--que_no]);
            else
                triviaCardTemplate(queBank[que_no]);
        }

        void displayResult()
        {

        revealAns = true;

            if (triviaBody.Visible == false)
                triviaBody.Visible = true;
            if (triviaResult.Visible == false)
                triviaResult.Visible = true;

          //showing all correct ans and highlighting wrong answered ques
          

            int total = 0;
            foreach(Answer ans in answers)
            {
                foreach(Result que in queBank)
                {
                    if(ans.que == que.question)
                    {
                        if(ans.selectedAns == que.correct_answer)
                        {
                           
                            total++;
                        }
                    }
                }
                

            }

            
            StringBuilder sb = new StringBuilder();
            sb.Append("<div class='jumbotron'>");
            sb.Append($"<h1 class='display-4'>Hey you scored: {total}/{queBank.Count()}</h1>");
            sb.Append($"<p class='lead'>Total Questions:{queBank.Count()}, Total Questions Answered:{answers.Count()} & Total Correct Answers: {total}</p>");
            sb.Append("<hr class='my-4'>");
            sb.Append("<p>If you are not satisfied with the result you can take a retest.</p>");
            sb.Append("<asp:Button runat='server' class='btn btn-primary btn-lg' Text='Take a Retest' onClick='csBtn_Click'/>");
            sb.Append("</div>");

            triviaResult.InnerHtml = sb.ToString();
        }
        void recordAns(Answer ans_store)
        {
            bool que_exists = false;

                if (!answers.Contains(ans_store))
                {
                    foreach(Answer ans in answers)
                    {
                        if (ans.que_no == ans_store.que_no)
                        {
                            ans.selectedAns = ans_store.selectedAns;
                            que_exists = true;
                        }
                    }
                    Debug.WriteLine($"Ques already exists: {que_exists} & ans is updated!");
                    if(!que_exists)
                    {
                        answers.Add(ans_store);
                        Debug.WriteLine($"Answer recorded sucessfully!");
                    }


                }
        }
        void updateStats()
        {
            answered.InnerText = $"{answers.Count()} of {queBank.Count()}";
        }
        void triviaCardTemplate(Result res)
        {

            if (triviaBody.Visible == false)
                triviaBody.Visible = true;

            //clearing the option list for every new iteration
            mcq_options.Items.Clear();

            question.Text= res.question.ToString();

           List<string> choices = new List<string>();


           foreach (string option in res.incorrect_answers)
            {
                choices.Add(option);
            }
            choices.Add(res.correct_answer);
          
           List<string> shuffled = choices.OrderBy(x => Guid.NewGuid()).ToList();

            Debug.WriteLine($"Reveal Result:{revealAns}");
            if(!revealAns)
            {
                mcq_options.Enabled = true;
                foreach (string option in shuffled)
                {
                    ListItem item = new ListItem(option);
                    if (answers.Count != 0)
                    {
                        foreach (Answer ans in answers)
                        {
                            if (ans.selectedAns == option && ans.que_no == que_no)
                            {
                                item.Selected = true;
                            }
                        }
                    }
                    mcq_options.Items.Add(item);
                }
            }
            else
            {
                mcq_options.Enabled = false;

                foreach (string option in shuffled)
                {

                    ListItem item = new ListItem(option);

                    if (answers.Count != 0)
                    {
                        foreach (Answer ans in answers)
                        {
                            if (ans.selectedAns == option && ans.que_no == que_no)
                            {
                                item.Selected = true;
                                if (ans.selectedAns == res.correct_answer)
                                    item.Attributes.Add("class", "text-success");
                                else
                                    item.Attributes.Add("class", "text-danger");
                            }

                        }
                    }

                   if(option == res.correct_answer)
                        item.Attributes.Add("class", "text-success");

                  
                    mcq_options.Items.Add(item);
                }

            }

            queNo.InnerText = $"{que_no+1} of {queBank.Count()}";
            updateStats();
        }

    protected void Page_Load(object sender, EventArgs e)
    {
            triviaBody.Visible = false;
    }

        protected void csBtn_Click(object sender, EventArgs e)
        {
            //Making API request
            string url = "https://opentdb.com/api.php?amount=10&category=18&type=multiple";
            WebRequest triviaRequestObj = WebRequest.Create(url);
            fetchTriviaDetails(triviaRequestObj);

        }

        protected void mathBtn_Click(object sender, EventArgs e)
        {
            //Making API request
            string url = "https://opentdb.com/api.php?amount=10&category=19&type=multiple";
            WebRequest triviaRequestObj = WebRequest.Create(url);
            fetchTriviaDetails(triviaRequestObj);
        }

        protected void gkBtn_Click(object sender, EventArgs e)
        {
            //Making API request
            string url = "https://opentdb.com/api.php?amount=10&category=9&type=multiple";
            WebRequest triviaRequestObj = WebRequest.Create(url);
            fetchTriviaDetails(triviaRequestObj);
        }

        protected void snBtn_Click(object sender, EventArgs e)
        {
            //Making API request
            string url = "https://opentdb.com/api.php?amount=10&category=17&type=multiple";
            WebRequest triviaRequestObj = WebRequest.Create(url);
            fetchTriviaDetails(triviaRequestObj);
        }

        protected void sportBtn_Click(object sender, EventArgs e)
        {
            //Making API request
            string url = "https://opentdb.com/api.php?amount=10&category=21&type=multiple";
            WebRequest triviaRequestObj = WebRequest.Create(url);
            fetchTriviaDetails(triviaRequestObj);
        }

        protected void nextBtn_Click(object sender, EventArgs e)
        {
                 displayNextQuestion();

        }
        protected void backBtn_Click(object sender, EventArgs e)
        {
                displayPreviousQuestion();
      
        }

        protected void mcq_options_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (triviaBody.Visible == false)
                triviaBody.Visible = true;

            string selectedAns = mcq_options.SelectedValue;
            Result queAsked = queBank[que_no];

            //inserting ans in the list
            Answer ans = new Answer(que_no, selectedAns,queAsked.question);
            recordAns(ans);

            //real time updating stats
            updateStats();
        }

        protected void submitTestBtn_Click(object sender, EventArgs e)
        {
            displayResult();
        }
    }
}