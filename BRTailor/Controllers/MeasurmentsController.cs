using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BRTailor;

namespace BRTailor.Controllers
{
    [Authorize]
    public class MeasurmentsController : Controller
    {
        private BRTailorEntities db = new BRTailorEntities();

        // GET: Measurments
        public ActionResult Index()
        {
            var measurments = db.Measurments.Include(m => m.MeasurmentType);
            return View(measurments.ToList());
        }

        // GET: Measurments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Measurment measurment = db.Measurments.Find(id);
            if (measurment == null)
            {
                return HttpNotFound();
            }
            return View(measurment);
        }

        // GET: Measurments/Create
        public ActionResult Create()
        {
            ViewBag.Measurment_Type_ID = new SelectList(db.MeasurmentTypes, "Measurment_Type_ID", "Measurment_Type");
            return View();
        }

        // POST: Measurments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Measurment_ID,Measurment_Type_ID,Customer_ID,Length,Chest,Shoulder,Waist,Sleeves,arms,Collar,Bottom,SidePocket,FrontPocket")] Measurment measurment)
        {
            if (ModelState.IsValid)
            {
                db.Measurments.Add(measurment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Measurment_Type_ID = new SelectList(db.MeasurmentTypes, "Measurment_Type_ID", "Measurment_Type", measurment.Measurment_Type_ID);
            return View(measurment);
        }

        // GET: Measurments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Measurment measurment = db.Measurments.Find(id);
            if (measurment == null)
            {
                return HttpNotFound();
            }
            ViewBag.Measurment_Type_ID = new SelectList(db.MeasurmentTypes, "Measurment_Type_ID", "Measurment_Type", measurment.Measurment_Type_ID);
            return View(measurment);
        }

        // POST: Measurments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Measurment_ID,Measurment_Type_ID,Customer_ID,Length,Chest,Shoulder,Waist,Sleeves,arms,Collar,Bottom,SidePocket,FrontPocket")] Measurment measurment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(measurment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Measurment_Type_ID = new SelectList(db.MeasurmentTypes, "Measurment_Type_ID", "Measurment_Type", measurment.Measurment_Type_ID);
            return View(measurment);
        }

        // GET: Measurments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Measurment measurment = db.Measurments.Find(id);
            if (measurment == null)
            {
                return HttpNotFound();
            }
            return View(measurment);
        }

        // POST: Measurments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Measurment measurment = db.Measurments.Find(id);
            db.Measurments.Remove(measurment);
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
