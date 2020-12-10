using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BRTailor.Models
{
    public class DataSetclass
    {
        public int Customer_ID { get; set; }
        public string Customer_Name { get; set; }
        public string Customer_City { get; set; }
        public string Customer_Address { get; set; }
        public string Customer_Phone { get; set; }
        public int Total { get; set; }
        public int SubTotal { get; set; }
        public int Discount { get; set; }
        public string Design_Code { get; set; }
        public string Measurment_Type { get; set; }
       
    }
}