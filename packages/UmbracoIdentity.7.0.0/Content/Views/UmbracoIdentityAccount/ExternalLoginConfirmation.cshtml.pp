﻿@using ClientDependency.Core.Mvc
@using $rootnamespace$.Controllers
@model $rootnamespace$.Models.UmbracoIdentity.ExternalLoginConfirmationViewModel
@{
    ViewBag.Title = "Register";

    Html.EnableClientValidation();
    Html.EnableUnobtrusiveJavaScript();

    Html
        .RequiresJs("~/scripts/jquery.validate.hooks.js", 200)
        .RequiresJs("~/scripts/foundation.form.validation.js", 201);
}
<div class="row">
    <div class="small-12 columns">
        <h2>@ViewBag.Title.</h2>
        <h3>Associate your @ViewBag.LoginProvider account.</h3>
    </div>
</div>

<div class="row">
    <div class="small-12 columns">

        @using (Html.BeginUmbracoForm<UmbracoIdentityAccountController>("ExternalLoginConfirmation", new { ReturnUrl = ViewBag.ReturnUrl }, new { @class = "foundationForm" }))
        {
            @Html.AntiForgeryToken()
            
            <fieldset>
                <legend>Association Form</legend>

                @Html.ValidationSummary(true)

                <div class="row">
                    <div class="small-12 columns">
                        <p>
                            You've successfully authenticated with <strong>@ViewBag.LoginProvider</strong>.
                            Please enter a user name for this site below and click the Register button to finish
                            logging in.
                        </p>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label for="@Html.IdFor(m => m.Email)">
                            @Html.DisplayNameFor(m => m.Email)
                            @Html.TextBoxFor(m => m.Email)
                        </label>
                        @Html.ValidationMessageFor(m => m.Email)
                    </div>
                </div>

                <button>Register</button>
            </fieldset>
        }

    </div>
</div>
