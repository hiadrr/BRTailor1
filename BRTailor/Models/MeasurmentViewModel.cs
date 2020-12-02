using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BRTailor.Models
{
    public class MeasurmentViewModel
    {
        
         public string CustomerName { get; set; }
         public int CustomerID { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Customer_image { get; set; }
        
        public List<Measurment> measurments { get; set; }
    }
}