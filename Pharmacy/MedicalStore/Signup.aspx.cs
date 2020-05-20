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
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
   
            }
            else
            {
                Session["user_id"] = null;
            }

        }

        protected void button2_Click(object sender, EventArgs e)
        {
            DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();
            DataTable DT = new DataTable();
            if (Password.Text != ConfPassword.Text)
            {
                ErrorLabel.Text = "Password not same!";
            }
            if (Name.Text == "" || Address.Text == "" || Salary.Text == "" || Designation.Text == "" || Email.Text == "" || Password.Text == "" || ConfPassword.Text == "" || dob.Text == "" || Contact.Text == "" || UName.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else if (Password.Text == ConfPassword.Text)
            {
                string result = userDal.Signup(Name.Text, Contact.Text, Address.Text, Designation.Text, Int32.Parse(Salary.Text), Email.Text,Gender.Text, DateTime.Parse(dob.Text), UName.Text, Password.Text);

                string[] strArray = result.Split('|');

                if (strArray[0].ToString().Contains("Success"))
                {
                    ClientScriptManager CSM = Page.ClientScript;

                    string strconfirm = "<script>if(window.confirm('"+ strArray[1].ToString() + " Want to login?')){window.location.href='Login.aspx'}</script>";
                    CSM.RegisterClientScriptBlock(this.GetType(), "Confirm", strconfirm, false);
                }
                else
                {
                    ErrorLabel.Text = strArray[1].ToString();
                }
            }
        }

    }
}