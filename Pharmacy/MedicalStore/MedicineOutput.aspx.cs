using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Script.Services;
using Newtonsoft.Json;
using System.Web.Script.Serialization;

namespace MedicalStore
{
    public partial class output5 : System.Web.UI.Page
    {
        public static string ButtonValue;
        public static string TextValue;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else {
                 ButtonValue = Session["MedicineButton"].ToString();
                if(Session["MedicineText"] != null) { 
                 TextValue = Session["MedicineText"].ToString();
                }
                if (!this.IsPostBack)
                {
                    DataTable dummy = new DataTable();
                    dummy.Columns.Add("MedicineID");
                    dummy.Columns.Add("MedicineName");
                    dummy.Columns.Add("CompanyName");
                    dummy.Columns.Add("Manufacturing");
                    dummy.Columns.Add("Expiry");
                    dummy.Columns.Add("Price");
                    dummy.Columns.Add("CurrentQuantity");
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
        public static List<MedicineDetails> GetMedicineDetails()
        {
            List<MedicineDetails> Medicines = new List<MedicineDetails>();
            DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();

            DataTable resultTable = new DataTable();

            if (ButtonValue == "All_Click")
            {
                resultTable = userDal.getMedicineList();
            }
            else if (ButtonValue == "OutOfStock_Click")
            {
                resultTable = userDal.getMedicineOutOfStockList();
            }
            else if (ButtonValue == "Expired_Click")
            {
                resultTable = userDal.getMedicineExpiredList();
            }
            else if (ButtonValue == "ID_Click" || ButtonValue == "Name_Click")
            {
                resultTable = userDal.searchMedicine(ButtonValue, TextValue);
            }

            foreach (DataRow dr in resultTable.Rows)
            {

                Medicines.Add(new MedicineDetails
                {
                    MedicineID = dr["MedicineID"].ToString(),
                    MedicineName = dr["MedicineName"].ToString(),
                    CompanyName = dr["CompanyName"].ToString(),
                    Manufacturing = dr["Manufacturing"].ToString(),
                    Expiry = dr["Expiry"].ToString(),
                    Price = dr["Price"].ToString(),
                    CurrentQuantity = dr["CurrentQuantity"].ToString(),
                });
            }

            return Medicines;
        }
    }
}

