using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MedicalStore
{
    public class MedicineDetails
    {
        public string MedicineID { get; set; }
        public string MedicineName { get; set; }
        public string CompanyName { get; set; }
        public string Manufacturing { get; set; }
        public string Expiry { get; set; }
        public string Price { get; set; }
        public string CurrentQuantity { get; set; }
    }
}