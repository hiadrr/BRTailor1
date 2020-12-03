using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BRTailor.Controllers
{
   [Authorize]
    public class HomeController : Controller
    {
        private BRTailorEntities db = new BRTailorEntities();

        private ApplicationUserManager _userManager;
        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }
        public ActionResult Index()
        {
            var customer = db.Customers.ToList();
            ViewBag.Customer = customer.Count();

            var OrdersInProcess = db.Orders.Where(x=> x.Status == "In Process").ToList();
            ViewBag.OrdersInProcess = OrdersInProcess.Count();

            var OrdersInQueue = db.Orders.Where(x => x.Status == "Queue").ToList();
            ViewBag.OrdersInQueue = OrdersInQueue.Count();

            var OrdersCompleted = db.Orders.Where(x => x.Status == "Completed").ToList();
            ViewBag.OrdersCompleted = OrdersCompleted.Count();

            var OrdersReceived = db.Orders.Where(x => x.Status == "Received").ToList();
            ViewBag.OrdersReceived = OrdersReceived.Count();

            var staff = db.Staffs.ToList();
            ViewBag.staff = staff.Count();
           

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}