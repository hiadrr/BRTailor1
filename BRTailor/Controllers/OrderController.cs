using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BRTailor.Controllers
{
    public class OrderController : Controller
    {
        private BRTailorEntities db = new BRTailorEntities();
        // GET: Order
        public ActionResult Queue()
        {
            var s = db.Orders.ToList();
            return View(s);
        }
        public ActionResult DeleteOrderByID(int? id)
        {
            var del = db.Orders.Find(id);
            db.Orders.Remove(del);
            db.SaveChanges();
            return View();
        }
        public ActionResult assignAndBookOrder(int? id)
        {
            dynamic model = new ExpandoObject();
            model.Order = db.Orders.Find(id);
            var data = db.Orders.Find(id);
            int c_id = Convert.ToInt32(data.Customer_ID);
            model.Customer = db.Customers.FirstOrDefault(x=> x.Customer_ID == c_id);
            model.Measurment = db.Measurments.FirstOrDefault(x => x.Measurment_ID == data.Measurment_ID);
            ViewBag.Staff_ID = new SelectList(db.Staffs, "Staff_ID", "Staff_Name");

            return View(model);
        }
    }
}