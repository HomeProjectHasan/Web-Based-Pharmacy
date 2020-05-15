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
            DAL.myClass userDal = new DAL.myClass();
            DataTable DT = new DataTable();
            if (Password.Text != ConfPassword.Text)
            {
                Label1.Text = "Password not same!";
            }
            if (Name.Text == "" || Address.Text == "" || Salary.Text == "" || Designation.Text == "" || Email.Text == "" || Password.Text == "" || ConfPassword.Text == "" || Contact.Text == "" || UName.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else if (Password.Text == ConfPassword.Text)
            {
                int result = userDal.Signup(Name.Text, Contact.Text, Address.Text, Designation.Text, Int32.Parse(Salary.Text), Email.Text, UName.Text, Password.Text);
                if (result == 0)
                {
                    Label1.Text = "Username already exists!";
                }

                else if (result == 1)
                {
                    Label1.Text = "Account made successfully!";
                }

                else if (result == -5)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('SQL Error');</script>");﻿
                }
            }
        }

    }
}