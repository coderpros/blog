﻿@using System.Web.Mvc.Html
@using ClientDependency.Core.Mvc
@using $rootnamespace$.Controllers
@using Umbraco.Web
@using Umbraco.Web.Models
@using Umbraco.Web.Controllers

@{
    var loginModel = new LoginModel();

    Html.EnableClientValidation();
    Html.EnableUnobtrusiveJavaScript();

    Html
        .RequiresJs("~/scripts/jquery.validate.hooks.js", 200)
        .RequiresJs("~/scripts/foundation.form.validation.js", 201);
}

<h4>Standard login.</h4>

@using (Html.BeginUmbracoForm<UmbracoIdentityAccountController>("HandleLogin", null, new { @class = "foundationForm" }))
{
    <fieldset>
        <legend>Login</legend>

        @Html.ValidationSummary("loginModel", true)

        <div class="row">
            <div class="small-12 columns">
                <label for="@Html.IdFor(m => loginModel.Username)">
                    @Html.DisplayNameFor(m => loginModel.Username)
                    @Html.TextBoxFor(m => loginModel.Username)
                </label>
                @Html.ValidationMessageFor(m => loginModel.Username)
            </div>
        </div>
        <div class="row">
            <div class="small-12 columns">
                <label for="@Html.IdFor(m => loginModel.Password)">
                    @Html.DisplayNameFor(m => loginModel.Password)
                    @Html.PasswordFor(m => loginModel.Password)
                </label>
                @Html.ValidationMessageFor(m => loginModel.Password)
            </div>
        </div>

        <button>Login</button>
    </fieldset>
}
