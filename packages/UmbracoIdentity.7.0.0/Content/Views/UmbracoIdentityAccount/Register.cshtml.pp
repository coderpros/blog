﻿@inherits Umbraco.Web.Mvc.UmbracoViewPage

@using System.Web.Mvc.Html
@using ClientDependency.Core.Mvc
@using $rootnamespace$.Controllers
@using $rootnamespace$
@using Umbraco.Web
@using Umbraco.Web.Controllers

@{
    @*
        You can specify a custom member type alias in the constructor, the default is 'Member'    
        for example, to use 'Custom Member' you'd use this syntax:
    
        var registerModel = Members.CreateRegistrationModel("Custom Member");
    *@
    
    var registerModel = Members.CreateRegistrationModel();    
    
    @*
        Configurable here:           
    
        registerModel.RedirectUrl       - Optional. What path to redirect to if registration is successful. 
                                          By default the member will be redirected to the current umbraco page 
                                          unless this is specified.
    
        registerModel.UsernameIsEmail   - the default is true
                                          if you want the username to be different from the email
                                          address, set this to true and add a new Username field in
                                          the form below
    
                                          @Html.LabelFor(m => registerModel.Username)
                                          @Html.TextBoxFor(m => registerModel.Username)
                                          @Html.ValidationMessageFor(m => registerModel.Username)
    *@

    Html.EnableClientValidation();
    Html.EnableUnobtrusiveJavaScript();

    Html
        .RequiresJs("~/scripts/jquery.validate.hooks.js", 200)
        .RequiresJs("~/scripts/foundation.form.validation.js", 201);

    var success = TempData["FormSuccess"] != null;
}

@if (success) 
{ 
    @* This message will show if RedirectOnSuccess is set to false (default) *@
    <p>Registration succeeeded.</p>
}
else
{
    using (Html.BeginUmbracoForm<UmbracoIdentityAccountController>("HandleRegisterMember", null, new { @class = "foundationForm" }))
    {
        <fieldset>
            <legend>Register</legend>

            @Html.ValidationSummary("registerModel", true)

            <div class="row">
                <div class="small-12 columns">
                    <label for="@Html.IdFor(m => registerModel.Name)">
                        @Html.DisplayNameFor(m => registerModel.Name)
                        @Html.TextBoxFor(m => registerModel.Name)
                    </label>
                    @Html.ValidationMessageFor(m => registerModel.Name)
                </div>
            </div>

            <div class="row">
                <div class="small-12 columns">
                    <label for="@Html.IdFor(m => registerModel.Email)">
                        @Html.DisplayNameFor(m => registerModel.Email)
                        @Html.TextBoxFor(m => registerModel.Email)
                    </label>
                    @Html.ValidationMessageFor(m => registerModel.Email)
                </div>
            </div>

            <div class="row">
                <div class="small-12 columns">
                    <label for="@Html.IdFor(m => registerModel.Password)">
                        @Html.DisplayNameFor(m => registerModel.Password)
                        @Html.PasswordFor(m => registerModel.Password)
                    </label>
                    @Html.ValidationMessageFor(m => registerModel.Password)
                </div>
            </div>


            @if (registerModel.MemberProperties != null)
            {
                for (var i = 0; i < registerModel.MemberProperties.Count; i++)
                {
                    <div class="row">
                        <div class="small-12 columns">
                            <label for="@Html.IdFor(m => registerModel.MemberProperties[i].Value)">
                                @registerModel.MemberProperties[i].Name

                                @*
                                    By default this will render a textbox but if you want to change the editor template for this property you can
                                    easily change it. For example, if you wanted to render a custom editor for this field called "MyEditor" you would
                                    create a file at ~/Views/Shared/EditorTemplates/MyEditor.cshtml", then you will change the next line of code to
                                    render your specific editor template like:
                                    @Html.EditorFor(m => profileModel.MemberProperties[i].Value, "MyEditor")
                                *@

                                @Html.EditorFor(m => registerModel.MemberProperties[i].Value)
                                @Html.HiddenFor(m => registerModel.MemberProperties[i].Alias)
                            </label>
                        </div>
                    </div>
                }
            }

            @Html.HiddenFor(m => registerModel.MemberTypeAlias)
            @Html.HiddenFor(m => registerModel.RedirectUrl)
            @Html.HiddenFor(m => registerModel.UsernameIsEmail)

            <button>Register</button>
        </fieldset>
    }
}
