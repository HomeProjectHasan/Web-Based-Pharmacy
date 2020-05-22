using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MedicalStore
{
    public class PurchaseDetails
    {
        public string PurchaseID { get; set; }
        public string PurchaseDate { get; set; }
        public string DealerName { get; set; }
        public string CompanyName { get; set; }
        public string MedicineID { get; set; }
        public string MedicineName { get; set; }
        public string Quantity { get; set; }
        public string Totalprice { get; set; }
        public string ServedBy { get; set; }
        public string DateTime { get; set; }

    }
}