using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Real_Estate.DAL;
using Real_Estate.Models;

namespace Real_Estate.Controllers
{
    public class RealEstateObjectsController : Controller
    {
        private RealEstateContext db = new RealEstateContext();

        // GET: RealEstateObjects
        public ActionResult Index(string sortOrder)
        {
            ViewBag.AgentSortParam = String.IsNullOrEmpty(sortOrder) ? "agent_desc" : "";
            ViewBag.CitySortParam = sortOrder == "city_asc" ? "city_desc" : "city_asc";
            ViewBag.CustomerSortParam = sortOrder == "customer_asc" ? "customer_desc" : "customer_asc";
            ViewBag.ZipCodeSortParam = sortOrder == "zipcode_asc" ? "zipcode_desc" : "zipcode_asc";
            ViewBag.ContractSortParam = sortOrder == "contract_asc" ? "contract_desc" : "contract_asc";
            ViewBag.EstateSortParam = sortOrder == "estate_asc" ? "estate_desc" : "estate_asc";
            ViewBag.SqmSortParam = sortOrder == "sqm_asc" ? "sqm_desc" : "sqm_asc";
            var realEstateObjects = db.RealEstateObjects.Include(r => r.Agent).Include(r => r.City).Include(r => r.Customer).Include(r => r.ZipCode);

            switch (sortOrder)
            {
                case "agent_desc":
                    realEstateObjects = realEstateObjects.OrderByDescending(r => r.AgentID);
                    break;
                case "city_desc":
                    realEstateObjects = realEstateObjects.OrderByDescending(r => r.CityID);
                    break;
                case "city_asc":
                    realEstateObjects = realEstateObjects.OrderBy(r => r.CityID);
                    break;
                case "customer_desc":
                    realEstateObjects = realEstateObjects.OrderByDescending(r => r.CustomerID);
                    break;
                case "customer_asc":
                    realEstateObjects = realEstateObjects.OrderBy(r => r.CustomerID);
                    break;
                case "zipcode_desc":
                    realEstateObjects = realEstateObjects.OrderByDescending(r => r.ZipCodeID);
                    break;
                case "zipcode_asc":
                    realEstateObjects = realEstateObjects.OrderBy(r => r.ZipCodeID);
                    break;
                case "contract_desc":
                    realEstateObjects = realEstateObjects.OrderByDescending(r => r.Contract);
                    break;
                case "contract_asc":
                    realEstateObjects = realEstateObjects.OrderBy(r => r.Contract);
                    break;
                case "estate_desc":
                    realEstateObjects = realEstateObjects.OrderByDescending(r => r.EstateType);
                    break;
                case "estate_asc":
                    realEstateObjects = realEstateObjects.OrderBy(r => r.EstateType);
                    break;
                case "sqm_desc":
                    realEstateObjects = realEstateObjects.OrderByDescending(r => r.Sqm);
                    break;
                case "sqm_asc":
                    realEstateObjects = realEstateObjects.OrderBy(r => r.Sqm);
                    break;
                default:
                    realEstateObjects = realEstateObjects.OrderBy(r => r.AgentID);
                    break;
            }

            return View(realEstateObjects.ToList());
        }

        // GET: RealEstateObjects/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RealEstateObject realEstateObject = db.RealEstateObjects.Find(id);
            if (realEstateObject == null)
            {
                return HttpNotFound();
            }
            return View(realEstateObject);
        }

        // GET: RealEstateObjects/Create
        public ActionResult Create()
        {
            ViewBag.AgentID = new SelectList(db.Agents, "PersonID", "FullName");
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName");
            ViewBag.CustomerID = new SelectList(db.Customers, "PersonID", "FullName");
            ViewBag.ZipCodeID = new SelectList(db.ZipCodes, "ZipCodeID", "ZipCodes");
            return View();
        }

        // POST: RealEstateObjects/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "RealEstateObjectID,Contract,EstateType,AgentID,CustomerID,Sqm,Address,CityID,ZipCodeID,DateOnMarket,SaleDate")] RealEstateObject realEstateObject)
        {
            if (ModelState.IsValid)
            {
                db.RealEstateObjects.Add(realEstateObject);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AgentID = new SelectList(db.Agents, "PersonID", "FullName", realEstateObject.AgentID);
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", realEstateObject.CityID);
            ViewBag.CustomerID = new SelectList(db.Customers, "PersonID", "FullName", realEstateObject.CustomerID);
            ViewBag.ZipCodeID = new SelectList(db.ZipCodes, "ZipCodeID", "ZipCodes", realEstateObject.ZipCodeID);
            return View(realEstateObject);
        }

        // GET: RealEstateObjects/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RealEstateObject realEstateObject = db.RealEstateObjects.Find(id);
            if (realEstateObject == null)
            {
                return HttpNotFound();
            }
            ViewBag.AgentID = new SelectList(db.Agents, "PersonID", "FullName", realEstateObject.AgentID);
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", realEstateObject.CityID);
            ViewBag.CustomerID = new SelectList(db.Customers, "PersonID", "FullName", realEstateObject.CustomerID);
            ViewBag.ZipCodeID = new SelectList(db.ZipCodes, "ZipCodeID", "ZipCodes", realEstateObject.ZipCodeID);
            return View(realEstateObject);
        }

        // POST: RealEstateObjects/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "RealEstateObjectID,Contract,EstateType,AgentID,CustomerID,Sqm,Address,CityID,ZipCodeID,DateOnMarket,SaleDate")] RealEstateObject realEstateObject)
        {
            if (ModelState.IsValid)
            {
                db.Entry(realEstateObject).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AgentID = new SelectList(db.Agents, "PersonID", "FullName", realEstateObject.AgentID);
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", realEstateObject.CityID);
            ViewBag.CustomerID = new SelectList(db.Customers, "PersonID", "FullName", realEstateObject.CustomerID);
            ViewBag.ZipCodeID = new SelectList(db.ZipCodes, "ZipCodeID", "ZipCodes", realEstateObject.ZipCodeID);
            return View(realEstateObject);
        }

        // GET: RealEstateObjects/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RealEstateObject realEstateObject = db.RealEstateObjects.Find(id);
            if (realEstateObject == null)
            {
                return HttpNotFound();
            }
            return View(realEstateObject);
        }

        // POST: RealEstateObjects/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RealEstateObject realEstateObject = db.RealEstateObjects.Find(id);
            db.RealEstateObjects.Remove(realEstateObject);
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
