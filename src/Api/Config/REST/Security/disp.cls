/// REST API to configure IRIS security setting of an IRIS instance.
/// Dispatch class defined by RESTSpec in Api.Config.REST.Security.spec
Class Api.Config.REST.Security.disp Extends %CSP.REST [ GeneratedBy = Api.Config.REST.Security.spec.cls, ProcedureBlock ]
{

/// The class containing the RESTSpec which generated this class
Parameter SpecificationClass = "Api.Config.REST.Security.spec";

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
  <!-- Swagger 2.0 specification -->
  <Route Url="/" Method="get" Call="GetSpecification" />
  <!-- Create a User. -->
  <Route Url="/user" Method="post" Call="PostUser" />
  <!-- Get a User's properties. -->
  <Route Url="/user/\$(.+)" Method="get" Call="GetUser" />
  <!-- Modify a User's properties. -->
  <Route Url="/user/\$(.+)" Method="put" Call="PutUser" />
  <!-- Delete a User. -->
  <Route Url="/user/\$(.+)" Method="delete" Call="DeleteUser" />
  <!-- List of users. -->
  <Route Url="/users" Method="get" Call="GetListOfUsers" />
  <!-- Create a Role. -->
  <Route Url="/role" Method="post" Call="PostRole" />
  <!-- Get a role's properties. -->
  <Route Url="/role/\$(.+)" Method="get" Call="GetRole" />
  <!-- Modify a role. -->
  <Route Url="/role/\$(.+)" Method="put" Call="PutRole" />
  <!-- Delete a role. -->
  <Route Url="/role/\$(.+)" Method="delete" Call="DeleteRole" />
  <!-- Get list of existing roles. -->
  <Route Url="/roles" Method="get" Call="GetListOfRoles" />
  <!-- Create resource. -->
  <Route Url="/resource" Method="post" Call="PostResource" />
  <!-- Get resource detail. -->
  <Route Url="/resource/\$(.+)" Method="get" Call="GetResource" />
  <!-- Update resource. -->
  <Route Url="/resource/\$(.+)" Method="put" Call="PutResource" />
  <!-- Delete resource. -->
  <Route Url="/resource/\$(.+)" Method="delete" Call="DeleteResources" />
  <!-- Get list of existing resources. -->
  <Route Url="/resources" Method="get" Call="GetListOfResources" />
  <!-- Create a new sslconfig. -->
  <Route Url="/sslconfig" Method="post" Call="PostSSLConfig" />
  <!-- Get a SSL configuration's properties. -->
  <Route Url="/sslconfig/\$(.+)" Method="get" Call="GetSSLConfig" />
  <!-- Modify an SSL configuration. -->
  <Route Url="/sslconfig/\$(.+)" Method="put" Call="PutSSLConfig" />
  <!-- Delete an SSL configuration. -->
  <Route Url="/sslconfig/\$(.+)" Method="delete" Call="DeleteSSLConfig" />
  <!-- Get list of sslconfigs. -->
  <Route Url="/sslconfigs" Method="get" Call="GetListOfSSLConfigs" />
  <!-- Create an Application. -->
  <Route Url="/application" Method="post" Call="PostWebApp" />
  <!-- Get an application's properties. -->
  <Route Url="/application/:name" Method="get" Call="GetWebApp" />
  <!-- Modify an application. -->
  <Route Url="/application/:name" Method="put" Call="PutWebApp" />
  <!-- Delete an Application. -->
  <Route Url="/application/:name" Method="delete" Call="DeleteWebApp" />
  <!-- Get list of existing web applications. -->
  <Route Url="/applications" Method="get" Call="GetListOfWebApps" />
  <!-- Get a service's properties. -->
  <Route Url="/service/:name" Method="get" Call="GetService" />
  <!-- Modify a Service's properties. -->
  <Route Url="/service/:name" Method="put" Call="PutService" />
  <!-- Get the system security properties. -->
  <Route Url="/system" Method="get" Call="GetSystem" />
  <!-- Modify the system security properties. -->
  <Route Url="/system" Method="put" Call="PutSystem" />
  <!-- Get list of services. -->
  <Route Url="/services" Method="get" Call="GetListOfServices" />
  <!-- Helper service to add a set of privileges to tables/views/sqlproc. -->
  <Route Url="/sqlhelper" Method="put" Call="PutSqlHelper" />
  <!-- Get list of SQLAdminPrivilegeSet. -->
  <Route Url="/sqladminprivilegeset" Method="get" Call="GetListOfSQLAdminPrivilegeSet" />
  <!-- Set SQLAdminPrivilegeSet. -->
  <Route Url="/sqladminprivilegeset" Method="put" Call="PutSQLAdminPrivilegeSet" />
  <!-- Get SQLAdminPrivilegeSet detail. -->
  <Route Url="/sqladminprivilegeset/:namespace/:grantee" Method="get" Call="GetSQLAdminPrivilegeSet" />
  <!-- Delete SQLAdminPrivilegeSet. -->
  <Route Url="/sqladminprivilegeset/:namespace/:grantee" Method="delete" Call="DeleteSQLAdminPrivilegeSet" />
  <!-- Get list of privilege for namespace and grantee. -->
  <Route Url="/sqlprivileges/:namespace/:grantee" Method="get" Call="GetListOfSQLPrivileges" />
  <!-- Delete privileges. -->
  <Route Url="/sqlprivileges/:id" Method="delete" Call="DeleteSQLPrivileges" />
  <!-- Set SQL Privileges. -->
  <Route Url="/sqlprivileges" Method="post" Call="PutSQLPrivileges" />
</Routes>
}

/// Swagger 2.0 specification
ClassMethod GetSpecification() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetSpecification()
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Create a User.
ClassMethod PostUser() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PostUser(pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get a User's properties.
ClassMethod GetUser(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetUser(pname)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Modify a User's properties.
ClassMethod PutUser(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PutUser(pname,pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Delete a User.
ClassMethod DeleteUser(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).DeleteUser(pname)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// List of users.
ClassMethod GetListOfUsers() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetListOfUsers()
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Create a Role.
ClassMethod PostRole() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PostRole(pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get a role's properties.
ClassMethod GetRole(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetRole(pname)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Modify a role.
ClassMethod PutRole(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PutRole(pname,pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Delete a role.
ClassMethod DeleteRole(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).DeleteRole(pname)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get list of existing roles.
ClassMethod GetListOfRoles() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetListOfRoles()
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Create resource.
ClassMethod PostResource() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PostResource(pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get resource detail.
ClassMethod GetResource(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetResource(pname)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Update resource.
ClassMethod PutResource(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PutResource(pname,pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Delete resource.
ClassMethod DeleteResources(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).DeleteResources(pname)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get list of existing resources.
ClassMethod GetListOfResources() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetListOfResources()
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Create a new sslconfig.
ClassMethod PostSSLConfig() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PostSSLConfig(pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get a SSL configuration's properties.
ClassMethod GetSSLConfig(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetSSLConfig(pname)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Modify an SSL configuration.
ClassMethod PutSSLConfig(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PutSSLConfig(pname,pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Delete an SSL configuration.
ClassMethod DeleteSSLConfig(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).DeleteSSLConfig(pname)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get list of sslconfigs.
ClassMethod GetListOfSSLConfigs() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetListOfSSLConfigs()
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Create an Application.
ClassMethod PostWebApp() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PostWebApp(pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get an application's properties.
ClassMethod GetWebApp(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetWebApp(pname)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Modify an application.
ClassMethod PutWebApp(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PutWebApp(pname,pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Delete an Application.
ClassMethod DeleteWebApp(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).DeleteWebApp(pname)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get list of existing web applications.
ClassMethod GetListOfWebApps() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetListOfWebApps()
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get a service's properties.
ClassMethod GetService(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetService(pname)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Modify a Service's properties.
ClassMethod PutService(pname As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PutService(pname,pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get the system security properties.
ClassMethod GetSystem() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetSystem()
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Modify the system security properties.
ClassMethod PutSystem() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PutSystem(pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get list of services.
ClassMethod GetListOfServices() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetListOfServices()
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Helper service to add a set of privileges to tables/views/sqlproc.
ClassMethod PutSqlHelper() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PutSqlHelper(pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get list of SQLAdminPrivilegeSet.
ClassMethod GetListOfSQLAdminPrivilegeSet() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetListOfSQLAdminPrivilegeSet()
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Set SQLAdminPrivilegeSet.
ClassMethod PutSQLAdminPrivilegeSet() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"model")) Quit
        Set pmodel=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PutSQLAdminPrivilegeSet(pmodel)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get SQLAdminPrivilegeSet detail.
ClassMethod GetSQLAdminPrivilegeSet(pnamespace As %String, pgrantee As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetSQLAdminPrivilegeSet(pnamespace,pgrantee)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Delete SQLAdminPrivilegeSet.
ClassMethod DeleteSQLAdminPrivilegeSet(pnamespace As %String, pgrantee As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).DeleteSQLAdminPrivilegeSet(pnamespace,pgrantee)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Get list of privilege for namespace and grantee.
ClassMethod GetListOfSQLPrivileges(pnamespace As %String, pgrantee As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).GetListOfSQLPrivileges(pnamespace,pgrantee)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Delete privileges.
ClassMethod DeleteSQLPrivileges(pid As %String) As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Api.Config.REST.Security.impl).DeleteSQLPrivileges(pid)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Set SQL Privileges.
ClassMethod PutSQLPrivileges() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"SQLPrivilege")) Quit
        Set pSQLPrivilege=%request.Content
        Set response=##class(Api.Config.REST.Security.impl).PutSQLPrivileges(pSQLPrivilege)
        Do ##class(Api.Config.REST.Security.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Api.Config.REST.Security.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

}
