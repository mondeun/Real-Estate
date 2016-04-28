﻿using System;
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
    public class AgentsController : Controller
    {
        private RealEstateContext db = new RealEstateContext();

        // GET: Agents
        public ActionResult Index()
        {
            var persons = db.Agents.Include(a => a.City).Include(a => a.ZipCode).Include(a => a.Office);
            return View(persons.ToList());
        }

        // GET: Agents/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Agent agent = db.Agents.Find(id);
            if (agent == null)
            {
                return HttpNotFound();
            }
            return View(agent);
        }

        // GET: Agents/Create
        public ActionResult Create()
        {
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName");
            ViewBag.ZipcodeID = new SelectList(db.ZipCodes, "ZipCodeID", "ZipCodes");
            ViewBag.OfficeID = new SelectList(db.Offices, "OfficeID", "OfficeName");
            return View();
        }

        // POST: Agents/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PersonID,ZipcodeID,CityID,FirstName,LastName,Pnr,Address,Email,OfficeID")] Agent agent)
        {
            if (ModelState.IsValid)
            {
                db.Persons.Add(agent);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", agent.CityID);
            ViewBag.ZipcodeID = new SelectList(db.ZipCodes, "ZipCodeID", "ZipCodes", agent.ZipCodeID);
            ViewBag.OfficeID = new SelectList(db.Offices, "OfficeID", "OfficeName", agent.OfficeID);
            return View(agent);
        }

        // GET: Agents/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Agent agent = db.Agents.Find(id);
            if (agent == null)
            {
                return HttpNotFound();
            }
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", agent.CityID);
            ViewBag.ZipcodeID = new SelectList(db.ZipCodes, "ZipCodeID", "ZipCodes", agent.ZipCodeID);
            ViewBag.OfficeID = new SelectList(db.Offices, "OfficeID", "OfficeName", agent.OfficeID);
            return View(agent);
        }

        // POST: Agents/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PersonID,ZipcodeID,CityID,FirstName,LastName,Pnr,Address,Email,OfficeID")] Agent agent)
        {
            if (ModelState.IsValid)
            {
                db.Entry(agent).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", agent.CityID);
            ViewBag.ZipcodeID = new SelectList(db.ZipCodes, "ZipCodeID", "ZipCodes", agent.ZipCodeID);
            ViewBag.OfficeID = new SelectList(db.Offices, "OfficeID", "OfficeName", agent.OfficeID);
            return View(agent);
        }

        // GET: Agents/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Agent agent = db.Agents.Find(id);
            if (agent == null)
            {
                return HttpNotFound();
            }
            return View(agent);
        }

        // POST: Agents/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Agent agent = db.Agents.Find(id);
            db.Persons.Remove(agent);
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
