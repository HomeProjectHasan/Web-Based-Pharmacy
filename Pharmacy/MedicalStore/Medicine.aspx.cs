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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Button"] = 1;
            Response.Redirect("~/Outputpage.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Button"] = 2;
            Response.Redirect("~/Outputpage.aspx");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["Button"] = 3;
            Response.Redirect("~/Outputpage.aspx");
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
                Response.Redirect("~/Outputpage.aspx");
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
                Response.Redirect("~/Outputpage.aspx");
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
                Response.Redirect("~/Outputpage.aspx");
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
                Response.Redirect("~/Outputpage.aspx");
        }
        protected void Button8_Click(object sender, EventArgs e)
        {
            Session["Button"] = 8;
            Session["id"] = Quantitybyid.Text;
            if (Session["id"].ToString() == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else
                Response.Redirect("~/Outputpage.aspx");
        }
        protected void Button9_Click(object sender, EventArgs e)
        {
            Session["Button"] = 9;
            Session["id"] = Purchasebyid.Text;
            if (Session["id"].ToString() == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else
                Response.Redirect("~/Outputpage.aspx");
        }
        protected void Button10_Click(object sender, EventArgs e)
        {
            Session["Button"] = 10;
            Session["id"] = Salesnobyid.Text;
            if (Session["id"].ToString() == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else
                Response.Redirect("~/Outputpage.aspx");
        }
        protected void Button11_Click(object sender, EventArgs e)
        {
            Session["Button"] = 11;
            Session["id"] = Updatebyid.Text;
            Session["id2"] = manudate.Text;
            if (Session["id"].ToString() == "" || Session["id2"].ToString() == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else
                Response.Redirect("~/Outputpage.aspx");
        }
        protected void Button12_Click(object sender, EventArgs e)
        {
            Session["id"] = Expirydatebyid.Text;
            Session["id2"] = expirydate.Text;
            Session["Button"] = 12;
            if (Session["id"].ToString() == "" || Session["id2"].ToString() == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kindly Enter Data');</script>");﻿
            }
            else
                Response.Redirect("~/Outputpage.aspx");
        }

        protected void Textbox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}