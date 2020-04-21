﻿@inherits Umbraco.Web.Mvc.UmbracoViewPage


@using System.Web.Mvc.Html
@using ClientDependency.Core.Mvc
@using $rootnamespace$.Models.UmbracoIdentity
@using Umbraco.Web
@using Umbraco.Web.Controllers

@{
    var profileModel = Members.GetCurrentMemberProfileModel();

    Html.EnableClientValidation();
    Html.EnableUnobtrusiveJavaScript();

    Html
        .RequiresJs("~/scripts/jquery.validate.hooks.js", 200)
        .RequiresJs("~/scripts/foundation.form.validation.js", 201);

    var success = TempData["ProfileUpdateSuccess"] != null;
}

@if (User.Identity.IsAuthenticated && profileModel != null)
{   
    if (success)
    {
        @* This message will show if RedirectOnSuccess is set to false (default) *@
        <p>Profile updated</p>
    }

    @Html.Action("ManagePassword", "UmbracoIdentityAccount")
    
    using (Html.BeginUmbracoForm<UmbProfileController>("HandleUpdateProfile", null, new { @class = "foundationForm" }))
    {
        <fieldset>
            <legend>Edit profile</legend>
       
            @Html.ValidationSummary("profileModel", true)
            
            <div class="row">
                <div class="small-12 columns">
                    <label for="@Html.IdFor(m => profileModel.Name)">
                        @Html.DisplayNameFor(m => profileModel.Name)
                        @Html.TextBoxFor(m => profileModel.Name)
                    </label>
                    @Html.ValidationMessageFor(m => profileModel.Name)
                </div>
            </div>
            
            <div class="row">
                <div class="small-12 columns">
                    <label for="@Html.IdFor(m => profileModel.Email)">
                        @Html.DisplayNameFor(m => profileModel.Email)
                        @Html.TextBoxFor(m => profileModel.Email)
                    </label>
                    @Html.ValidationMessageFor(m => profileModel.Email)
                </div>
            </div>           

            @for (var i = 0; i < profileModel.MemberProperties.Count; i++)
            {
                <div class="row">
                    <div class="small-12 columns">
                        <label for="@Html.IdFor(m => profileModel.MemberProperties[i].Value)">
                            @profileModel.MemberProperties[i].Name

                            @*
                                By default this will render a textbox but if you want to change the editor template for this property you can
                                easily change it. For example, if you wanted to render a custom editor for this field called "MyEditor" you would
                                create a file at ~/Views/Shared/EditorTemplates/MyEditor.cshtml", then you will change the next line of code to
                                render your specific editor template like:
                                @Html.EditorFor(m => profileModel.MemberProperties[i].Value, "MyEditor")
                            *@

                            @Html.EditorFor(m => profileModel.MemberProperties[i].Value)
                            @Html.HiddenFor(m => profileModel.MemberProperties[i].Alias)
                        </label>
                    </div>
                </div>
            }

            <button>Save</button>
        </fieldset>
    }

    @Html.Action("ShowRoles", "UmbracoIdentityAccount")

    @Html.Action("RemoveAccountList", "UmbracoIdentityAccount")
    
    @Html.Partial("~/Views/UmbracoIdentityAccount/ExternalLoginsList.cshtml", new ExternalLoginListViewModel { Action = "LinkLogin" })
}
