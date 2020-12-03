using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BRTailor.Models
{
    public class OrderVM
    {
        public int Order_ID { get; set; }
        public Nullable<int> Staff_ID { get; set; }
        public string Staff_Position { get; set; }
        public string Staff_Name { get; set; }
        public Nullable<System.DateTime> Order_Date { get; set; }
        public Nullable<System.DateTime> Return_Date { get; set; }
        public Nullable<int> Price { get; set; }
        public string Status { get; set; }
    }
}