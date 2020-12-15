
using BRTailor.Models;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BRTailor.Controllers
{
    public class BookingController : Controller
    {
        private BRTailorEntities db = new BRTailorEntities();
        // GET: Booking
        public ActionResult BookingProcess(int? id)
        {
            dynamic model = new ExpandoObject();
           
            model.Customer = db.Customers.Find(id);
            model.Measurment = db.Measurments.Where(x => x.Customer_ID == id).ToList();
            model.design = db.Designs.ToList();
           var  Measurment = db.Measurments.Where(x => x.Customer_ID == id).ToList();
            
          
            var Item = new SelectList(Measurment, "Measurment_Type_ID", "Measurment_Type");
            var fromDatabaseEF = new SelectList(db.Designs.ToList(), "Design_ID", "Design_Code");
            ViewData["DBMySkills"] = fromDatabaseEF;
            ViewData["DBMyMeasurment"] = Item;

            return View(model);
        }
        public JsonResult Getcode(int? Measurment_Type_ID)
        {
            var data = db.MeasurmentTypes.FirstOrDefault(x => x.Measurment_Type_ID == Measurment_Type_ID);
            return Json(new
            {
               Measurment_Type = data.Measurment_Type,
               Price = data.Price
            }, JsonRequestBehavior.AllowGet);
           
         }
        public JsonResult GetDesign(int? Design_ID)
        {
            var data = db.Designs.FirstOrDefault(x => x.Design_ID == Design_ID);

            return Json(data, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult BookOrder(BookingCustomerModel data )
        {


            if (data.Discount == null )
            {
                data.Discount = 0;
            }


            var booking = new Booking()
            {
                Customer_Address = data.Customer_Address,
                Customer_City = data.Customer_City,
                Customer_Name = data.Customer_Name,
                Customer_Phone = data.Customer_Phone,
                Discount = data.Discount,
                Total = data.Total,
                Payable = data.Payable,

                Customer_ID = data.Customer_ID,
                date = DateTime.Now,
               



            };
            db.Bookings.Add(booking);
            db.SaveChanges();
            int b_id = Convert.ToInt32(booking.Bookin_ID);
            int payable = Convert.ToInt32(booking.Payable);
            foreach (var i in data.bookingItem)
            {
                if (i.D_Price == null)
                {
                    i.D_Price = 0;
                }
            
                var m = new BookingItem()
                {
                    date = DateTime.Now,
                    Booking_ID = b_id,
                    D_Price = i.D_Price,
                    Measurment_Type = i.Measurment_Type,
                    Price = i.Price,
                    SubTotal = i.Price + i.D_Price,
                    D_Code = i.D_Code,
                };
                db.BookingItems.Add(m);
                db.SaveChanges();
            }
           


            //Queue
            int id = Convert.ToInt32(data.Customer_ID);
            var order = db.Orders.FirstOrDefault(x => x.Customer_ID == id);
          
                var c1 = db.Customers.Find(id);
                var m1 = db.Measurments.Where(x => x.Customer_ID == id).ToList();

                Order o = new Order();
                foreach (var item in m1)
                {
                    o.Customer_ID = id;
                    o.Customer_Name = c1.Customer_Name;
                    o.Measurment_ID = item.Measurment_ID;
                    o.Measurment_Type = item.MeasurmentType.Measurment_Type;
                    o.Measurment_Type_ID = item.Measurment_Type_ID;
                    o.Status = "Queue";
                    db.Orders.Add(o);
                    db.SaveChanges();
                };

            

           

            return Json(Url.Action("invoicePrintList", "Booking"));
          
        }
        public ActionResult GenerateBill(Booking booking)
        {
           
            Booking b = new Booking();
            b.Customer_Address = booking.Customer_Address;
            b.Customer_City = booking.Customer_City;
            b.Customer_ID = booking.Customer_ID;
            b.Customer_Phone = booking.Customer_Phone;
            b.Customer_Name = booking.Customer_Name;
            //b.Design_ID = booking.Design_ID;
            //b.Design_Price = booking.Design_Price;
            //b.Measurment_Type = booking.Measurment_Type;
            //b.Measurment_Type_ID = booking.Measurment_Type_ID;
            //b.Price = booking.Price;
            //b.Design_Price = booking.Design_Price;
            //b.Total = booking.Price + booking.Design_Price;
            //var design = db.Designs.FirstOrDefault(x => x.Design_ID == booking.Design_ID);
            //b.Design_Code = design.Design_Code;
            db.Bookings.Add(b);
            db.SaveChanges();
            //TempData["id"] = b.Bookin_ID;

            //Queue
            int id = Convert.ToInt32(booking.Customer_ID);
            var order = db.Orders.FirstOrDefault(x => x.Customer_ID == id);
            TempData["CustID"] = id;

            if (order == null)
            {
                var c = db.Customers.Find(id);
                var m = db.Measurments.Where(x => x.Customer_ID == id).ToList();

                Order o = new Order();
                foreach (var item in m)
                {
                    o.Customer_ID = id;
                    o.Customer_Name = c.Customer_Name;
                    o.Measurment_ID = item.Measurment_ID;
                    o.Measurment_Type = item.MeasurmentType.Measurment_Type;
                    o.Measurment_Type_ID = item.Measurment_Type_ID;
                    o.Status = "Queue";
                    db.Orders.Add(o);
                    db.SaveChanges();
                };

            }

            else
            { return RedirectToAction("invoicePrintList", "Booking"); }

            return RedirectToAction("invoicePrintList", "Booking");
       
        }
        public ActionResult invoicePrintList()
        {
            var data = db.Bookings.ToList();

            return View(data);
        }
        public ActionResult Invoice(int? id )
        {
            dynamic model = new ExpandoObject();
            model.b = db.Bookings.FirstOrDefault(x => x.Bookin_ID == id);
            model.item = db.BookingItems.Where(x => x.Booking_ID == id);
            return View(model);
        }
        public ActionResult Print(int? Id)
        {

            Warning[] warnings;
            string mimeType = "";
            string[] streamids;
            string encoding;
            string filenameExtension;
            byte[] bytes = null;
            var path = Path.Combine(Server.MapPath("~/Report"), "Invoice.rdlc");
            var viewer = new ReportViewer();
            viewer.LocalReport.ReportPath = path;

            var data = db.Bookings.FirstOrDefault(x => x.Bookin_ID == Id);

            if (data.Discount == null)
            {
                data.Discount = 0;
            }
           
          
            ReportParameter[] parms = new ReportParameter[8];
            parms[0] = new ReportParameter("Bookin_ID", data.Bookin_ID.ToString());
            parms[1] = new ReportParameter("Customer_Name", data.Customer_Name);
            parms[2] = new ReportParameter("Customer_Phone", data.Customer_Phone);
            parms[3] = new ReportParameter("Customer_City", data.Customer_City);
            parms[4] = new ReportParameter("Customer_Address", data.Customer_Address);
            parms[5] = new ReportParameter("Total", data.Total.ToString());
            parms[6] = new ReportParameter("Discount", data.Discount.ToString());
            parms[7] = new ReportParameter("Payable", data.Payable.ToString());



            viewer.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", data.BookingItems));


           
             viewer.LocalReport.SetParameters(parms);
            bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);



            return File(bytes, mimeType);
        }
        
    }
}