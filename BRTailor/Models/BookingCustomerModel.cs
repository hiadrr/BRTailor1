using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BRTailor.Models
{
    public class BookingCustomerModel
    {
        public int Customer_ID { get; set; }
        public string Customer_Name { get; set; }
        public string Customer_Phone { get; set; }
        public string Customer_City { get; set; }
        public string Customer_Address { get; set; }
        public Nullable<int> Total { get; set; }
        public Nullable<int> Payable { get; set; }
        public Nullable<int> Discount { get; set; }
      



        public List<BookingItem> bookingItem { get; set; }
      
    }
}