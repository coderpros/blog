<cfscript>
    private string function checkDotNetVersion()
    {
        var seClass = createObject("dotnet","System.Environment");

        return seClass.Get_Version().ToString();
    }

    private string function hostUp(required string host)
    {
        var networkingComponent = new components.networking();

        if(networkingComponent.hostUp(host))
        {
            return "#host# is online.";
        }
        else
        {
            return "#host# is <strong>offline!</strong>";
        }
    }
    
</cfscript>

<cffunction name="checkHost" access="private" returntype="string">
    <cfargument name="host" type="string" required="true" />

    <cfset networkingComponent = new components.networking() />

    <cfif networkingComponent.hostUp(host)>
        <cfreturn "#host# is online." />
    <cfelse>
        <cfreturn "#host# is <strong>offline!</strong>" />
    </cfif>
</cffunction>

<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Calling .Net from ColdFusion</title>
  <meta name="description" content="A simple HTML5 Template for new projects.">
  <meta name="author" content="Brandon Osborne - coderPro.net">

  <meta property="og:title" content="Calling .Net from ColdFusion">
  <meta property="og:type" content="website">
  <meta property="og:url" content="http://coderPro.net">
  <meta property="og:description" content="A simple HTML5 Template for new projects.">
  <meta property="og:image" content="https://coderpro.net/media/1024/coderpro_logo_rounded_extra-90x90.webp">

  <link rel="icon" href="/favicon.ico">
  <link rel="icon" href="/favicon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="/apple-touch-icon.png">

</head>

<body>
    <cfoutput>
    JIntegra .Net Version is: #checkDotNetVersion()#<br/>
    <u>Test from cfScript</u><br />
    #hostUp("coderpro.net")#<br/>
    <br/>
    <u>Test from CFML</u><br/>
    #checkhost("asdffsdf.com")#
    </cfoutput>
</body>

</html>