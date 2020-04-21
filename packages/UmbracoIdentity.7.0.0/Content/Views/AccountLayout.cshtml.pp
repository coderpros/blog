﻿@using ClientDependency.Core.Mvc
@inherits UmbracoViewPage<dynamic>
@{
    Layout = null;
}
<!DOCTYPE html>
<html>
<head>
    <title>@ViewBag.Title</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js" integrity="sha256-bu/BP02YMudBc96kI7yklc639Mu4iKGUNNcam8D2nLc=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validation-unobtrusive/3.2.11/jquery.validate.unobtrusive.min.js" integrity="sha256-9GycpJnliUjJDVDqP0UEu/bsm9U+3dnQUH8+3W10vkY=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.3.3/css/foundation.min.css" integrity="sha256-GbnVT7RhMd+8Wxo/so9OxdfHkvaWmAMzAQT17YTUCZA=" crossorigin="anonymous" />

    @Html.RenderCssHere()

</head>
<body>

    @RenderBody()

    @Html.RenderJsHere()

</body>
</html>
