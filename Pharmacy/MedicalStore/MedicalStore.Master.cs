﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore
{
    public partial class MedicalStore : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.OnLoad(e);
            Page.Header.DataBind();
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}