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
    public partial class Purchase : System.Web.UI.Page
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

                Dealer.DataSource = userDal.getDealerList();
                Dealer.DataBind();

                MedicineList.DataSource = userDal.getMedicineList();
                MedicineList.DataBind();
            }
        }
        protected void GenerateBill(object sender, EventArgs e)
        {
            if (Dealer.Text == "" || NewFlag.Text == "" || (NewFlag.Text == "Yes" && Medicine.Text == "") || (NewFlag.Text == "Yes" && Price.Text == "")
                || (NewFlag.Text == "Yes" && MFD.Text == "") || (NewFlag.Text == "Yes" && EXP.Text == "") || (NewFlag.Text == "No" && MedicineList.Text == "") || Date.Text == "" || Quantity.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");
            }
            else
            {
                string DealerID = Dealer.Text;
                if (NewFlag.Text == "Yes")
                {
                    medicinenamebill.Text = Medicine.Text;
                    medicinepricebill.Text = "₹ " + Price.Text;
                    medicinetotalbill.Text = "₹ " + (Int64.Parse(Quantity.Text) * float.Parse(Price.Text)).ToString();
                }
                else
                {
                    medicinenamebill.Text = MedicineList.SelectedItem.Text;
                    medicinepricebill.Text = "₹ " + MedicineList.SelectedItem.Value.ToString();
                    medicinetotalbill.Text = "₹ " + (Int64.Parse(Quantity.Text) * float.Parse(MedicineList.SelectedItem.Value)).ToString();
                }

                DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();
                DataTable table = new DataTable();
                table = userDal.showDelearDetailsForBill(DealerID);
                namebill.Text = table.Rows[0]["Name"].ToString();
                contactbill.Text = table.Rows[0]["ContactNo"].ToString();
                companybill.Text = table.Rows[0]["CompanyName"].ToString();
                emailbill.Text = table.Rows[0]["Email"].ToString();
                medicineqtybill.Text = Quantity.Text;
                datebill.Text = Date.Text;
                servedbybill.Text = Session["user_name"].ToString();
               

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>enableDisable();</script>");

            }
        }

        protected void PurchaseClick(object sender, EventArgs e)
        {

            if (Dealer.Text == "" || NewFlag.Text == "" || (NewFlag.Text == "Yes" && Medicine.Text == "") || (NewFlag.Text == "Yes" && Price.Text == "")
                || (NewFlag.Text == "Yes" && MFD.Text == "") || (NewFlag.Text == "Yes" && EXP.Text == "") || (NewFlag.Text == "No" && MedicineList.Text == "") || Date.Text == "" || Quantity.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");
            }
            else
            {
                DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();
                string DealerID = Dealer.Text;
                string MedicineName;
                DateTime PurchaseDate = DateTime.Parse(Date.Text);
                int QuantityPurchased = Int32.Parse(Quantity.Text);
                string Newflag = NewFlag.Text;
                float price;
                string userID = Session["user_id"].ToString();
                DateTime MFDEntered;
                DateTime EXPEntered;
                if (Newflag == "Yes")
                {
                    price = float.Parse(Price.Text);
                    MFDEntered = DateTime.Parse(MFD.Text);
                    EXPEntered = DateTime.Parse(EXP.Text);
                    MedicineName = Medicine.Text;
                }
                else
                {
                    price = 0;
                    MedicineName = MedicineList.SelectedItem.Text;
                    MFDEntered = DateTime.Parse("1900-01-01");
                    EXPEntered = DateTime.Parse("1900-01-01");
                }

                string result = userDal.PurchaseMedicine(DealerID, MedicineName, PurchaseDate, QuantityPurchased, price, MFDEntered, EXPEntered, userID, Newflag);
                string[] strArray = result.Split('|');

                if (strArray[0].ToString() == "Success")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>enableDisable();</script>");
                    ClientScriptManager CSM = Page.ClientScript;
                    string strconfirm = "<script>if(window.confirm('" + strArray[1].ToString() + " Want to move to home?')){window.location.href='Home.aspx'}</script>";
                    CSM.RegisterClientScriptBlock(this.GetType(), "Confirm", strconfirm, false); ;
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