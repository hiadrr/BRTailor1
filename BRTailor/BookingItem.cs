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
    
    public partial class BookingItem
    {
        public int BT_ID { get; set; }
        public Nullable<int> Booking_ID { get; set; }
        public Nullable<int> Price { get; set; }
        public Nullable<int> D_Price { get; set; }
        public Nullable<int> SubTotal { get; set; }
        public string Measurment_Type { get; set; }
        public string D_Code { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public string Quantity { get; set; }
    
        public virtual Booking Booking { get; set; }
    }
}
