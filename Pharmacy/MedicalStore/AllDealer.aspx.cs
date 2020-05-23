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
    public partial class output6 : System.Web.UI.Page
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

                ButtonValue = Session["DealerButton"].ToString();
                if (Session["DealerText"] != null)
                {
                    TextValue = Session["DealerText"].ToString();
                }
                if (!this.IsPostBack)
                {
                    DataTable dummy = new DataTable();
                    dummy.Columns.Add("DealerID");
                    dummy.Columns.Add("DealerName");
                    dummy.Columns.Add("DealerContact");
                    dummy.Columns.Add("DealerEmail");
                    dummy.Columns.Add("DealerAddress");
                    dummy.Columns.Add("CompanyName");
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
        public static List<Dealers> ShowAllDealers()
        {
            List<Dealers> DealerDetails = new List<Dealers>();
            DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();

            DataTable resultTable = new DataTable();

           
                resultTable = userDal.ShowAllDealers();
           

            foreach (DataRow dr in resultTable.Rows)
            {

                DealerDetails.Add(new Dealers
                {
                    DealerID = dr["DealerID"].ToString(),
                    DealerName = dr["DealerName"].ToString(),
                    DealerContact = dr["DealerContact"].ToString(),
                    DealerEmail = dr["DealerEmail"].ToString(),
                    DealerAddress = dr["DealerAddress"].ToString(),
                    CompanyName = dr["CompanyName"].ToString(),
                    ServedBy = dr["ServedBy"].ToString(),
                    DateTime = dr["DateTime"].ToString(),

                });
            }
            return DealerDetails;
        }
    }
}

