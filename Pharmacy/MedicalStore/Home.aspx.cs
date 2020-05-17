using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MedicalStore
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();

                Customerlist.DataSource = userDal.getCustomerList();
                Customerlist.DataBind();

                MedicineList.DataSource = userDal.getMedicineList();
                MedicineList.DataBind();
               
            }

        }
        protected void SellClick(object sender, EventArgs e)
        {
            DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();
            string CustomerName = Customer.Text;
            string CustomerAddress = Address.Text;
            string CustomerContact = Contact.Text;
            string MedicineID = MedicineList.Text;
            DateTime SellDate = DateTime.Parse(Date.Text);
            int QuantitySell = Int32.Parse(Quantity.Text);
            string Newflag = NewFlag.Text;
            if (CustomerName == "" || MedicineID == "" || SellDate.ToString() == "" || QuantitySell.ToString() == "" || Newflag == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");
            }
            else
            {
                string result = userDal.SellMedicine(CustomerName, CustomerAddress, CustomerContact, MedicineID, SellDate, QuantitySell, Newflag);
                string[] strArray = result.Split('|');

                ErrorLabel.Text = strArray[1].ToString();
            }
            
        }
    }
}