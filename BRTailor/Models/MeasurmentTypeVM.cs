using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BRTailor.Models
{
    public class MeasurmentTypeVM
    {
        public string Measurment_Type { get; set; }
        public int Measurment_ID { get; set; }
        public Nullable<int> Measurment_Type_ID { get; set; }
        public Nullable<int> Customer_ID { get; set; }
        public Nullable<double> Length { get; set; }
        public Nullable<double> Chest { get; set; }
        public Nullable<double> Shoulder { get; set; }
        public Nullable<int> Waist { get; set; }
        public string Sleeves { get; set; }
        public Nullable<double> arms { get; set; }
        public Nullable<double> CollarSize { get; set; }
        public Nullable<double> Bottom { get; set; }
        public Nullable<double> Hip { get; set; }
        public Nullable<double> Gidrii { get; set; }
        public Nullable<double> CrossBack { get; set; }
        public Nullable<double> Tera { get; set; }
        public string Dcollor { get; set; }
        public string Ghera { get; set; }
        public string suitDesign { get; set; }
        public string btnDesign { get; set; }
        public string Stitch { get; set; }
        public string CoatButton { get; set; }
        public string CoatFitting { get; set; }
        public string SidePocket { get; set; }
        public string FrontPocket { get; set; }
    }
}