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

        protected void PurchaseClick(object sender, EventArgs e)
        {

            DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();
            string DealerID = Dealer.Text;
            string MedicineName = Medicine.Text;
            DateTime PurchaseDate = DateTime.Parse(Date.Text);
            int QuantityPurchased = Int32.Parse(Quantity.Text);
            string Newflag = NewFlag.Text;
            float price;
            DateTime MFDEntered;
            DateTime EXPEntered;
            if(Newflag == "Yes")
            { 
            price = float.Parse(Price.Text);
            MFDEntered = DateTime.Parse(MFD.Text);
            EXPEntered = DateTime.Parse(EXP.Text);
            }
            else
            {
                price = 0;
                MFDEntered = DateTime.Parse("1900-01-01");
                EXPEntered = DateTime.Parse("1900-01-01");
            }

            if (DealerID == "" || MedicineName == "" || PurchaseDate.ToString() == "" || QuantityPurchased.ToString() == "" || Newflag == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");
            }
            else
            {
            string result = userDal.PurchaseMedicine(DealerID, MedicineName, PurchaseDate, QuantityPurchased, price, MFDEntered, EXPEntered, Newflag);
            string[] strArray = result.Split('|');

            ErrorLabel.Text = strArray[1].ToString();
            }

        }

        }
}