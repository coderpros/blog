﻿@inherits Umbraco.Web.Mvc.UmbracoViewPage

@using System.Web.Mvc.Html
@using ClientDependency.Core.Mvc
@using $rootnamespace$.Controllers
@using Umbraco.Web
@using Umbraco.Web.Models
@using Umbraco.Web.Controllers

@{
    var loginStatusModel = Members.GetCurrentLoginStatus();

    Html.EnableClientValidation();
    Html.EnableUnobtrusiveJavaScript();

    var logoutModel = new PostRedirectModel();
    
    @*
        Here you can specify a redirect URL for after logging out, by default umbraco will simply
        redirect to the current page. Example to redirect to the home page:
        
        logoutModel.RedirectUrl = "/"; 
    *@
}

@if(User.Identity.IsAuthenticated)
{
    <p>You are currently logged in as @loginStatusModel.Name</p>

    using (Html.BeginUmbracoForm<UmbracoIdentityAccountController>("HandleLogout"))
    {
         <fieldset>
             <legend>Logout</legend>
             <button>Logout</button>
         </fieldset>
    
        @Html.HiddenFor(m => logoutModel.RedirectUrl)
    }
}
