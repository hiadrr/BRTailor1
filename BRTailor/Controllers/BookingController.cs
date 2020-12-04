
using System;
using System.Collections.Generic;
using System.Dynamic;
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
            ViewBag.Design_ID = new SelectList(db.MeasurmentTypes, "Design_ID", "Design_Code");
            var fromDatabaseEF = new SelectList(db.Designs.ToList(), "Design_ID", "Design_Code");
            ViewData["DBMySkills"] = fromDatabaseEF;

            return View(model);
        }
        public JsonResult GetDesign(int? Design_ID)
        {
            var data = db.Designs.FirstOrDefault(x => x.Design_ID == Design_ID);

            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GenerateBill(Booking booking)
        {
            Booking b = new Booking();
            b.Customer_Address = booking.Customer_Address;
            b.Customer_City = booking.Customer_City;
            b.Customer_ID = booking.Customer_ID;
            b.Customer_Phone = booking.Customer_Phone;
            b.Customer_Name = booking.Customer_Name;
            b.Design_ID = booking.Design_ID;
            b.Design_Price = booking.Design_Price;
            b.Measurment_Type = booking.Measurment_Type;
            b.Measurment_Type_ID = booking.Measurment_Type_ID;
            b.Price = booking.Price;
            b.Design_Price = booking.Design_Price;

            var design = db.Designs.FirstOrDefault(x => x.Design_ID == booking.Design_ID);
            b.Design_Code = design.Design_Code;
            db.Bookings.Add(b);
            db.SaveChanges();
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
            { return RedirectToAction("Index", "Home"); }

            return RedirectToAction("Index", "Home");
       
        }
        public ActionResult Invoice()
        {
            return View();
        }
    }
}