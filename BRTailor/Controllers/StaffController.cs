using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
namespace BRTailor.Controllers
{
    [Authorize]
    public class StaffController : Controller
    {
       
        private BRTailorEntities db = new BRTailorEntities();
        // GET: Staff
        public ActionResult AddStaff()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddStaff(Staff s)
        {
            if (ModelState.IsValid)
            {
                db.Staffs.Add(s);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(s);
        }
        [HttpGet]
        public ActionResult Index()
        {
           
         
            return View(db.Staffs.ToList());
        }
        public ActionResult StaffByID(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Staff staff = db.Staffs.Find(id);
            if (staff == null)
            {
                return HttpNotFound();
            }
            return View(staff);
        }
        [HttpGet]
        public ActionResult EditStaff(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Staff staff = db.Staffs.Find(id);
            if (staff == null)
            {
                return HttpNotFound();
            }
            return View(staff);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditStaff(Staff staff)
        {
            if (ModelState.IsValid)
            {
                db.Entry(staff).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(staff);
        }

        public ActionResult DeleteStaff(int id)
        {
            Staff staff = db.Staffs.Find(id);
            db.Staffs.Remove(staff);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
       

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}