using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Owin;

[assembly: OwinStartup(typeof(Collection.UI.MVC.Startup))]

namespace Collection.UI.MVC
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCookieAuthentication(
               new CookieAuthenticationOptions
               {
                   AuthenticationType = "ApplicationCookie",
                   CookieName = "AuthCollection",
                   ExpireTimeSpan = TimeSpan.FromHours(1),
                   LoginPath = new PathString("/Account/Login")
               }
               );
        }
    }
}
