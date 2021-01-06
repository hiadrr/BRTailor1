using Microsoft.Reporting.WebForms;
using System;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BRTailor.Controllers
{

    [Authorize(Roles = "Super Admin")]
    public class AdminController : Controller
    {
        private BRTailorEntities db = new BRTailorEntities();
 
        //Add DEsign
        public ActionResult DesignIndex()
        {
            var data = db.Designs.ToList();
            return View(data);
        }
       
        [HttpGet]
        public ActionResult AddDesign()
        {

            return View();
        }
        [HttpPost]
        public ActionResult AddDesign(Design design, HttpPostedFileBase Design_Image)
        {

            string pic = "";
            if (Design_Image != null)
            {
                pic = System.IO.Path.GetFileName(Design_Image.FileName);
                string path = "/Content/DesignImages/" + pic;
                Design_Image.SaveAs(Server.MapPath(path));
                design.Design_Image = path;
            }
            else
            {
                design.Design_Image = "null";
            }
            db.Designs.Add(design);
            db.SaveChanges();
            return View();
        }
        // GET: Designs/Edit/5
        public ActionResult EditDesign(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Design design = db.Designs.Find(id);
            if (design == null)
            {
                return HttpNotFound();
            }
            return View(design);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditDesign([Bind(Include = "Design_ID,Design_Code,Design_Image,Design_Price")] Design design)
        {
            if (ModelState.IsValid)
            {
                db.Entry(design).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DesignIndex");
            }
            return View(design);
        }

       
        public ActionResult DeleteDesign(int id)
        {
            Design design = db.Designs.Find(id);
            db.Designs.Remove(design);
            db.SaveChanges();
            return RedirectToAction("DesignIndex");
        }

        public ActionResult CategoryIndex()
        {
            var data = db.MeasurmentTypes.ToList();
            return View(data);
        }
        [HttpGet]
        public ActionResult AddCategory()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddCategory(MeasurmentType type)
        {
            db.MeasurmentTypes.Add(type);
            db.SaveChanges();
            return View();
        }
        public ActionResult EditCategory(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MeasurmentType design = db.MeasurmentTypes.Find(id);
            if (design == null)
            {
                return HttpNotFound();
            }
            return View(design);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditCategory( MeasurmentType design)
        {
            if (ModelState.IsValid)
            {
                db.Entry(design).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("CategoryIndex");
            }
            return View(design);
        }

      
        public ActionResult DeleteCategory(int id)
        {
            MeasurmentType design = db.MeasurmentTypes.Find(id);
            db.MeasurmentTypes.Remove(design);
            db.SaveChanges();
            return RedirectToAction("CategoryIndex");
        }

        public ActionResult MonthlySales()
        {
            var Item = new SelectList(db.MeasurmentTypes.ToList(), "Measurment_Type_ID", "Measurment_Type");
            ViewData["DBMyMeasurment"] = Item;
            return View();
        }
        
        public ActionResult PtintMonthlySales(DateTime? FromDate = null, DateTime? ToDate = null)
        {
            Warning[] warnings;
            string mimeType = "";
            string[] streamids;
            string encoding;
            string filenameExtension;
            byte[] bytes = null;
            var path = Path.Combine(Server.MapPath("~/Report"), "SalesReport.rdlc");
            var viewer = new ReportViewer();
            viewer.LocalReport.ReportPath = path;

             var data = db.Bookings.Where(x => x.date >= FromDate && x.date <= ToDate);
             viewer.LocalReport.DataSources.Add(new ReportDataSource("DataSet2", data));
             bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);
             return File(bytes, mimeType);

           
        }
        public ActionResult ReportByitem(DateTime? FromDate = null, DateTime? ToDate = null, string drpCategory ="")
        {
            Warning[] warnings;
            string mimeType = "";
            string[] streamids;
            string encoding;
            string filenameExtension;
            byte[] bytes = null;
            var path = Path.Combine(Server.MapPath("~/Report"), "MonthlywithCategory.rdlc");
            var viewer = new ReportViewer();
            viewer.LocalReport.ReportPath = path;

            var data = db.BookingItems.Where(x => x.ServiceName == drpCategory && x.date >= FromDate && x.date <= ToDate  );
            viewer.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", data));
            bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);
            return File(bytes, mimeType);


        }
        public ActionResult PtintMonthlyStaff(DateTime? FromDate = null, DateTime? ToDate = null)
        {
            Warning[] warnings;
            string mimeType = "";
            string[] streamids;
            string encoding;
            string filenameExtension;
            byte[] bytes = null;
            var path = Path.Combine(Server.MapPath("~/Report"), "StaffMonthly.rdlc");
            var viewer = new ReportViewer();
            viewer.LocalReport.ReportPath = path;

            var data = db.Orders.Where(x => x.Order_Date >= FromDate && x.Order_Date <= ToDate);
            viewer.LocalReport.DataSources.Add(new ReportDataSource("OrderDataSet", data));
            bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);
            return File(bytes, mimeType);


        }
        public ActionResult StaffByitem(DateTime? FromDate = null, DateTime? ToDate = null, string drpCategory = "")
        {
            Warning[] warnings;
            string mimeType = "";
            string[] streamids;
            string encoding;
            string filenameExtension;
            byte[] bytes = null;
            var path = Path.Combine(Server.MapPath("~/Report"), "StaffByItem.rdlc");
            var viewer = new ReportViewer();
            viewer.LocalReport.ReportPath = path;

            var data = db.Orders.Where(x => x.Measurment_Type == drpCategory && x.Order_Date >= FromDate && x.Order_Date <= ToDate);
            viewer.LocalReport.DataSources.Add(new ReportDataSource("OrderDataSet", data));
            bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);
            return File(bytes, mimeType);


        }
        public ActionResult StaffAccount()
        {
            Warning[] warnings;
            string mimeType = "";
            string[] streamids;
            string encoding;
            string filenameExtension;
            byte[] bytes = null;
            var path = Path.Combine(Server.MapPath("~/Report"), "StaffAccount.rdlc");
            var viewer = new ReportViewer();
            viewer.LocalReport.ReportPath = path;

            var data = db.Staffs.ToList();
            viewer.LocalReport.DataSources.Add(new ReportDataSource("StaffDataSet", data));
            bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);
            return File(bytes, mimeType);
            
        }

    }
}