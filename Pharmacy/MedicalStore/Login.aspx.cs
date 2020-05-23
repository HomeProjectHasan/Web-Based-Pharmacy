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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                Session["user_id"] = null;
                Session["user_name"] = null;

        }

        protected void login(object sender, EventArgs e)
        {
            DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();
            string Username = username.Text;
            string Password = password.Text;
            if (Username == "" || Password == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('No data');</script>");﻿
            }
            else
            {
                string result = userDal.Login(Username, Password);

                string[] strArray = result.Split('|');
                if (strArray[0].ToString().Contains("Success"))
                {
                    Session["user_id"] = username.Text;
                    Session["user_name"] = strArray[1].ToString();
                    Response.Redirect("~/Home.aspx");
                }
                else
                {
                    ErrorLabel.Text = strArray[1].ToString();
                }
            }
        }
    }
}