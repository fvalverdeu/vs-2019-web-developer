using Collection.Application.Interfaces.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Collection.UI.MVC.Areas.Administrator.Controllers
{
    public class AdminController : Controller
    {
        private readonly ICollectionManagementRepository _collectionManagementRepository;
        public ActionResult Error()
        {
            throw new System.Exception("Ocurrió un error");
        }

        public AdminController(ICollectionManagementRepository collectionManagementRepository)
        {
            _collectionManagementRepository = collectionManagementRepository;
        }

        // GET: Administrator/Admin
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GenerateCollectionAction()
        {
            int result = _collectionManagementRepository.GenerateCollectionAction();
            return RedirectToAction("Index");
        }

        // GET: Administrator/Admin/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Administrator/Admin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Administrator/Admin/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Administrator/Admin/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Administrator/Admin/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Administrator/Admin/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Administrator/Admin/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult LogOut()
        {
            var context = Request.GetOwinContext();
            var authManager = context.Authentication;
            authManager.SignOut("ApplicationCookie");
            return RedirectToAction("Login", "Account", new { Area = "" });
        }
    }
}