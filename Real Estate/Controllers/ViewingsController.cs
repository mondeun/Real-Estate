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
    public class ViewingsController : Controller
    {
        private RealEstateContext db = new RealEstateContext();

        // GET: Viewings
        public ActionResult Index()
        {
            var viewings = db.Viewings.Include(v => v.Agent).Include(v => v.RealEstateObject);
            return View(viewings.ToList());
        }

        // GET: Viewings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Viewing viewing = db.Viewings.Find(id);
            if (viewing == null)
            {
                return HttpNotFound();
            }
            return View(viewing);
        }

        // GET: Viewings/Create
        public ActionResult Create()
        {
            ViewBag.AgentID = new SelectList(db.Agents, "PersonID", "FullName");
            ViewBag.RealEstateObjectID = new SelectList(db.RealEstateObjects, "RealEstateObjectID", "Address");
            return View();
        }

        // POST: Viewings/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ViewingID,RealEstateObjectID,AgentID,ViewingStart,ViewingStop,MaximumNoCustomerPerViewing")] Viewing viewing)
        {
            if (ModelState.IsValid)
            {
                db.Viewings.Add(viewing);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AgentID = new SelectList(db.Agents, "PersonID", "FullName", viewing.AgentID);
            ViewBag.RealEstateObjectID = new SelectList(db.RealEstateObjects, "RealEstateObjectID", "Address", viewing.RealEstateObjectID);
            return View(viewing);
        }

        // GET: Viewings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Viewing viewing = db.Viewings.Find(id);
            if (viewing == null)
            {
                return HttpNotFound();
            }
            ViewBag.AgentID = new SelectList(db.Agents, "PersonID", "FullName", viewing.AgentID);
            ViewBag.RealEstateObjectID = new SelectList(db.RealEstateObjects, "RealEstateObjectID", "Address", viewing.RealEstateObjectID);
            return View(viewing);
        }

        // POST: Viewings/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ViewingID,RealEstateObjectID,AgentID,ViewingStart,ViewingStop,MaximumNoCustomerPerViewing")] Viewing viewing)
        {
            if (ModelState.IsValid)
            {
                db.Entry(viewing).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AgentID = new SelectList(db.Agents, "PersonID", "FullName", viewing.AgentID);
            ViewBag.RealEstateObjectID = new SelectList(db.RealEstateObjects, "RealEstateObjectID", "Address", viewing.RealEstateObjectID);
            return View(viewing);
        }

        // GET: Viewings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Viewing viewing = db.Viewings.Find(id);
            if (viewing == null)
            {
                return HttpNotFound();
            }
            return View(viewing);
        }

        // POST: Viewings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Viewing viewing = db.Viewings.Find(id);
            db.Viewings.Remove(viewing);
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
