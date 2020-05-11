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

        }

        protected void button1_Click1(object sender, EventArgs e)
        {
            DAL.myClass userDal = new DAL.myClass();
            string Username = TextBox1.Text;
            string Password = txtPassword.Text;
            if (Username == "" || Password == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('No data');</script>");﻿
            }
            else
            {
                int result = userDal.Login(Username, Password);
                if (result == 1)
                {
                    Session["user_id"] = TextBox1.Text;
                    Label1.Text = "Login Successful!";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert(" + Session["user_id"].ToString() + "');</script>");
                    Response.Redirect("~/Home.aspx");
                }
                else if (result == 0)
                {
                    Session["user_id"] = null;
                    Label1.Text = "Login Unsuccessful!";
                }

                else if (result == -5)
                {
                    Session["user_id"] = null;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('SQL Error');</script>");﻿
                }
            }
        }
    }
}