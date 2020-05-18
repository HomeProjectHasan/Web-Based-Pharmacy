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
            if (NewFlag.Text == "" || MedicineList.Text == "" || (NewFlag.Text == "Yes" && Customer.Text == "") || (NewFlag.Text == "Yes" && Address.Text == "")
              || (NewFlag.Text == "Yes" && Contact.Text == "") || (NewFlag.Text == "No" && Customerlist.Text == "") || Date.Text == "" || Quantity.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");
            }
            else
            {
                DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();
                string CustomerName;
                string CustomerAddress;
                string CustomerContact;
                string MedicineID = MedicineList.Text;
                DateTime SellDate = DateTime.Parse(Date.Text);
                int QuantitySell = Int32.Parse(Quantity.Text);
                string Newflag = NewFlag.Text;
                if (Newflag == "Yes")
                {
                    CustomerName = Customer.Text;
                    CustomerAddress = Address.Text;
                    CustomerContact = Contact.Text;
                }
                else
                {
                    CustomerName = Customerlist.SelectedItem.Text;
                    CustomerAddress = "";
                    CustomerContact = "0";
                }
                string result = userDal.SellMedicine(CustomerName, CustomerAddress, CustomerContact, MedicineID, SellDate, QuantitySell, Newflag);
                string[] strArray = result.Split('|');

                ErrorLabel.Text = strArray[1].ToString();


                if (strArray[0].ToString() == "Success")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>enableDisable();</script>");

                    ErrorLabel.Text = strArray[1].ToString();
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>enableDisable();</script>");

                    ErrorLabel.Text = strArray[1].ToString();
                }
            }
        }
    }
}