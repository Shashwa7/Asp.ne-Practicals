
namespace WebFormExp3
{
    
    public class UserDB_table
    {
        private string name;
        private string email;
        private string country;

       public string getName()
        {
            return name;
        }

        public string getEmail()
        {
            return email;
        }

        public string getCountry()
        {
            return country;
        }


        public UserDB_table(string name, string email,string country)
        {
            this.name = name;
            this.email = email;
            this.country = country;
        }

    }
}