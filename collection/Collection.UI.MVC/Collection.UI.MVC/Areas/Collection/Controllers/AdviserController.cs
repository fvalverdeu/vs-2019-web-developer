using Collection.Application.Interfaces.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading;
using System.Web;
using System.Web.Mvc;

namespace Collection.UI.MVC.Areas.Collection.Controllers
{
    public class AdviserController : Controller
    {
        // GET: Collection/Adviser
        private readonly ICollectionManagementActionRepository _collectionManagementActionRepository;
        public ActionResult Error()
        {
            throw new System.Exception("Ocurrió un error");
        }

        public AdviserController(ICollectionManagementActionRepository collectionManagementActionRepository)
        {
            _collectionManagementActionRepository = collectionManagementActionRepository;
        }
        public ActionResult Index()
        {
            var identity = (ClaimsPrincipal)Thread.CurrentPrincipal;
            var id = identity.Claims.Where(c => c.Type == ClaimTypes.NameIdentifier).Select(c => c.Value).SingleOrDefault();
            return View(_collectionManagementActionRepository.GetCollectionManagementAction(int.Parse(id)));
            //return View();
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