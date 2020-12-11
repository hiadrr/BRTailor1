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
    public class AdminController : Controller
    {
        private BRTailorEntities db = new BRTailorEntities();
        // GET: Admin
        public ActionResult MonthlySalesRecord()
        {
            return View();
        }
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
    }
}