﻿@using $rootnamespace$.Models.UmbracoIdentity
@inherits Umbraco.Web.Mvc.UmbracoViewPage
@{
    Layout = "AccountLayout.cshtml";
}

<div class="row">
    <div class="small-12 columns">
        <h2>Account</h2>
    </div>
</div>


@if (User.Identity.IsAuthenticated)
{
    <div class="row">
        <div class="small-12 columns">
            @Html.Partial("~/Views/UmbracoIdentityAccount/LoginStatus.cshtml", Model)
        </div>
    </div>

    <div class="row">
        <div class="small-12 columns">
            @Html.Partial("~/Views/UmbracoIdentityAccount/Profile.cshtml", Model)
        </div>
    </div>
}
else
{
    <div class="row">
        <div class="small-6 columns">
            @Html.Partial("~/Views/UmbracoIdentityAccount/Login.cshtml", Model)
        </div>
        <div class="small-6 columns">
            @Html.Partial("~/Views/UmbracoIdentityAccount/ExternalLoginsList.cshtml", new ExternalLoginListViewModel { Action = "ExternalLogin" })
        </div>
    </div>
    <div class="row">
        <div class="small-12 columns">
            @Html.Partial("~/Views/UmbracoIdentityAccount/Register.cshtml", Model)
        </div>
    </div>
}
