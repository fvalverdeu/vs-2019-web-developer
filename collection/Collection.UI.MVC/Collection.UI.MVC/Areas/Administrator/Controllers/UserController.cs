using Collection.Application.Interfaces.Queries;
using Collection.Application.Interfaces.Repositories;
using Collection.Application.Interfaces.UseCases;
using Collection.Domain.Users;
using Collection.UI.MVC.Helpers;
using Collection.UI.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Collection.UI.MVC.Areas.Administrator.Controllers
{
    public class UserController : Controller
    {
        // GET: Administrator/User
        private readonly IUserQuery _userQuery;
        private readonly IUserRepository _userRepository;
        private readonly IUserUseCase userUseCase;
        public ActionResult Error()
        {
            throw new System.Exception("Ocurrió un error");
        }

        public UserController(IUserQuery userQuery, IUserRepository userRepository, IUserUseCase userUseCase)
        {
            _userQuery = userQuery;
            _userRepository = userRepository;
            this.userUseCase = userUseCase;
        }

        // GET: User
        public ActionResult Index()
        {
            var model = _userQuery.GetAllUsers();
            return View(model);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(UserListViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new Users();
                user = Mappers.UserListViewModelToUsersMapping().Map(model, user);
                user = userUseCase.Register(user);
                if (user == null)
                {
                    return RedirectToAction("Index");
                }
            }
            //return Json(retorno);
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            return View(_userRepository.Get(id));
        }

        [HttpPost]
        public ActionResult Edit(UserListViewModel model)
        {
            var user = new Users();
            user = Mappers.UserListViewModelToUsersMapping().Map(model, user);
            if (userUseCase.Update(user)) return RedirectToAction("Index");
            return View(user);
        }

        public ActionResult Details(int id)
        {
            return View(_userRepository.Get(id));
        }

        public ActionResult Delete(int id)
        {
            return View(_userRepository.Get(id));
        }

        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DeletePost(int id)
        {
            Users user = new Users();
            user = _userRepository.Get(id);

            if (userUseCase.Remove(user))
            {
                return RedirectToAction("Index");
            }
            return View(user);
        }
    }
}