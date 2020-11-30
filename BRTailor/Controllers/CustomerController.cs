using System;
using System.Collections.Generic;
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
            //haiderali
            return View();
        }
       
        }
}