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
    
    public partial class Measurment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Measurment()
        {
            this.Orders = new HashSet<Order>();
        }
    
        public int Measurment_ID { get; set; }
        public Nullable<int> Measurment_Type_ID { get; set; }
        public string Measurment_Type { get; set; }
        public Nullable<int> Customer_ID { get; set; }
        public Nullable<double> Length { get; set; }
        public Nullable<double> Hip { get; set; }
        public Nullable<double> Gidrii { get; set; }
        public Nullable<double> CrossBack { get; set; }
        public Nullable<double> Chest { get; set; }
        public Nullable<double> Shoulder { get; set; }
        public Nullable<int> Waist { get; set; }
        public string Sleeves { get; set; }
        public Nullable<double> arms { get; set; }
        public Nullable<double> CollarSize { get; set; }
        public Nullable<double> Tera { get; set; }
        public string Dcollor { get; set; }
        public Nullable<double> Bottom { get; set; }
        public string SidePocket { get; set; }
        public string FrontPocket { get; set; }
        public string Ghera { get; set; }
        public string suitDesign { get; set; }
        public string btnDesign { get; set; }
        public string Stitch { get; set; }
        public string CoatButton { get; set; }
        public string CoatFitting { get; set; }
        public Nullable<int> Gheera_num { get; set; }
        public string Comments { get; set; }
    
        public virtual MeasurmentType MeasurmentType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
