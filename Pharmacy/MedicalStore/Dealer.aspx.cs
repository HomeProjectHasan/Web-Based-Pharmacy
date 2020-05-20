using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore
{
    public partial class Dealer : System.Web.UI.Page
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

                CompanyList.DataSource = userDal.getCompanyList();
                CompanyList.DataBind();

            }
        }

        protected void Submit(object sender, EventArgs e)
        {
            if (Dealername.Text == "" || Dealercontactno.Text == "" || Dealeraddress.Text == "" || Dealeremail.Text == "" || NewFlag.Text == "" || (NewFlag.Text == "Yes" && Companyname.Text == "") || (NewFlag.Text == "Yes" && Companyaddress.Text == "")
                || (NewFlag.Text == "Yes" && Companycontactno.Text == "") || (NewFlag.Text == "No" && CompanyList.Text == "")) 
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");
            }
            else
            {
                DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();
                string DealerName= Dealername.Text;                  
                string DealerContact= Dealercontactno.Text;
                string DealerAddress= Dealeraddress.Text;
                string DealerEmail= Dealeremail.Text;
                string Newflag = NewFlag.Text;
                string CompanyName;
                string CompanyLocation;
                string CompanyContact;             
                if (Newflag == "Yes")
                {
                    CompanyName = Companyname.Text;
                    CompanyLocation = Companyaddress.Text;
                    CompanyContact = Companycontactno.Text;
                }
                else
                {
                    CompanyName = CompanyList.SelectedItem.Text;
                    CompanyLocation = "";
                    CompanyContact = "0";
                }

                string result = userDal.creatdealer(DealerName, DealerContact, DealerAddress, DealerEmail, Newflag, CompanyName, CompanyLocation, CompanyContact);
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