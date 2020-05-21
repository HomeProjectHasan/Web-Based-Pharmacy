using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore
{
    public partial class Employ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Employ"] = 1;
            Response.Redirect("~/EmployeeOutput.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Employ"] = 2;
            Session["Eid"] = Employbyid.Text;
            if (Session["Eid"].ToString() == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else
                Response.Redirect("~/EmployeeOutput.aspx");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["Employ"] = 3;
            Session["Eid"] = Employbyname.Text;
            if (Session["Eid"].ToString() == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else
                Response.Redirect("~/EmployeeOutput.aspx");
        }
        protected void Textbox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}