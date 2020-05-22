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
    public partial class output4 : System.Web.UI.Page
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
                
                ButtonValue = Session["PurchaseButton"].ToString();
                if (Session["PurchaseText"] != null)
                {
                    TextValue = Session["PurchaseText"].ToString();
                }
                if (!this.IsPostBack)
                {
                    DataTable dummy = new DataTable();
                    dummy.Columns.Add("PurchaseID");
                    dummy.Columns.Add("PurchaseDate");
                    dummy.Columns.Add("DealerName");
                    dummy.Columns.Add("CompanyName");
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
        public static List<PurchaseDetails> GetPurchaseDetails()
        {
            List<PurchaseDetails> PurchaseDetails = new List<PurchaseDetails>();
            DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();

            DataTable resultTable = new DataTable();

            if (ButtonValue == "All_Click")
            {
                resultTable = userDal.getPurchaseHistory("");
            }
            else if (ButtonValue == "BY_ID")
            {
                resultTable = userDal.getPurchaseHistory(TextValue);
            }

            foreach (DataRow dr in resultTable.Rows)
            {

                PurchaseDetails.Add(new PurchaseDetails
                {
                    PurchaseID = dr["PurchaseID"].ToString(),
                    PurchaseDate = dr["PurchaseDate"].ToString(),
                    DealerName = dr["DealerName"].ToString(),
                    CompanyName = dr["CompanyName"].ToString(),
                    MedicineID = dr["MedicineID"].ToString(),
                    MedicineName = dr["MedicineName"].ToString(),
                    Quantity = dr["Quantity"].ToString(),
                    Totalprice = dr["Totalprice"].ToString(),
                    ServedBy = dr["ServedBy"].ToString(),
                    DateTime = dr["DateTime"].ToString(),

                });
            }
            return PurchaseDetails;
        }
    }
}