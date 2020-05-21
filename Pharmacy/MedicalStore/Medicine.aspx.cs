﻿using System;
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
        protected void Button4_Click(object sender, EventArgs e)
        {
            Session["Button"] = 4;
            Session["id"] = Pricebyid.Text;
            if (Session["id"].ToString() == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else
                Response.Redirect("~/MedicineOutput.aspx");
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            Session["Button"] = 5;
            Session["id"] = Expirybyid.Text;
            if (Session["id"].ToString() == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else
                Response.Redirect("~/MedicineOutput.aspx");
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            Session["Button"] = 6;
            Session["id"] = Takebyid.Text;
            if (Session["id"].ToString() == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else
                Response.Redirect("~/MedicineOutput.aspx");
        }
        protected void Button7_Click(object sender, EventArgs e)
        {
            Session["Button"] = 7;
            Session["id"] = Informationbyid.Text;
            if (Session["id"].ToString() == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else
                Response.Redirect("~/MedicineOutput.aspx");
        }

        protected void Textbox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}