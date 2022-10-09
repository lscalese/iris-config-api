Class Api.Config.REST.Main Extends %CSP.REST
{

/// The class containing the RESTSpec which generated this class
Parameter SpecificationClass = "Api.Config.REST.spec";

/// Ignore any writes done directly by the REST method.
Parameter IgnoreWrites = 1;

/// Default the Content-Type for this application.
Parameter CONTENTTYPE = "application/json";

/// By default convert the input stream to Unicode
Parameter CONVERTINPUTSTREAM = 1;

/// The default response charset is utf-8
Parameter CHARSET = "utf-8";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <Map Prefix="/security" Forward="Api.Config.REST.Security.disp"/>
</Routes>
}

ClassMethod OnPreDispatch(pUrl As %String, pMethod As %String, ByRef pContinue As %Boolean) As %Status
{
    Set sc = $$$OK, class = ##class(Api.Config.REST.OnPreDispatchAbstract).GetSubClass()

    Set pContinue = $$$YES
    
    Return:class="" sc

    Return $CLASSMETHOD(class, "OnPreDispatch", pUrl, pMethod, .pContinue)
}

}
