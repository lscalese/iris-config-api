Include Api.Config.inc

/// REST API to configure IRIS security setting of an IRIS instance.<br/>
/// Business logic class defined by OpenAPI in Api.Config.REST.Security.spec<br/>
/// Updated Oct 16, 2022 10:22:37
Class Api.Config.REST.Security.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 1;

/// Swagger 2.0 specification
ClassMethod GetSpecification() As %DynamicObject
{
    Do ..%SetStatusCode("HTTP200OK")
    Do ..%SetContentType("application/json")
    #dim XData As %Dictionary.CompiledXData = ##class(%Dictionary.CompiledXData).%OpenId("Api.Config.REST.Security.spec||OpenAPI")
    Set swagger = {}.%FromJSON(XData.Data)
    Set swagger.host = %request.CgiEnvs("SERVER_NAME") _ ":" _ %request.CgiEnvs("SERVER_PORT")
    ;Set swagger.basePath = %request.Application _ swagger.basePath
    Quit swagger
}

/// Define the security User database.
/// The system includes a set of pre-defined System users.
/// .User names have the following properties:
/// <ul><li>ser names are not case sensitive.</li><li>Maximum length of a user name is 160 characters.</li><li>User name cannot contain "*"</li></ul><br/>All defined users have the following properties:<br/><ul><li>A user cannot have duplicate roles defined</li><li>At least one user must hold the %All role</li><li>All the roles granted to a user must exist in the roles database.</li></ul><br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PostUser(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(model)
    Set sc = ##class(Api.Config.Services.Security.Users).CheckModel(dModel)
    
    If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Return jsonSC
	}

    If ##class(Api.Config.Services.Security.Users).Exists(dModel.Name) {
        Do ..%SetStatusCode($$$HTTP409)
        Return ""
    }

    $$$ThrowOnError(##class(Api.Config.Services.Security.Users).Create(dModel))
    Do ..%SetStatusCode($$$HTTP201)
    Do ..%SetHeader("Location", %request.Application _ "security/user/"_dModel.Name)
    Return ""
}

/// Get the list of all existings users on this IRIS instance.
ClassMethod GetListOfUsers() As %DynamicObject
{
    Set usersList = ##class(Api.Config.Services.Security.Users).List()
	Do ..%SetStatusCode($$$HTTP200), ..%SetContentType("application/json")
	Return {}.%Set("users", usersList)
}

/// Gets a User's properties from the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, The username.<br/>
ClassMethod GetUser(name As %String) As %DynamicObject
{
    If '##class(Api.Config.Services.Security.Users).Exists(name) {
        Do ..%SetStatusCode($$$HTTP404)
        Return ""
    }

    Do ..%SetStatusCode($$$HTTP200)
    
    Return ##class(Api.Config.Services.Security.Users).Get(name)
}

/// Modifies a User's properties from the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, username.<br/>
///     model, Warning the property Name cannot be updated.<br/>
ClassMethod PutUser(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(model)
    Set dModel.Name = name
    Set sc = ##class(Api.Config.Services.Security.Users).CheckModel(dModel)
    
    If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Return jsonSC
	}

    If '##class(Api.Config.Services.Security.Users).Exists(name) {
        Do ..%SetStatusCode($$$HTTP404)
        Return ""
    }

    $$$ThrowOnError(##class(Api.Config.Services.Security.Users).Update(dModel))
    Do ..%SetStatusCode($$$HTTP204)
    
    Return ""
}

/// This method will delete a User from the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, username.<br/>
ClassMethod DeleteUser(name As %String) As %DynamicObject
{
    If '##class(Api.Config.Services.Security.Users).Exists(name) {
        Do ..%SetStatusCode($$$HTTP404)
        Return ""
    }
    
    $$$ThrowOnError(##class(Api.Config.Services.Security.Users).Delete(name))
    Do ..%SetStatusCode($$$HTTP204)

    Return ""
}

/// <br/>Define the security Role database.<br/>The system includes a set of pre-defined System roles. System roles cannot be deleted. Legacy system roles may be deleted.<br/>Role names have the following properties:<br/><ul><li>Role names are case insensitive.</li><li>Maximum length of a role name is 64 characters.</li><li>Role name cannot contain a "," or ":"</li><li>Role name cannot start with a "%" unless it is a pre-defined system role</li><li>A role may exist which has no resources.</li></ul><br/>%DB_* implicit roles cannot be modified<br/>The %Admin Secure:USE permission is required to operate on a resource<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PostRole(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Security.Roles", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"/security/roles/"_dModel.Name)
	Quit resp
}

/// Modify an existing role's properties in the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, role name.<br/>
///     model<br/>
ClassMethod PutRole(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model), dModel.Name = name
	Set resp = ..DefaultPutImpl("Security.Roles", dModel)
	Quit resp
}

/// Gets a role's properties from the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, role name<br/>
ClassMethod GetRole(name As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.Roles", name)
}

/// Get list of existing roles.
ClassMethod GetListOfRoles() As %DynamicObject
{
    Quit ..DefaultListOf("Security.Roles")
}

/// This method will delete a role from the security database and remove the role from all the users which hold this role. It will then update the in memory security database to mark this role as "No access" for all resources this role holds. Pre-defined system roles cannot be deleted.<br/>
/// The method arguments hold values for:<br/>
///     name, The role name to delete.<br/>
ClassMethod DeleteRole(name As %String) As %DynamicObject
{
    Quit ..DefaultDelImpl("Security.Roles", name)
}

/// Define the security Resource database.<br/>The system includes a set of pre-defined System resources. Some properties of the system resources may not be modified.<br/>Resource names have the following properties:<br/><ul><li>Resource names are case insensitive.</li><li>Maximum length of a resource name is 64 characters.</li><li>First Character after the "_" cannot be a % for user-defined resources</li><li>Resource names cannot contain a "," or ":"</li></ul><br/>The %Admin_Secure:USE permission is required to operate on a resource<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PostResource(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Security.Resources", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"/security/resources/"_dModel.Name)
	Quit resp
}

/// Get list of resources.
ClassMethod GetListOfResources() As %DynamicObject
{
    Quit ..DefaultListOf("Security.Resources")
}

/// Gets a resource's properties from the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, resource name<br/>
ClassMethod GetResource(name As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.Resources", name)
}

/// Modify an existing resource's properties in the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, resource name.<br/>
///     model<br/>
ClassMethod PutResource(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model), dModel.Name = name
	Set resp = ..DefaultPutImpl("Security.Resources", dModel)
	Quit resp
}

/// Delete a resource.<br/>
/// The method arguments hold values for:<br/>
///     name, resource name.<br/>
ClassMethod DeleteResource(name As %String) As %DynamicObject
{
    Quit ..DefaultDelImpl("Security.Resources", name)
}

/// Gets a SSL configuration's properties from the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, sslconfig name<br/>
ClassMethod GetSSLConfig(name As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.SSLConfigs", name)
}

/// Define the SSL/TLS configurations.<br/><ul><li> SSL configuration names are case sensitive.</li><li> Maximum length of a configuration name is 64 characters.</li></ul><br/>Once an SSL configuration is defined and activated, you can use the name of the configuration as a parameter to the open or use command in order to set up an SSL connection.<br/>The %Admin Secure:USE permission is required to operate on an SSL configuration.<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PostSSLConfig(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Security.SSLConfigs", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application _ "/security/sslconfigs/" _ dModel.Name)
	Quit resp
}

/// Modify an existing SSL configuration's properties in the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, sslconfig name.<br/>
///     model<br/>
ClassMethod PutSSLConfig(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model), dModel.Name = name
	Set resp = ..DefaultPutImpl("Security.SSLConfigs", dModel)
	Quit resp
}

/// Delete an SSL configuration from the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, sslconfig name.<br/>
ClassMethod DeleteSSLConfig(name As %String) As %DynamicObject
{
    Quit ..DefaultDelImpl("Security.SSLConfigs", name)
}

/// Get list of sslconfigs.
ClassMethod GetListOfSSLConfigs() As %DynamicObject
{
    Quit ..DefaultListOf("Security.SSLConfigs", "SSLConfigs")
}

/// Get list of SQLAdminPrivilegeSet.
ClassMethod GetListOfSQLAdminPrivilegeSet() As %DynamicObject
{
    Quit ..DefaultListOf("Security.SQLAdminPrivilegeSet")
}

/// Set SQLAdminPrivilegeSet.<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PutSQLAdminPrivilegeSet(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPutImpl("Security.SQLAdminPrivilegeSet", dModel, , $$$NO)
	Quit resp
}

/// Get SQLAdminPrivilegeSet detail.<br/>
/// The method arguments hold values for:<br/>
///     namespace, namespace<br/>
///     grantee, grantee<br/>
ClassMethod GetSQLAdminPrivilegeSet(namespace As %String, grantee As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.SQLAdminPrivilegeSet", namespace, grantee)
}

/// Delete SQLAdminPrivilegeSet.<br/>
/// The method arguments hold values for:<br/>
///     namespace, namespace<br/>
///     grantee, grantee<br/>
ClassMethod DeleteSQLAdminPrivilegeSet(namespace As %String, grantee As %String) As %DynamicObject
{
     Quit ..DefaultDelImpl("Security.SQLAdminPrivilegeSet", namespace, grantee)
}

/// Get list of privilege for namespace and grantee.<br/>
/// The method arguments hold values for:<br/>
///     namespace<br/>
///     grantee<br/>
ClassMethod GetListOfSQLPrivileges(namespace As %String, grantee As %String) As %DynamicObject
{
    Set lst = ##class(Api.Config.Services.Security.SQLPrivileges).List(namespace,grantee)
	Do ..%SetStatusCode($$$HTTP200)
	Do ..%SetContentType("application/json")
	Quit {"list":(lst)}
}

/// Delete privileges.<br/>
/// The method arguments hold values for:<br/>
///     id, The structure of the id is namespace||sqlobject||privilege||grantee||grantor<br/>
ClassMethod DeleteSQLPrivileges(id As %String) As %DynamicObject
{
	New $NAMESPACE
	Set $NAMESPACE = "%SYS"
	If ##class(Security.SQLPrivileges).%ExistsId(id) {
		$$$ThrowOnError(##class(Security.SQLPrivileges).%DeleteId(id))
		Do ..%SetStatusCode($$$HTTP204)
	} Else {
		Do ..%SetStatusCode($$$HTTP404)
	}
	Quit ""
}

/// Set SQL Privileges<br/>
/// The method arguments hold values for:<br/>
///     SQLPrivilege<br/>
ClassMethod PutSQLPrivileges(SQLPrivilege As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.SQLPrivilege)
	Set resp = ..DefaultPutImpl("Security.SQLPrivileges", dModel, , $$$NO)
	Quit resp
}

ClassMethod DefaultGetImpl(class As %String, ids...) As %DynamicObject [ Private ]
{
	Set class = "Api.Config.Services." _ class

	If '$d(ids) {
		Do ..%SetStatusCode($$$HTTP200)
		Quit $CLASSMETHOD(class, "Get")
	}

	Set id1 = ##class(%CSP.Page).UnescapeURL(ids(1))

	If ids = 1 {
		
		If '$CLASSMETHOD(class, "Exists", id1) {
			Do ..%SetStatusCode($$$HTTP404)
			Quit ""
		}
		
		Quit $CLASSMETHOD(class, "Get", id1)
	}

	Set id2 = ##class(%CSP.Page).UnescapeURL(ids(2))

	If '$CLASSMETHOD(class, "Exists", id1, id2) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}

	Do ..%SetStatusCode($$$HTTP200)
	Quit $CLASSMETHOD(class, "Get", id1, id2)
}

ClassMethod DefaultDelImpl(class As %String, ids...) As %DynamicObject [ Private ]
{
	Set class = "Api.Config.Services." _ class
	Set id1 = ##class(%CSP.Page).UnescapeURL(ids(1))

	If ids = 1 {
		
		If '$CLASSMETHOD(class, "Exists", id1) {
			Do ..%SetStatusCode($$$HTTP404)
			Quit ""
		}
		
		$$$ThrowOnError($CLASSMETHOD(class, "Delete", id1))
		Do ..%SetStatusCode($$$HTTP204)
		Quit ""
	}

	Set id2 = ##class(%CSP.Page).UnescapeURL(ids(2))

	If '$CLASSMETHOD(class, "Exists", id1, id2) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError($CLASSMETHOD(class, "Delete", id1, id2))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

ClassMethod DefaultPostImpl(class As %String, dModel As %DynamicObject, Output created As %Boolean) As %DynamicObject [ Private ]
{
	Set class = "Api.Config.Services." _ class
	Set created = $$$NO, sc = $CLASSMETHOD(class, "CheckModel", dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	Set ids = $PARAMETER(class, "PIDENTIFIER")
	Set id1 = $Piece(ids,",",1)
	Set:id1="" id1="Name"
	Set id2 = $Piece(ids,",",2)

	If id2 = "" {
		If $CLASSMETHOD(class, "Exists", dModel.%Get(id1)) {
			Do ..%SetStatusCode($$$HTTP409)
			Quit ""
		}
	} Else {
		If $CLASSMETHOD(class, "Exists", dModel.%Get(id1), dModel.%Get(id2)) {
			Do ..%SetStatusCode($$$HTTP409)
			Quit ""
		}
	}
	
	$$$ThrowOnError($CLASSMETHOD(class, "Create", dModel))
	Set created = $$$YES
	Do ..%SetStatusCode($$$HTTP201)
	Quit ""
}

ClassMethod DefaultPutImpl(class As %String, dModel As %DynamicObject, Output updated As %Boolean, existsTest As %Boolean = {$$$YES}) As %DynamicObject [ Private ]
{
	Set class = "Api.Config.Services." _ class
	Set updated = $$$NO, sc = $CLASSMETHOD(class, "CheckModel", dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}

	If existsTest {
		Set ids = $PARAMETER(class, "PIDENTIFIER")
		Set id1 = $Piece(ids,",",1)
		Set:id1="" id1="Name"
		Set id2 = $Piece(ids,",",2)
		s ^lsc=id1 _ dModel.%Get(id1)
		If id2 = "" {
			If '$CLASSMETHOD(class, "Exists", dModel.%Get(id1)) {
				Do ..%SetStatusCode($$$HTTP404)
				Quit ""
			}
		} Else {
			If '$CLASSMETHOD(class, "Exists", dModel.%Get(id1), dModel.%Get(id2)) {
				Do ..%SetStatusCode($$$HTTP404)
				Quit ""
			}
		}
	}
	
	$$$ThrowOnError($CLASSMETHOD(class, "Update", dModel))
	Set updated = $$$YES
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

ClassMethod DefaultListOf(class As %String, propertyList As %String = "list") As %DynamicObject
{
	Set class = "Api.Config.Services." _ class, obj = {}
	Set lst = $CLASSMETHOD(class, "List")
	Do ..%SetStatusCode($$$HTTP200), ..%SetContentType("application/json"), obj.%Set(propertyList,lst)
	Quit obj
}

/// Create an Application in the Security database.<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PostWebApp(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Security.Applications", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"security/applications/"_##class(%CSP.Page).EscapeURL(dModel.Name))
	Quit resp
}

/// Gets an applications properties from the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, Web application url ex : /api/config don't forget to escape -> %2Fapi%2Fconfig<br/>
ClassMethod GetWebApp(name As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.Applications",name)
}

/// Modify an existing application's properties in the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, Web application url ex : /api/config don't forget to escape -> %2Fapi%2Fconfig<br/>
///     model<br/>
ClassMethod PutWebApp(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(model)
	Set name = ##class(%CSP.Page).UnescapeURL(name)
	Set dModel.Name = name
	If '##class(Api.Config.Services.Security.Applications).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}

	$$$ThrowOnError(##class(Api.Config.Services.Security.Applications).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// This method will delete an application from the security database.<br/>
/// The method arguments hold values for:<br/>
///     name, Web application url ex : /api/config don't forget to escape -> %2Fapi%2Fconfig<br/>
ClassMethod DeleteWebApp(name As %String) As %DynamicObject
{
    Quit ..DefaultDelImpl("Security.Applications",  name)
}

/// Get list of existing web applications.
ClassMethod GetListOfWebApps() As %DynamicObject
{
    Quit ..DefaultListOf("Security.Applications","applications")
}

/// Delete a resource.  After the resource is deleted, it will update all the roles which hold this resource to remove the resource from the role. It will then update the in-memory security tables to mark this resource as "No access" for all roles, and "no access" for its public permissions. Access to these resources will then be restricted only to users who own the %All role.<br/>
/// The method arguments hold values for:<br/>
///     name, resource name.<br/>
ClassMethod DeleteResources(name As %String) As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Gets a service's properties from the security database.<br/>
/// The method arguments hold values for:<br/>
///     name<br/>
ClassMethod GetService(name As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.Services",name)
}

/// Modifies a Service's properties from the security database.  Set Enable property to 1/0 to activate/disable.<br/>
/// The method arguments hold values for:<br/>
///     name<br/>
///     model<br/>
ClassMethod PutService(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(model)
	Set name = ##class(%CSP.Page).UnescapeURL(name)
	Set dModel.Name = name
	If '##class(Api.Config.Services.Security.Services).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}

	$$$ThrowOnError(##class(Api.Config.Services.Security.Services).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get list of services.
ClassMethod GetListOfServices() As %DynamicObject
{
    Quit ..DefaultListOf("Security.Services","services")
}

/// Get the system security properties.
ClassMethod GetSystem() As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.System")
}

/// Modifies the system security properties from the security database.<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PutSystem(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(model)
	Quit ..DefaultPutImpl("Security.System",dModel, .updated, $$$NO)
}

/// Allow to add privilege to tables/views/sqlproc by list of schemas and/or names.<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PutSqlHelper(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(model)
	$$$ThrowOnError(##class(Api.Config.Services.Security.SQLHelper).AddByModelHelper(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

}
