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
        public ActionResult Index(int? id)
        {
            if(id != null )
            {
                var cus = db.Customers.Find(id);

                ViewBag.Name = cus.Customer_Name;
                ViewBag.Phone = cus.Customer_Phone;
                ViewBag.Address = cus.Customer_Address;
                ViewBag.City = cus.Customer_City;
                ViewBag.Measurment_Type_ID = new SelectList(db.MeasurmentTypes, "Measurment_Type_ID", "Measurment_Type");

                return View();
            }
            ViewBag.Name = "";
            ViewBag.Phone = "";
            ViewBag.Address = "";
            ViewBag.City = "";
            ViewBag.Measurment_Type_ID = new SelectList(db.MeasurmentTypes, "Measurment_Type_ID", "Measurment_Type");

            return View();

        }
        [HttpPost]
        public JsonResult Insertdata(MeasurmentViewModel data , int? id)
        {
            if (id == null)
            {
                bool status = false;
                if (ModelState.IsValid)
                {
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
                }
                else
                {
                    status = false;
                }
                foreach (var i in data.measurments)
                {

                    var m = new Measurment()
                    {

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
                    var customer = db.Customers.Find(id);

                    customer.Customer_Address = data.Address;
                    customer.Customer_City = data.City;
                    customer.Customer_image = data.Customer_image;
                    customer.Customer_Name = data.CustomerName;
                    customer.Customer_Phone = data.Phone;
                    customer.Customer_ID = Convert.ToInt32(id);
                    db.Entry(customer).State = EntityState.Modified;
                    data.CustomerID = customer.Customer_ID;
                    var s = (from t1 in db.Measurments where (t1.Customer_ID == id) select t1.Measurment_ID).ToList();
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
        public ActionResult CustomerByID(int? id)
        {

            var data = db.Measurments.Where(x => x.Customer_ID == id).ToList();
            return View(data);
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
            db.Customers.Remove(cus);
            db.SaveChanges();
            return RedirectToAction("CustomerList");
        }
       
    }
}