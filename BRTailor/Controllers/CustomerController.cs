using BRTailor.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BRTailor.Controllers
{
    [Authorize]
    public class CustomerController : Controller
    {
        private BRTailorEntities db = new BRTailorEntities();
        // GET: Customer
        public ActionResult Index()
        {
           
           
            ViewBag.Measurment_Type_ID = new SelectList(db.MeasurmentTypes, "Measurment_Type_ID", "Measurment_Type");

            return View();

        }
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                id = Convert.ToInt32(TempData["ID"]);
            }
            var cus = db.Customers.Find(id);
            ViewBag.ID = cus.Customer_ID;
            ViewBag.Name = cus.Customer_Name;
            ViewBag.Phone = cus.Customer_Phone;
            ViewBag.Address = cus.Customer_Address;
            ViewBag.City = cus.Customer_City;
            var data = db.Measurments.Where(x => x.Customer_ID == id).ToList();
         
            return View(data);
           
        }
        [HttpPost]
        public ActionResult EditCustomer(Customer data)
        {
           
                var user = db.Customers.Find(data.Customer_ID);

                user.Customer_Address = data.Customer_Address;
                user.Customer_Name = data.Customer_Name;
                user.Customer_Phone = data.Customer_Phone;
                user.Customer_City = data.Customer_City;
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
            TempData["ID"] = user.Customer_ID;
            

            return RedirectToAction("Edit");
            

        }
        [HttpGet]
        public ActionResult EditMeasurment(int? id)
        {
           
            var data = db.Measurments.FirstOrDefault(x => x.Measurment_ID == id);
            return View(data);
        }
        [HttpPost]
        public ActionResult EditMeasurment(Measurment data)
        {
            var d = db.Measurments.Find(data.Measurment_ID);
            d.arms = data.arms;
            d.Bottom = data.Bottom;
            d.btnDesign = data.btnDesign;
            d.Chest = data.Chest;
            d.CoatButton = data.CoatButton;
            d.CoatFitting = data.CoatFitting;
            d.CollarSize = data.CollarSize;
            d.Comments = data.Comments;
            d.CrossBack = data.CrossBack;
            d.Dcollor = data.Dcollor;
            d.FrontPocket = data.FrontPocket;
            d.Ghera = data.Ghera;
            d.Ghera_num = data.Ghera_num;
            d.Gidrii = data.Gidrii;
            d.Hip = data.Hip;
            d.Kaaf = data.Kaaf;
            d.Length = data.Length;
            d.shalwarPocket = data.shalwarPocket;
            d.Shoulder = data.Shoulder;
            d.SidePocket = data.SidePocket;
            d.Sleeves = data.Sleeves;
            d.Stitch = data.Stitch;
            d.suitDesign = data.suitDesign;
            d.Tera = data.Tera;
            d.Waist = data.Waist;
            db.Entry(d).State = EntityState.Modified;
            db.SaveChanges();
            TempData["ID"] = data.Customer_ID;
            return RedirectToAction("Edit");
        }
        [HttpPost]
        public JsonResult Insertdata(MeasurmentViewModel data, int? id)
        {
            int id1  = Convert.ToInt32(data.CustomerID);
           
                if (id1 == 0 && data.CustomerName != null)
                {

                    bool status = false;

                    var customer = new Customer()
                    {
                        Customer_Address = data.Address,
                        Customer_City = data.City,
                        Customer_image = data.Customer_image,
                        Customer_Name = data.CustomerName,
                        Customer_Phone = data.Phone
                    };
                    db.Customers.Add(customer);
                    db.SaveChanges();
                    data.CustomerID = customer.Customer_ID;
                    status = true;

                    foreach (var i in data.measurments)
                    {

                        var m = new Measurment()
                        {
                            Ghera_num = i.Ghera_num,
                            Comments = i.Comments,
                            Kaaf = i.Kaaf,
                            shalwarPocket = i.shalwarPocket,
                            
                            Measurment_Type = i.Measurment_Type,
                            arms = i.arms,
                            Bottom = i.Bottom,
                            Chest = i.Chest,
                            CollarSize = i.CollarSize,
                            Customer_ID = data.CustomerID,
                            FrontPocket = i.FrontPocket,
                            Length = i.Length,
                            Measurment_Type_ID = i.Measurment_Type_ID,
                            Sleeves = i.Sleeves,
                            Shoulder = i.Shoulder,
                            SidePocket = i.SidePocket,
                            Waist = i.Waist,
                            btnDesign = i.btnDesign,
                            CoatButton = i.CoatButton,
                            CoatFitting = i.CoatFitting,
                            CrossBack = i.CrossBack,
                            Dcollor = i.Dcollor,
                            Ghera = i.Ghera,
                            Gidrii = i.Gidrii,
                            Hip = i.Hip,
                            MeasurmentType = i.MeasurmentType,
                            suitDesign = i.suitDesign,
                            Tera = i.Tera,
                            Stitch = i.Stitch
                            
                        };
                        db.Measurments.Add(m);
                        db.SaveChanges();

                    }
                    return new JsonResult { Data = new { status = status } };
                }
            
            else 
            {

                bool status = false;
                if (ModelState.IsValid)
                {
                    var customer = db.Customers.Find(id1);

                    customer.Customer_Address = data.Address;
                    customer.Customer_City = data.City;
                    customer.Customer_image = data.Customer_image;
                    customer.Customer_Name = data.CustomerName;
                    customer.Customer_Phone = data.Phone;
                    customer.Customer_ID = Convert.ToInt32(id1);
                    db.Entry(customer).State = EntityState.Modified;
                    data.CustomerID = customer.Customer_ID;
                    var s = (from t1 in db.Measurments where (t1.Customer_ID == id1) select t1.Measurment_ID).ToList();
                    foreach (var item in s)
                    {
                        Measurment me = db.Measurments.Find(item);
                        db.Measurments.Remove(me);
                    };
                    db.SaveChanges();



                    status = true;
                }
                else
                {
                    status = false;
                }
                foreach (var i in data.measurments)
                {

                    var m = new Measurment()
                    {

                        Measurment_Type = i.Measurment_Type,
                        arms = i.arms,
                        Bottom = i.Bottom,
                        Chest = i.Chest,
                        CollarSize = i.CollarSize,
                        Customer_ID = data.CustomerID,
                        FrontPocket = i.FrontPocket,
                        Length = i.Length,
                        Measurment_Type_ID = i.Measurment_Type_ID,
                        Sleeves = i.Sleeves,
                        Shoulder = i.Shoulder,
                        SidePocket = i.SidePocket,
                        Waist = i.Waist,
                        btnDesign = i.btnDesign,
                        CoatButton = i.CoatButton,
                        CoatFitting = i.CoatFitting,
                        CrossBack = i.CrossBack,
                        Dcollor = i.Dcollor,
                        Ghera = i.Ghera,
                        Gidrii = i.Gidrii,
                        Hip = i.Hip,
                        MeasurmentType = i.MeasurmentType,
                        suitDesign = i.suitDesign,
                        Tera = i.Tera,
                        Stitch = i.Stitch
                    };
                    db.Measurments.Add(m);
                    db.SaveChanges();

                }

                return new JsonResult { Data = new { status = status } };
            }

            
        }
        public ActionResult CustomerList()
        {
          
            var s = db.Customers.ToList();
            return View(s);
        }
      
        public ActionResult CustomerByID(int? id,string measurment_type, string user)
        {
            TempData["CustomerID"] = id;
            ViewBag.Measurment_Type_ID = new SelectList(db.Measurments.Where(x => x.Customer_ID == id), "Measurment_Type_ID", "Measurment_Type");
            if (measurment_type != null)
            {
                id = Convert.ToInt32(user);
                ViewBag.Measurment_Type_ID = new SelectList(db.Measurments.Where(x => x.Customer_ID == id), "Measurment_Type_ID", "Measurment_Type");
                int value = Convert.ToInt32(measurment_type);

                var data = db.Measurments.FirstOrDefault(x => x.Measurment_Type_ID == value && x.Customer_ID == id);
                TempData["Mtype"] = value;
                TempData["CustomerID"] = id;
                return View(data);
            }
            Measurment m = new Measurment();
            return View(m);
        }
      
        public ActionResult DeleteCustomer(int? id)
        {
            Customer cus = db.Customers.Find(id);
            var s = (from t1 in db.Measurments where (t1.Customer_ID == id) select t1.Measurment_ID).ToList();
            foreach (var item in s)
            {
                Measurment me = db.Measurments.Find(item);
                db.Measurments.Remove(me);
            };
            var o = (from t1 in db.Orders where (t1.Customer_ID == id) select t1.Order_ID).ToList();
            foreach (var item in o)
            {
                Order me = db.Orders.Find(item);
                db.Orders.Remove(me);
            };
            var b = (from t1 in db.Bookings where (t1.Customer_ID == id) select t1.Bookin_ID).ToList();
           
            foreach (var item in b)
            {
                var del = (from t1 in db.BookingItems where (t1.Booking_ID == item) select t1.BT_ID).ToList();
                foreach (var i in del)
                {
                    BookingItem bI = db.BookingItems.Find(i);
                    db.BookingItems.Remove(bI);
                }
                Booking me = db.Bookings.Find(item);
                db.Bookings.Remove(me);
            };
            db.Customers.Remove(cus);
            db.SaveChanges();
            return RedirectToAction("CustomerList");
        }
    
        public ActionResult SearchCustomer(string Search,string Searchid)
        {
            if (Search != null)
            {
                var data = db.Customers.FirstOrDefault(x => x.Customer_Phone == Search);
                if (data != null)
                {
                    TempData["SearchCheck"] = true;
                    return PartialView(data);
                }
            }
            else if (Searchid != null)
            {
                int id = Convert.ToInt32(Searchid);
                var data = db.Customers.FirstOrDefault(x => x.Customer_ID == id);
                if (data != null)
                {
                    TempData["SearchCheck"] = true;
                    return PartialView(data);
                }

            }
            return View();
        }
       
    }
}