﻿@model $rootnamespace$.Models.UmbracoIdentity.ExternalLoginListViewModel
@using $rootnamespace$.Controllers
@using Microsoft.Owin.Security

@{
    
    //NOTE: You might need to filter these providers since in some cases there may be identity providers specifically
    // for the back office or front-end. Generally if that is the case there will be items in the Properties collection
    // that you can use to filter or the AuthenticationType will be prefixed with a custom value.
    var loginProviders = Context.GetOwinContext().Authentication.GetExternalAuthenticationTypes();
        //Filtering Example:
        //.Where(p => p.Properties.ContainsKey("UmbracoBackOffice") == false);
    
    if (!loginProviders.Any())
    {
        <div>
            <p>
                There are no external authentication services configured. See <a href="http://go.microsoft.com/fwlink/?LinkId=313242">this article</a>
                for details on setting up this ASP.NET application to support logging in via external services.
            </p>
        </div>
    }
    else
    {
        using (Html.BeginUmbracoForm<UmbracoIdentityAccountController>(Model.Action))
        {
            @Html.AntiForgeryToken()

    <fieldset>
        <legend>Use another service to log in</legend>

        @if (TempData["LinkLoginError"] != null)
        {
            <div data-alert class="alert-box alert radius">
                <ul>
                    @foreach (var err in (string[])TempData["LinkLoginError"])
                    {
                        <li>@err</li>
                    }                    
                </ul>
            </div>
        }

        <ul class="inline-list">

            @foreach (AuthenticationDescription p in loginProviders)
            {
                <li>
                    <button type="submit" class="btn btn-default" id="@p.AuthenticationType" name="provider" value="@p.AuthenticationType" title="Log in using your @p.Caption account">@p.AuthenticationType</button>
                </li>
            }

        </ul>

    </fieldset>

        }
    }
}
