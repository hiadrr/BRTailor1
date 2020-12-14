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
    public class OrderController : Controller
    {
        private BRTailorEntities db = new BRTailorEntities();
        // GET: Order
        public ActionResult Queue()
        {
            var s = db.Orders.Where(x=>x.Status == "Queue").ToList();
            return View(s);
        }
        public ActionResult DeleteOrderByID(int? id)
        {
            var del = db.Orders.Find(id);
            db.Orders.Remove(del);
            db.SaveChanges();
            return View();
        }
        [HttpGet]
        public ActionResult assignAndBookOrder(int? id)
        {
            ViewBag.Orderid = id;
            dynamic model = new ExpandoObject();
            model.Order = db.Orders.Find(id);
            var data = db.Orders.Find(id);
            int c_id = Convert.ToInt32(data.Customer_ID);
            model.Customer = db.Customers.FirstOrDefault(x=> x.Customer_ID == c_id);
            model.Measurment = db.Measurments.FirstOrDefault(x => x.Measurment_ID == data.Measurment_ID);
            ViewBag.Staff_ID = new SelectList(db.Staffs, "Staff_ID", "Staff_Name");

            return View(model);
        }
        [HttpPost]
        public ActionResult assignAndBookOrder(OrderVM order)
        {
            int id = Convert.ToInt32(order.Order_ID);
            var data = db.Orders.Find(id);
            int staff = Convert.ToInt32(order.Staff_ID);
            var staffdata = db.Staffs.Find(staff);
            data.Staff_ID = order.Staff_ID;
            data.Staff_Name = staffdata.Staff_Name;
            data.Staff_Position = staffdata.Staff_Position;
            data.Status = "In Process";
            data.Order_Date = order.Order_Date;
            data.Return_Date = order.Return_Date;
            data.Price = order.Price;
            db.Entry(data).State = EntityState.Modified;
            db.SaveChanges();


            var orderstaff = db.Orders.Where(x => x.Staff_ID == staff && x.Status == "In Process");
            var orderstaff1 = db.Orders.Where(x => x.Staff_ID == staff && x.Status == "Completed");
            int inprocess = orderstaff.Count();
            int inprocess1 = orderstaff1.Count();
            //Staff Account 
            staffdata.TotalAmount += order.Price;
            staffdata.OrdersInProcess = inprocess;
            staffdata.OrdersCompleted = inprocess1;

            db.Entry(staffdata).State = EntityState.Modified;
            db.SaveChanges();



            return RedirectToAction("OrderInProcess");
        }
        [HttpGet]
        public ActionResult OrderInProcess()
        {
            var s = db.Orders.Where(x => x.Status == "In Process").ToList();
            return View(s);
        }

        public ActionResult StatusChanged(int? id)
        {
            var data = db.Orders.Find(id);
            data.Status = "Completed";
            db.Entry(data).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("OrderCompleted");
        }
        
        public ActionResult OrderCompleted()
        {


            var s = db.Orders.Where(x => x.Status == "Completed").ToList();
            return View(s);
        }
        public ActionResult StatusReceived(int? id)
        {
            var data = db.Orders.Find(id);
            data.Status = "Received";
            db.Entry(data).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("OrderReceived");
        }
        public ActionResult OrderReceived()
        {

            var s = db.Orders.Where(x => x.Status == "Received").ToList();
            return View(s);
        }
    }
}