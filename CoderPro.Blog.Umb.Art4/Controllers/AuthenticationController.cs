namespace CoderPro.Blog.Umb.Art4.Controllers
{
    using System;
    using System.Web.Mvc;
    using System.Web.Security;
    using Umbraco.Web.Mvc;

    using CoderPro.Blog.Umb.Art4.Models;

    public class AuthenticationController : SurfaceController
    {
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                if (Membership.ValidateUser(model.Username, model.Password))
                {
                    FormsAuthentication.SetAuthCookie(model.Username, false); // set to true for "remember me."

                    return this.RedirectToCurrentUmbracoUrl();
                }
                else
                {
                    this.ModelState.AddModelError(String.Empty, @"Invalid Username or password.");
                }
            }

            return CurrentUmbracoPage();
        }

        [HttpGet]
        public void Logout()
        {
            FormsAuthentication.SignOut();

            Response.Redirect(@"/", true);
        }

        public ActionResult Register(LoginViewModel model)
        {
            // Check for existing member with same credentials.
            Membership.CreateUser(model.Username, model.Password, model.Username);

            // Create Umbraco member.

            // Login new member.

            return this.Redirect("/");
        }
    }
}