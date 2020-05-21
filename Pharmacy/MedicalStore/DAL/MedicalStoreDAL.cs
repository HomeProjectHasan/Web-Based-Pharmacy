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

        public string PurchaseMedicine(string DealerID, string MedicineName, DateTime PurchaseDate, int Quantity, float price, DateTime MFD, DateTime EXP, string NewFlag)
        {
            string result;
            DataSet ds = new DataSet();
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlCommand sqlcommand;
            try
            {
                sqlcommand = new SqlCommand("dbo.PurchaseMedicine", sqlconn);
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Parameters.Add("@DealerID", SqlDbType.VarChar, 20);
                sqlcommand.Parameters.Add("@MedicineName", SqlDbType.VarChar, 100);
                sqlcommand.Parameters.Add("@Date", SqlDbType.Date);
                sqlcommand.Parameters.Add("@Quantity", SqlDbType.Int);
                sqlcommand.Parameters.Add("@price", SqlDbType.Float);
                sqlcommand.Parameters.Add("@MFD", SqlDbType.Date);
                sqlcommand.Parameters.Add("@EXP", SqlDbType.Date);
                sqlcommand.Parameters.Add("@NewFlag", SqlDbType.VarChar, 1);
                sqlcommand.Parameters.Add("@result", SqlDbType.VarChar, 200).Direction = ParameterDirection.Output;

                sqlcommand.Parameters["@DealerID"].Value = DealerID;
                sqlcommand.Parameters["@MedicineName"].Value = MedicineName;
                sqlcommand.Parameters["@Date"].Value = PurchaseDate;
                sqlcommand.Parameters["@Quantity"].Value = Quantity;
                sqlcommand.Parameters["@price"].Value = price;
                sqlcommand.Parameters["@MFD"].Value = MFD;
                sqlcommand.Parameters["@EXP"].Value = EXP;
                sqlcommand.Parameters["@NewFlag"].Value = NewFlag;
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

        public string SellMedicine(string CustomerName, string CustomerAddress, String CustomerContact, string MedicineID, DateTime SellDate, int Quantity, string NewFlag)
        {
            string result;
            DataSet ds = new DataSet();
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlCommand sqlcommand;
            try
            {
                sqlcommand = new SqlCommand("dbo.SellMedicine", sqlconn);
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Parameters.Add("@CustomerName", SqlDbType.VarChar, 50);
                sqlcommand.Parameters.Add("@MedicineID", SqlDbType.VarChar, 100);
                sqlcommand.Parameters.Add("@Date", SqlDbType.Date);
                sqlcommand.Parameters.Add("@Quantity", SqlDbType.Int);
                sqlcommand.Parameters.Add("@Address", SqlDbType.VarChar, 100);
                sqlcommand.Parameters.Add("@Contact", SqlDbType.BigInt);
                sqlcommand.Parameters.Add("@NewFlag", SqlDbType.VarChar, 1);
                sqlcommand.Parameters.Add("@result", SqlDbType.VarChar, 200).Direction = ParameterDirection.Output;

                sqlcommand.Parameters["@CustomerName"].Value = CustomerName;
                sqlcommand.Parameters["@MedicineID"].Value = MedicineID;
                sqlcommand.Parameters["@Date"].Value = SellDate;
                sqlcommand.Parameters["@Quantity"].Value = Quantity;
                sqlcommand.Parameters["@Address"].Value = CustomerAddress;
                sqlcommand.Parameters["@Contact"].Value = CustomerContact;
                sqlcommand.Parameters["@NewFlag"].Value = NewFlag;
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
        public string creatdealer(string DealerName, string DealerContact, string DealerAddress, string DealerEmail, string Newflag, string CompanyName, string CompanyLocation, string CompanyContact)
        {
            string result;
            DataSet ds = new DataSet();
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlCommand sqlcommand;
            try
            {
                sqlcommand = new SqlCommand("dbo.CreatDealer", sqlconn);
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Parameters.Add("@DName", SqlDbType.VarChar, 50);
                sqlcommand.Parameters.Add("@DContact", SqlDbType.BigInt);
                sqlcommand.Parameters.Add("@DAddress", SqlDbType.VarChar, 100);
                sqlcommand.Parameters.Add("@DEmail", SqlDbType.VarChar, 100);
                sqlcommand.Parameters.Add("@NewFlag", SqlDbType.VarChar, 1);
                sqlcommand.Parameters.Add("@CName", SqlDbType.VarChar, 100);
                sqlcommand.Parameters.Add("@CLocation", SqlDbType.VarChar, 40);
                sqlcommand.Parameters.Add("@CContact", SqlDbType.BigInt);
                sqlcommand.Parameters.Add("@result", SqlDbType.VarChar, 200).Direction = ParameterDirection.Output;

                sqlcommand.Parameters["@DName"].Value = DealerName;
                sqlcommand.Parameters["@DContact"].Value = DealerContact;
                sqlcommand.Parameters["@DAddress"].Value = DealerAddress;
                sqlcommand.Parameters["@DEmail"].Value = DealerEmail;
                sqlcommand.Parameters["@NewFlag"].Value = Newflag;
                sqlcommand.Parameters["@CName"].Value = CompanyName;
                sqlcommand.Parameters["@CLocation"].Value = CompanyLocation;
                sqlcommand.Parameters["@CContact"].Value = CompanyContact;
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


        public DataTable getDealerList()
        {
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlDataAdapter datatable = new SqlDataAdapter();
            DataTable searchresult = new DataTable();
            try
            {
                datatable = new SqlDataAdapter("SELECT DealerID, Name from Dealer", sqlconn);
                datatable.Fill(searchresult);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }
            finally
            {
                sqlconn.Close();
            }
            return searchresult;
        }

        public DataTable showSellBill(string id, int quantity)
        {
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlDataAdapter datatable = new SqlDataAdapter();
            DataTable searchresult = new DataTable();
            try
            {
                datatable = new SqlDataAdapter(String.Format("SELECT MedicineID, MedicineName, {1} as Quantity, Price UnitPrice, cast({1} as INT) * price TotalPrice from Medicine where MedicineID = '{0}'", id, quantity), sqlconn);
                datatable.Fill(searchresult);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }
            finally
            {
                sqlconn.Close();
            }
            return searchresult;
        }

        public DataTable showDelearDetailsForBill(string dealerId)
        {
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlDataAdapter datatable = new SqlDataAdapter();
            DataTable searchresult = new DataTable();
            try
            {
                datatable = new SqlDataAdapter(String.Format("select Name, CompanyName, ContactNo, Email from Dealer D , Company C where D.CompanyID = c.CompanyID and DealerID = '{0}'", dealerId), sqlconn);
                datatable.Fill(searchresult);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }
            finally
            {
                sqlconn.Close();
            }
            return searchresult;
        }

        public DataTable getMedicineList()
        {
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlDataAdapter datatable = new SqlDataAdapter();
            DataTable searchresult = new DataTable();
            try
            {
                datatable = new SqlDataAdapter("SELECT MedicineID,MedicineName,CompanyName, cast(Manufacturing as date) Manufacturing , Expiry,Price, CurrentQuantity FROM Medicine M , Company C where M.CompanyID=C.CompanyID", sqlconn);
                datatable.Fill(searchresult);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }
            finally
            {
                sqlconn.Close();
            }
            return searchresult;
        }

        public DataTable searchMedicine(string key, string value)
        {
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlDataAdapter datatable = new SqlDataAdapter();
            DataTable searchresult = new DataTable();
            try
            {
                if (key == "ID_Click")
                {
                    datatable = new SqlDataAdapter(String.Format("SELECT MedicineID,MedicineName,CompanyName, cast(Manufacturing as date) Manufacturing , Expiry,Price, CurrentQuantity FROM Medicine M , Company C where M.CompanyID=C.CompanyID and MedicineID LIKE '%{0}%'",value), sqlconn);

                }
                else if (key == "Name_Click")
                {
                    datatable = new SqlDataAdapter(String.Format("SELECT MedicineID,MedicineName,CompanyName, cast(Manufacturing as date) Manufacturing , Expiry,Price, CurrentQuantity FROM Medicine M , Company C where M.CompanyID=C.CompanyID and MedicineName LIKE '%{0}%'", value), sqlconn);
                }
                datatable.Fill(searchresult);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }
            finally
            {
                sqlconn.Close();
            }
            return searchresult;
        }

        public DataTable getMedicineExpiredList()
        {
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlDataAdapter datatable = new SqlDataAdapter();
            DataTable searchresult = new DataTable();
            try
            {
                datatable = new SqlDataAdapter("SELECT MedicineID,MedicineName,CompanyName, cast(Manufacturing as date) Manufacturing , Expiry,Price, CurrentQuantity FROM Medicine M , Company C where M.CompanyID=C.CompanyID and Expiry<=getdate()", sqlconn);
                datatable.Fill(searchresult);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }
            finally
            {
                sqlconn.Close();
            }
            return searchresult;
        }

        public DataTable getEmployeeList()
        {
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlDataAdapter datatable = new SqlDataAdapter();
            DataTable searchresult = new DataTable();
            try
            {
                datatable = new SqlDataAdapter("SELECT EmpID,EmpName,ContactNo,Address,Designation,Salary,Gender,DOB,Email  FROM Employee", sqlconn);
                datatable.Fill(searchresult);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }
            finally
            {
                sqlconn.Close();
            }
            return searchresult;
        }

        public DataTable getMedicineOutOfStockList()
        {
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlDataAdapter datatable = new SqlDataAdapter();
            DataTable searchresult = new DataTable();
            try
            {
                datatable = new SqlDataAdapter("SELECT MedicineID,MedicineName,CompanyName, cast(Manufacturing as date) Manufacturing , Expiry,Price, CurrentQuantity FROM Medicine M , Company C where M.CompanyID=C.CompanyID and CurrentQuantity=0", sqlconn);
                datatable.Fill(searchresult);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }
            finally
            {
                sqlconn.Close();
            }
            return searchresult;
        }

        public DataTable getCustomerList()
        {
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlDataAdapter datatable = new SqlDataAdapter();
            DataTable searchresult = new DataTable();
            try
            {
                datatable = new SqlDataAdapter("SELECT  CustomerID, CustomerName, ContactNo  from Customers", sqlconn);
                datatable.Fill(searchresult);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }
            finally
            {
                sqlconn.Close();
            }
            return searchresult;
        }
        public DataTable getCompanyList()
        {
            SqlConnection sqlconn = new SqlConnection(connString);
            sqlconn.Open();
            SqlDataAdapter datatable = new SqlDataAdapter();
            DataTable searchresult = new DataTable();
            try
            {
                datatable = new SqlDataAdapter("SELECT CompanyID, CompanyName, Location, ContactNumber from Company", sqlconn);
                datatable.Fill(searchresult);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }
            finally
            {
                sqlconn.Close();
            }
            return searchresult;
        }
    }
}