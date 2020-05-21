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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else {
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

            DataTable table1 = new DataTable();

            table1 = userDal.getMedicineList();

            foreach (DataRow dr in table1.Rows)
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

