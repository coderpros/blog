﻿@using Microsoft.AspNet.Identity;
@using $rootnamespace$.Models.UmbracoIdentity
@{
    ViewBag.Title = "Manage Account";
}

<h2>@ViewBag.Title.</h2>

<p class="text-success">@ViewBag.StatusMessage</p>
<div class="row">
    <div class="col-md-12">
        @if (ViewBag.HasLocalPassword)
        {
            //TODO: Implement this
            @*@Html.Partial("ChangePassword")*@
        }
        else
        {
            @Html.Partial("SetPassword")
        }

        <section id="externalLogins">
            @Html.Action("RemoveAccountList")
            @Html.Partial("ExternalLoginsList", new ExternalLoginListViewModel { Action = "LinkLogin", ReturnUrl = ViewBag.ReturnUrl })
        </section>
    </div>
</div>
