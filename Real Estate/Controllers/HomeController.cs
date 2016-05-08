using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Real_Estate.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Real Estate Management System";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Contact the profs";

            return View();
        }

        public ActionResult Search()
        {
            ViewBag.Message = "Search";

            return View();
        }

        public ActionResult Presentation()
        {
            ViewBag.Message = "Presentation";

            return View();
        }
    }
}