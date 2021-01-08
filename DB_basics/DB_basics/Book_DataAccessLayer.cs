using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;


namespace DB_basics
{
    public class Book
    {
        public int ID { get; set; }
        public string name { get; set; }
        public string author{ get; set; }

    }
    public class Book_DataAccessLayer
    {
        public static List<Book> GetAllProducts()
        {
            List<Book> listProducts = new List<Book>();

            string CS = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection conx = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM[dbo].[books_tb]", conx);
                conx.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Book book = new Book();
                    book.ID = Convert.ToInt32(rdr["book_ID"]);
                    book.name = rdr["book_name"].ToString();
                    book.author = rdr["book_author"].ToString();

                    listProducts.Add(book);
                }
                conx.Close();
            }

            return listProducts;
        }
    }
}