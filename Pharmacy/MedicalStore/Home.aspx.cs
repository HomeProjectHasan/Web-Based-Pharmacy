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

        protected void GenerateBill(object sender, EventArgs e)
        {
            if (NewFlag.Text == "" || MedicineList.Text == "" || (NewFlag.Text == "Yes" && Customer.Text == "") || (NewFlag.Text == "Yes" && Address.Text == "")
              || (NewFlag.Text == "Yes" && Contact.Text == "") || (NewFlag.Text == "No" && Customerlist.Text == "") || Date.Text == "" || Quantity.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");
            }
            else
            {
                string MedicineID = MedicineList.Text;
                int QuantitySell = Int32.Parse(Quantity.Text);
                DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();
                DataTable table = new DataTable();
                table = userDal.showSellBill(MedicineID, QuantitySell);
                medicineidbill.Text = table.Rows[0]["MedicineID"].ToString();
                medicinenamebill.Text = table.Rows[0]["MedicineName"].ToString();
                medicinepricebill.Text = "₹ " + table.Rows[0]["UnitPrice"].ToString()+"/p";
                medicineqtybill.Text = table.Rows[0]["Quantity"].ToString();
                medicinetotalbill.Text = "₹ " + table.Rows[0]["TotalPrice"].ToString()+"/-";
                datebill.Text = Date.Text;
                servedbybill.Text = Session["user_name"].ToString();
                if (NewFlag.Text == "Yes")
                {
                    namebill.Text = Customer.Text;
                    contactbill.Text = Contact.Text;
                }
                else
                {
                    namebill.Text = Customerlist.SelectedItem.Text;
                    contactbill.Text = Customerlist.SelectedItem.Value; ;
                }

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);

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