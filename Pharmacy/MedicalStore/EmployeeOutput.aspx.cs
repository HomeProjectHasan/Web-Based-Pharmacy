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
    public partial class Outputpage3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!this.IsPostBack)
                {
                    DataTable dummy = new DataTable();
                    dummy.Columns.Add("EmpID");
                    dummy.Columns.Add("EmpName");
                    dummy.Columns.Add("ContactNo");
                    dummy.Columns.Add("Address");
                    dummy.Columns.Add("Designation");
                    dummy.Columns.Add("DOB");
                    dummy.Columns.Add("Email");
                    dummy.Columns.Add("Gender");
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
        public static List<Employee> GetEmployeeDetails()
        {
            List<Employee> Employees = new List<Employee>();
            DAL.MedicalStoreDAL userDal = new DAL.MedicalStoreDAL();

            DataTable resultTable = new DataTable();

            resultTable = userDal.getEmployeeList();

            foreach (DataRow dr in resultTable.Rows)
            {

                Employees.Add(new Employee
                {
                    EmpID = dr["EmpID"].ToString(),
                    EmpName = dr["EmpName"].ToString(),
                    ContactNo = dr["ContactNo"].ToString(),
                    Address = dr["Address"].ToString(),
                    Designation = dr["Designation"].ToString(),
                    DOB = dr["DOB"].ToString(),
                    Email = dr["Email"].ToString(),
                    Gender = dr["Gender"].ToString(),
                });
            }

            return Employees;
        }
    }
}