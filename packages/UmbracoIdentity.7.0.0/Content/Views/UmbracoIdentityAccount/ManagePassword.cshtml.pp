﻿@model $rootnamespace$.Models.UmbracoIdentity.UserPasswordModel

@{
    Layout = null;
    
    //used to set a prefix for fields
    var managePasswordModel = Model;
}

@if (!ViewBag.HasLocalPassword)
{
    <p>
        You do not have a local username/password for this site. Add a local
        account so you can log in without an external login.
    </p>
}

@using (Html.BeginUmbracoForm("ManagePassword", "UmbracoIdentityAccount", null, new { @class = "foundationForm" }))
{
    @Html.AntiForgeryToken()

    <fieldset>
        <legend>@(ViewBag.HasLocalPassword ? "Change Password" : "Create Local Login")</legend>

        @Html.ValidationSummary("managePasswordModel", true)
        
        @if (TempData["ChangePasswordSuccess"] != null)
        {
            <div data-alert class="alert-box success radius">
                Password updated successfully                
            </div>
        }

        @if (ViewBag.HasLocalPassword)
        {
            <div class="row">
                <div class="small-12 columns">
                    <label for="@Html.IdFor(m => managePasswordModel.OldPassword)">
                        @Html.DisplayNameFor(m => managePasswordModel.OldPassword)
                        @Html.PasswordFor(m => managePasswordModel.OldPassword)
                    </label>
                    @Html.ValidationMessageFor(m => managePasswordModel.OldPassword)
                </div>
            </div>
        }

        <div class="row">
            <div class="small-12 columns">
                <label for="@Html.IdFor(m => managePasswordModel.NewPassword)">
                    @Html.DisplayNameFor(m => managePasswordModel.NewPassword)
                    @Html.PasswordFor(m => managePasswordModel.NewPassword)
                </label>
                @Html.ValidationMessageFor(m => managePasswordModel.NewPassword)
            </div>
        </div>

        <div class="row">
            <div class="small-12 columns">
                <label for="@Html.IdFor(m => managePasswordModel.ConfirmPassword)">
                    @Html.DisplayNameFor(m => managePasswordModel.ConfirmPassword)
                    @Html.PasswordFor(m => managePasswordModel.ConfirmPassword)
                </label>
                @Html.ValidationMessageFor(m => managePasswordModel.ConfirmPassword)
            </div>
        </div>

        <button>Set password</button>

    </fieldset>

}
