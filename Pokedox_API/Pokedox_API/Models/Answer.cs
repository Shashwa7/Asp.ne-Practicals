namespace Pokedox_API.Models
{
    public class Answer
    {
        public int que_no { get; set; }
        public string que { get; set; }
        public string selectedAns { get; set; }

        public Answer(int que_no, string selectedAns, string que)
        {
            this.que_no = que_no;
            this.que = que;
            this.selectedAns = selectedAns;
        }
    }
}