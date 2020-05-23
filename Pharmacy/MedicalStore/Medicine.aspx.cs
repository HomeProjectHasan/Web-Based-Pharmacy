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
    public partial class Medicine : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!Page.IsPostBack)
            {
                DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();
                MedicinePurchase.DataSource = userDal.getMedicineList();
                MedicinePurchase.DataBind();
            }
        }

        protected void All_Click(object sender, EventArgs e)
        {
            Session["MedicineButton"] = "All_Click";
            Response.Redirect("~/MedicineOutput.aspx");
        }
        protected void OutOfStock_Click(object sender, EventArgs e)
        {
            Session["MedicineButton"] = "OutOfStock_Click";
            Response.Redirect("~/MedicineOutput.aspx");
        }
        protected void Expired_Click(object sender, EventArgs e)
        {
            Session["MedicineButton"] = "Expired_Click";
            Response.Redirect("~/MedicineOutput.aspx");
        }
        protected void SearchByID(object sender, EventArgs e)
        {
            Session["MedicineButton"] = "ID_Click";
            Session["MedicineText"] = MedicineID.Text;
            Response.Redirect("~/MedicineOutput.aspx");
        }
        protected void SearchByName(object sender, EventArgs e)
        {
            Session["MedicineButton"] = "Name_Click";
            Session["MedicineText"] = MedicineName.Text;
            Response.Redirect("~/MedicineOutput.aspx");
        }
        protected void ShowPurchaseHistory(object sender, EventArgs e)
        {
            Session["PurchaseButton"] = "BY_ID";
            Session["PurchaseText"] = MedicinePurchase.Text;
            Response.Redirect("~/PurchaseOutput.aspx");
        }
        protected void ShowSellHistory(object sender, EventArgs e)
        {
            Session["SellButton"] = "BY_ID";
            Session["SellText"] = MedicinePurchase.Text;
            Response.Redirect("~/SellOutput.aspx");
        }

        protected void Textbox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}