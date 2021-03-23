/// Config API.
/// Dispatch class defined by RESTSpec in Api.Config.REST.spec
Class Api.Config.REST.disp Extends %CSP.REST [ GeneratedBy = Api.Config.REST.spec.cls, ProcedureBlock ]
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
  <Route Url="/" Method="get" Call="GetSpecification" />
  <Route Url="/cluster/" Method="get" Call="GetCluster" />
  <Route Url="/cluster/" Method="put" Call="PutCluster" />
  <Route Url="/configfile/" Method="get" Call="GetConfigFile" />
  <Route Url="/configfile/" Method="put" Call="PutConfigFile" />
  <Route Url="/databases/:name" Method="get" Call="GetDatabases" />
  <Route Url="/databases/:name" Method="put" Call="PutDatabases" />
  <Route Url="/databases/:name" Method="post" Call="PostDatabases" />
  <Route Url="/databases/:name" Method="delete" Call="DeleteDatabases" />
  <Route Url="/databases/" Method="get" Call="GetListDatabases" />
  <Route Url="/debug/:name" Method="get" Call="GetDebug" />
  <Route Url="/debug/:name" Method="put" Call="PutDebug" />
  <Route Url="/debug/:name" Method="post" Call="PostDebug" />
  <Route Url="/debug/:name" Method="delete" Call="DeleteDebug" />
  <Route Url="/debug/" Method="get" Call="GetListDebug" />
  <Route Url="/devicesubtypes/:name" Method="get" Call="GetDeviceSubTypes" />
  <Route Url="/devicesubtypes/:name" Method="put" Call="PutDeviceSubTypes" />
  <Route Url="/devicesubtypes/:name" Method="post" Call="PostDeviceSubTypes" />
  <Route Url="/devicesubtypes/:name" Method="delete" Call="DeleteDeviceSubTypes" />
  <Route Url="/devicesubtypes/" Method="get" Call="GetListDeviceSubTypes" />
  <Route Url="/devices/:name" Method="get" Call="GetDevices" />
  <Route Url="/devices/:name" Method="put" Call="PutDevices" />
  <Route Url="/devices/:name" Method="post" Call="PostDevices" />
  <Route Url="/devices/:name" Method="delete" Call="DeleteDevices" />
  <Route Url="/devices/" Method="get" Call="GetListDevices" />
  <Route Url="/ecp/" Method="get" Call="GetECP" />
  <Route Url="/ecp/" Method="put" Call="PutECP" />
  <Route Url="/ecpservers/:name" Method="get" Call="GetECPServers" />
  <Route Url="/ecpservers/:name" Method="put" Call="PutECPServers" />
  <Route Url="/ecpservers/:name" Method="post" Call="PostECPServers" />
  <Route Url="/ecpservers/:name" Method="delete" Call="DeleteECPServers" />
  <Route Url="/ecpservers/" Method="get" Call="GetListECPServers" />
  <Route Url="/io/" Method="get" Call="GetIO" />
  <Route Url="/io/" Method="put" Call="PutIO" />
  <Route Url="/journal/" Method="get" Call="GetJournal" />
  <Route Url="/journal/" Method="put" Call="PutJournal" />
  <Route Url="/licenseservers/:name" Method="get" Call="GetLicenseServers" />
  <Route Url="/licenseservers/:name" Method="put" Call="PutLicenseServers" />
  <Route Url="/licenseservers/:name" Method="post" Call="PostLicenseServers" />
  <Route Url="/licenseservers/:name" Method="delete" Call="DeleteLicenseServers" />
  <Route Url="/licenseservers/" Method="get" Call="GetListLicenseServers" />
  <Route Url="/magtapes/:name" Method="get" Call="GetMagTapes" />
  <Route Url="/magtapes/:name" Method="put" Call="PutMagTapes" />
  <Route Url="/magtapes/:name" Method="post" Call="PostMagTapes" />
  <Route Url="/magtapes/:name" Method="delete" Call="DeleteMagTapes" />
  <Route Url="/magtapes/" Method="get" Call="GetListMagTapes" />
  <Route Url="/mapglobals/:namespace/:name" Method="get" Call="GetMapGlobals" />
  <Route Url="/mapglobals/:namespace/:name" Method="put" Call="PutMapGlobals" />
  <Route Url="/mapglobals/:namespace/:name" Method="post" Call="PostMapGlobals" />
  <Route Url="/mapglobals/:namespace/:name" Method="delete" Call="DeleteMapGlobals" />
  <Route Url="/mapglobals/:namespace/" Method="get" Call="GetListMapGlobals" />
  <Route Url="/mapmirrors/:id/:name" Method="get" Call="GetMapMirrors" />
  <Route Url="/mapmirrors/:id/:name" Method="put" Call="PutMapMirrors" />
  <Route Url="/mapmirrors/:id/:name" Method="post" Call="PostMapMirrors" />
  <Route Url="/mapmirrors/:id/:name" Method="delete" Call="DeleteMapMirrors" />
  <Route Url="/mapmirrors/" Method="get" Call="GetListMapMirrors" />
  <Route Url="/mappackages/:namespace/:name" Method="get" Call="GetMapPackages" />
  <Route Url="/mappackages/:namespace/:name" Method="put" Call="PutMapPackages" />
  <Route Url="/mappackages/:namespace/:name" Method="post" Call="PostMapPackages" />
  <Route Url="/mappackages/:namespace/:name" Method="delete" Call="DeleteMapPackages" />
  <Route Url="/mappackages/:namespace/" Method="get" Call="GetListMapPackages" />
  <Route Url="/maproutines/:namespace/:name" Method="get" Call="GetMapRoutines" />
  <Route Url="/maproutines/:namespace/:name" Method="put" Call="PutMapRoutines" />
  <Route Url="/maproutines/:namespace/:name" Method="post" Call="PostMapRoutines" />
  <Route Url="/maproutines/:namespace/:name" Method="delete" Call="DeleteMapRoutines" />
  <Route Url="/maproutines/:namespace/" Method="get" Call="GetListMapRoutines" />
  <Route Url="/mapshadows/:id/:name" Method="get" Call="GetMapShadows" />
  <Route Url="/mapshadows/:id/:name" Method="put" Call="PutMapShadows" />
  <Route Url="/mapshadows/:id/:name" Method="post" Call="PostMapShadows" />
  <Route Url="/mapshadows/:id/:name" Method="delete" Call="DeleteMapShadows" />
  <Route Url="/mapshadows/" Method="get" Call="GetListMapShadows" />
  <Route Url="/mirrormember/" Method="get" Call="GetMirrorMember" />
  <Route Url="/mirrormember/" Method="put" Call="PutMirrorMember" />
  <Route Url="/mirrors/:name" Method="get" Call="GetMirrors" />
  <Route Url="/mirrors/:name" Method="put" Call="PutMirrors" />
  <Route Url="/mirrors/:name" Method="post" Call="PostMirrors" />
  <Route Url="/mirrors/:name" Method="delete" Call="DeleteMirrors" />
  <Route Url="/mirrors/" Method="get" Call="GetListMirrors" />
  <Route Url="/miscellaneous/" Method="get" Call="GetMiscellaneous" />
  <Route Url="/miscellaneous/" Method="put" Call="PutMiscellaneous" />
  <Route Url="/monitor/" Method="get" Call="GetMonitor" />
  <Route Url="/monitor/" Method="put" Call="PutMonitor" />
  <Route Url="/namespaces/:name" Method="get" Call="GetNamespaces" />
  <Route Url="/namespaces/:name" Method="put" Call="PutNamespaces" />
  <Route Url="/namespaces/:name" Method="post" Call="PostNamespaces" />
  <Route Url="/namespaces/:name" Method="delete" Call="DeleteNamespaces" />
  <Route Url="/namespaces/" Method="get" Call="GetListNamespaces" />
  <Route Url="/sql/" Method="get" Call="GetSQL" />
  <Route Url="/sql/" Method="put" Call="PutSQL" />
  <Route Url="/shadows/:name" Method="get" Call="GetShadows" />
  <Route Url="/shadows/:name" Method="put" Call="PutShadows" />
  <Route Url="/shadows/:name" Method="post" Call="PostShadows" />
  <Route Url="/shadows/:name" Method="delete" Call="DeleteShadows" />
  <Route Url="/shadows/" Method="get" Call="GetListShadows" />
  <Route Url="/sqlsysdatatypes/:name" Method="get" Call="GetSqlSysDatatypes" />
  <Route Url="/sqlsysdatatypes/:name" Method="put" Call="PutSqlSysDatatypes" />
  <Route Url="/sqlsysdatatypes/:name" Method="post" Call="PostSqlSysDatatypes" />
  <Route Url="/sqlsysdatatypes/:name" Method="delete" Call="DeleteSqlSysDatatypes" />
  <Route Url="/sqlsysdatatypes/" Method="get" Call="GetListSqlSysDatatypes" />
  <Route Url="/sqluserdatatypes/:name" Method="get" Call="GetSqlUserDatatypes" />
  <Route Url="/sqluserdatatypes/:name" Method="put" Call="PutSqlUserDatatypes" />
  <Route Url="/sqluserdatatypes/:name" Method="post" Call="PostSqlUserDatatypes" />
  <Route Url="/sqluserdatatypes/:name" Method="delete" Call="DeleteSqlUserDatatypes" />
  <Route Url="/sqluserdatatypes/" Method="get" Call="GetListSqlUserDatatypes" />
  <Route Url="/startup/" Method="get" Call="GetStartup" />
  <Route Url="/startup/" Method="put" Call="PutStartup" />
  <Route Url="/telnet/" Method="get" Call="GetTelnet" />
  <Route Url="/telnet/" Method="put" Call="PutTelnet" />
  <Route Url="/config/" Method="get" Call="Getconfig" />
  <Route Url="/config/" Method="put" Call="Putconfig" />
</Routes>
}

ClassMethod GetSpecification() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetSpecification()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetCluster() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetCluster()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutCluster() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutCluster(pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetConfigFile() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetConfigFile()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutConfigFile() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutConfigFile(pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetDatabases(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetDatabases(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutDatabases(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutDatabases(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostDatabases(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostDatabases(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteDatabases(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteDatabases(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListDatabases() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListDatabases()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetDebug(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetDebug(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutDebug(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutDebug(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostDebug(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostDebug(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteDebug(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteDebug(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListDebug() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListDebug()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetDeviceSubTypes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetDeviceSubTypes(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutDeviceSubTypes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutDeviceSubTypes(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostDeviceSubTypes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostDeviceSubTypes(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteDeviceSubTypes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteDeviceSubTypes(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListDeviceSubTypes() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListDeviceSubTypes()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetDevices(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetDevices(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutDevices(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutDevices(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostDevices(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostDevices(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteDevices(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteDevices(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListDevices() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListDevices()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetECP() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetECP()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutECP() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutECP(pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetECPServers(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetECPServers(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutECPServers(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutECPServers(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostECPServers(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostECPServers(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteECPServers(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteECPServers(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListECPServers() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListECPServers()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetIO() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetIO()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutIO() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutIO(pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetJournal() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetJournal()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutJournal() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutJournal(pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetLicenseServers(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetLicenseServers(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutLicenseServers(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutLicenseServers(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostLicenseServers(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostLicenseServers(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteLicenseServers(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteLicenseServers(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListLicenseServers() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListLicenseServers()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetMagTapes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetMagTapes(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutMagTapes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutMagTapes(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostMagTapes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostMagTapes(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteMagTapes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteMagTapes(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListMagTapes() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListMagTapes()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetMapGlobals(pnamespace As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetMapGlobals(pnamespace,pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutMapGlobals(pnamespace As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutMapGlobals(pnamespace,pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostMapGlobals(pnamespace As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostMapGlobals(pnamespace,pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteMapGlobals(pnamespace As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteMapGlobals(pnamespace,pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListMapGlobals(pnamespace As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListMapGlobals(pnamespace)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetMapMirrors(pid As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetMapMirrors(pid,pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutMapMirrors(pid As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutMapMirrors(pid,pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostMapMirrors(pid As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostMapMirrors(pid,pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteMapMirrors(pid As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteMapMirrors(pid,pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListMapMirrors() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListMapMirrors()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetMapPackages(pnamespace As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetMapPackages(pnamespace,pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutMapPackages(pnamespace As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutMapPackages(pnamespace,pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostMapPackages(pnamespace As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostMapPackages(pnamespace,pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteMapPackages(pnamespace As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteMapPackages(pnamespace,pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListMapPackages(pnamespace As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListMapPackages(pnamespace)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetMapRoutines(pnamespace As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetMapRoutines(pnamespace,pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutMapRoutines(pnamespace As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutMapRoutines(pnamespace,pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostMapRoutines(pnamespace As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostMapRoutines(pnamespace,pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteMapRoutines(pnamespace As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteMapRoutines(pnamespace,pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListMapRoutines(pnamespace As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListMapRoutines(pnamespace)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetMapShadows(pid As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetMapShadows(pid,pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutMapShadows(pid As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutMapShadows(pid,pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostMapShadows(pid As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostMapShadows(pid,pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteMapShadows(pid As %String, pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteMapShadows(pid,pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListMapShadows() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListMapShadows()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetMirrorMember() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetMirrorMember()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutMirrorMember() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutMirrorMember(pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetMirrors(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetMirrors(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutMirrors(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutMirrors(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostMirrors(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostMirrors(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteMirrors(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteMirrors(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListMirrors() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListMirrors()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetMiscellaneous() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetMiscellaneous()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutMiscellaneous() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutMiscellaneous(pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetMonitor() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetMonitor()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutMonitor() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutMonitor(pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetNamespaces(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetNamespaces(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutNamespaces(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutNamespaces(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostNamespaces(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostNamespaces(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteNamespaces(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteNamespaces(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListNamespaces() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListNamespaces()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetSQL() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetSQL()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutSQL() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutSQL(pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetShadows(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetShadows(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutShadows(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutShadows(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostShadows(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostShadows(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteShadows(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteShadows(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListShadows() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListShadows()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetSqlSysDatatypes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetSqlSysDatatypes(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutSqlSysDatatypes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutSqlSysDatatypes(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostSqlSysDatatypes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostSqlSysDatatypes(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteSqlSysDatatypes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteSqlSysDatatypes(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListSqlSysDatatypes() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListSqlSysDatatypes()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetSqlUserDatatypes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetSqlUserDatatypes(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutSqlUserDatatypes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutSqlUserDatatypes(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PostSqlUserDatatypes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PostSqlUserDatatypes(pname,pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod DeleteSqlUserDatatypes(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).DeleteSqlUserDatatypes(pname)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetListSqlUserDatatypes() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetListSqlUserDatatypes()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetStartup() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetStartup()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutStartup() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutStartup(pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod GetTelnet() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).GetTelnet()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod PutTelnet() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).PutTelnet(pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod Getconfig() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.impl).Getconfig()
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

ClassMethod Putconfig() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.impl).Putconfig(pmodel)
        Do ##class(Api.Config.REST.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

}
