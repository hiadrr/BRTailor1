//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BRTailor
{
    using System;
    using System.Collections.Generic;
    
    public partial class Booking
    {
        public int Bookin_ID { get; set; }
        public Nullable<int> Design_ID { get; set; }
        public string Design_Code { get; set; }
        public Nullable<int> Customer_ID { get; set; }
        public string Customer_Name { get; set; }
        public string Customer_Address { get; set; }
        public string Customer_Phone { get; set; }
        public string Customer_City { get; set; }
        public Nullable<int> Measurment_Type_ID { get; set; }
        public string Measurment_Type { get; set; }
        public Nullable<int> Price { get; set; }
        public Nullable<int> Design_Price { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Design Design { get; set; }
        public virtual MeasurmentType MeasurmentType { get; set; }
    }
}