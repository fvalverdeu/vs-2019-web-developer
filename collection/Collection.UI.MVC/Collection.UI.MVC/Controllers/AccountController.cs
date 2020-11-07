using Collection.Application.DTO.Users;
using Collection.Application.Interfaces.UseCases;
using Collection.UI.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading;
using System.Web;
using System.Web.Mvc;

namespace Collection.UI.MVC.Controllers
{
    public class AccountController : Controller
    {
        private readonly IUserUseCase userUseCase;

        public AccountController(IUserUseCase usuarioUseCase)
        {
            this.userUseCase = usuarioUseCase;
        }

        // GET: Account
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            return View(new UserViewModel { ReturnUrl = returnUrl });
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login(UserViewModel user)
        {
            var validUser = userUseCase.ValidateUser(
                new LoginRequestDTO() { Email = user.Email, Password = user.Password }
                );

            if (!ModelState.IsValid) return View(user);
            if (validUser == null)
            {
                ModelState.AddModelError("Error", "Invalid email or password");
                return View(user);
            }
            var identity = new ClaimsIdentity(new[]
            {
                new Claim(ClaimTypes.Email, validUser.Email),
                new Claim(ClaimTypes.Name, $"{validUser.FirstName} {validUser.LastName}"),
                new Claim(ClaimTypes.NameIdentifier, validUser.UserId.ToString()),
                new Claim(ClaimTypes.Role, validUser.RoleId.ToString()),
            }, "ApplicationCookie");

            var claimsPrincipal = new ClaimsPrincipal(identity);
            // Set current principal
            Thread.CurrentPrincipal = claimsPrincipal;

            var context = Request.GetOwinContext();
            var authManager = context.Authentication;

            authManager.SignIn(identity);

            return RedirectToLocal(user.ReturnUrl);
        }

        //[AllowAnonymous]
        //public ActionResult Register()
        //{
        //    List<Roles> roles = new List<Roles>();
        //    roles = (List<Roles>)_unit.Role.GetList();
        //    List<SelectListItem> items = roles.ConvertAll(item =>
        //    {
        //        return new SelectListItem()
        //        {
        //            Text = item.Name.ToString(),
        //            Value = item.RoleId.ToString(),
        //            Selected = false
        //        };
        //    });
        //    ViewBag.Roles = items;
        //    return View();
        //}

        //[HttpPost]
        //[AllowAnonymous]
        //public ActionResult Register(RegisterUserViewModel userView)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return View(userView);
        //    }

        //    Users user = new Users
        //    {
        //        Email = userView.Email,
        //        FirstName = userView.FirstName,
        //        LastName = userView.LastName,
        //        Password = userView.Password,
        //        RoleId = userView.RoleId
        //    };
        //    var validUser = _unit.User.CreateUser(user);
        //    if (validUser == null)
        //    {
        //        ModelState.AddModelError("Error", "Invalid email or password");
        //        return View(user);
        //    }

        //    /* Si se quiere autenticar automáticamente luego del registro.
        //    var identity = new ClaimsIdentity(new[]
        //    {
        //        new Claim(ClaimTypes.Email, validUser.Email),
        //        new Claim(ClaimTypes.Role, validUser.Roles),
        //        new Claim(ClaimTypes.Name, $"{validUser.Email} {validUser}"),
        //        new Claim(ClaimTypes.NameIdentifier, validUser.Email),
        //        new Claim(ClaimTypes.Email, validUser.Id.ToString()),
        //    }, "ApplicationCookie");

        //    var context = Request.GetOwinContext();
        //    var authManager = context.Authentication;
        //    return RedirectToLocal(userView.ReturUrl);
        //    */

        //    return RedirectToAction("Login", "Account");
        //}

        public ActionResult LogOut()
        {
            var context = Request.GetOwinContext();
            var authManager = context.Authentication;
            authManager.SignOut("ApplicationCookie");
            return RedirectToAction("Login", "Account");
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            var identity = (ClaimsPrincipal)Thread.CurrentPrincipal;
            var role = identity.Claims.Where(c => c.Type == ClaimTypes.Role).Select(c => c.Value).SingleOrDefault();

            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                if (role == "1")
                {
                    return RedirectToAction("Index", "Admin", new { Area = "Administrator" });
                }
                else
                {
                    return RedirectToAction("Index", "Adviser", new { Area = "Collection" });
                }
            }
            //return RedirectToAction("Index", "Home");
        }
    }
}