using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace MedicalStore
{
    public partial class Outputpage : System.Web.UI.Page
    {
        public static string ButtonValue;
        public static string TextValue;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {

                ButtonValue = Session["SellButton"].ToString();
                if (Session["SellText"] != null)
                {
                    TextValue = Session["SellText"].ToString();
                }
                if (!this.IsPostBack)
                {
                    DataTable dummy = new DataTable();
                    dummy.Columns.Add("SellID");
                    dummy.Columns.Add("SellDate");
                    dummy.Columns.Add("CustomerName");
                    dummy.Columns.Add("Contact");
                    dummy.Columns.Add("MedicineID");
                    dummy.Columns.Add("MedicineName");
                    dummy.Columns.Add("Quantity");
                    dummy.Columns.Add("Totalprice");
                    dummy.Columns.Add("ServedBy");
                    dummy.Columns.Add("DateTime");

                    dummy.Rows.Add();
                    grdModel.DataSource = dummy;
                    grdModel.DataBind();

                    //Required for jQuery DataTables to work.
                    grdModel.UseAccessibleHeader = true;
                    grdModel.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }
        [WebMethod]
        public static List<SellDetails> GetSellDetails()
        {
            List<SellDetails> SellDetails = new List<SellDetails>();
            DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();

            DataTable resultTable = new DataTable();

            if (ButtonValue == "All_Click")
            {
                resultTable = userDal.getSellHistory("");
            }
            else if (ButtonValue == "BY_ID")
            {
                resultTable = userDal.getSellHistory(TextValue);
            }

            foreach (DataRow dr in resultTable.Rows)
            {

                SellDetails.Add(new SellDetails
                {
                    SellID = dr["SellID"].ToString(),
                    SellDate = dr["SellDate"].ToString(),
                    CustomerName = dr["CustomerName"].ToString(),
                    Contact = dr["Contact"].ToString(),
                    MedicineID = dr["MedicineID"].ToString(),
                    MedicineName = dr["MedicineName"].ToString(),
                    Quantity = dr["Quantity"].ToString(),
                    Totalprice = dr["Totalprice"].ToString(),
                    ServedBy = dr["ServedBy"].ToString(),
                    DateTime = dr["DateTime"].ToString(),


                });
            }
            return SellDetails;
        }
    }
}