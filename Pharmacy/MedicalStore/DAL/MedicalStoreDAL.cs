using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MedicalStore.DAL
{
    public class MedicalStoreDAL
    {
        private static readonly string connString =
            System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon2"].ConnectionString;

        public string Signup(string Name, string Contact, string House, string Designation, int Salary, string Email, string Gender, DateTime DOB, string UserN, string Pass)
        {
            string result;
            DataSet ds = new DataSet();
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlCommand sqlcommand1;
            try
            {
                sqlcommand1 = new SqlCommand("dbo.SignUp", sqlconn);
                sqlcommand1.CommandType = CommandType.StoredProcedure;
                sqlcommand1.Parameters.Add("@name", SqlDbType.VarChar, 40);
                sqlcommand1.Parameters.Add("@contact", SqlDbType.BigInt);
                sqlcommand1.Parameters.Add("@adrs", SqlDbType.VarChar, 50);
                sqlcommand1.Parameters.Add("@desig", SqlDbType.VarChar, 20);
                sqlcommand1.Parameters.Add("@sal", SqlDbType.Int);
                sqlcommand1.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                sqlcommand1.Parameters.Add("@gen", SqlDbType.VarChar, 5);
                sqlcommand1.Parameters.Add("@dob", SqlDbType.Date);
                sqlcommand1.Parameters.Add("@usrn", SqlDbType.VarChar, 25);
                sqlcommand1.Parameters.Add("@pass", SqlDbType.VarChar, 25);
                sqlcommand1.Parameters.Add("@output", SqlDbType.VarChar,50).Direction = ParameterDirection.Output;
                sqlcommand1.Parameters["@name"].Value = Name;
                sqlcommand1.Parameters["@contact"].Value = Contact;
                sqlcommand1.Parameters["@adrs"].Value = House;
                sqlcommand1.Parameters["@desig"].Value = Designation;
                sqlcommand1.Parameters["@sal"].Value = Salary;
                sqlcommand1.Parameters["@Email"].Value = Email;
                sqlcommand1.Parameters["@gen"].Value = Gender;
                sqlcommand1.Parameters["@dob"].Value = DOB;
                sqlcommand1.Parameters["@usrn"].Value = UserN;
                sqlcommand1.Parameters["@pass"].Value = Pass;
                sqlcommand1.ExecuteNonQuery();
                result = sqlcommand1.Parameters["@output"].Value.ToString();
            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return "Error|" + ex.Message.ToString();
            }

            finally
            {
                sqlconn.Close();
            }
            return result;
        }


        public string Login(string id, string pas)
        {
            string result;
            DataSet ds = new DataSet();
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlCommand sqlcommand;
            try
            {
                sqlcommand = new SqlCommand("dbo.Login", sqlconn);
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Parameters.Add("@usr", SqlDbType.VarChar, 20);
                sqlcommand.Parameters.Add("@pas", SqlDbType.VarChar, 20);
                sqlcommand.Parameters.Add("@result", SqlDbType.VarChar,200).Direction = ParameterDirection.Output;
                sqlcommand.Parameters["@usr"].Value = id;
                sqlcommand.Parameters["@pas"].Value = pas;
                sqlcommand.ExecuteNonQuery();
                result = sqlcommand.Parameters["@result"].Value.ToString();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error|" + ex.Message.ToString());
                return "Error|" + ex.Message.ToString();
            }
            finally
            {
                sqlconn.Close();
            }
            return result;
        }
    }
}