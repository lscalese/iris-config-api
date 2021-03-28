Include Api.Config.inc

/// Description
Class Api.Config.Services.Security.Applications
{

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Security.Applications).Create(model.Name,.properties)
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Security.Applications).Modify(model.Name,.properties)
}

ClassMethod Delete(Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Security.Applications).Delete(Name)
}

ClassMethod Exists(Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Security.Applications).Exists(Name)
}

ClassMethod Get(Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Security.Applications).Get(Name,.properties))
	Set properties("Name") = Name
	Quit ..ToDynamic(.properties)
}

ClassMethod List(Names As %String = "*") As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Security.Applications:List")
		Do rs.Execute(Names)
		While rs.Next() {
			Do list.%Push(..Get(rs.Data("Name")))
		}
		Do rs.Close()
		$$$restoreNS
	}Catch(ex) {
		$$$restoreNS
		Throw ex
	}
	Return list
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("AutheEnabled") = pObj.AutheEnabled
	Set properties("AutoCompile") = pObj.AutoCompile
	Set properties("CSPZENEnabled") = pObj.CSPZENEnabled
	Set properties("CSRFToken") = pObj.CSRFToken
	Set properties("ChangePasswordPage") = pObj.ChangePasswordPage
	Set properties("ClientApplications") = pObj.ClientApplications
	Set properties("CookiePath") = pObj.CookiePath
	Set properties("DeepSeeEnabled") = pObj.DeepSeeEnabled
	Set properties("Description") = pObj.Description
	Set properties("DispatchClass") = pObj.DispatchClass
	Set properties("Enabled") = pObj.Enabled
	Set properties("ErrorPage") = pObj.ErrorPage
	Set properties("EventClass") = pObj.EventClass
	Set properties("GroupById") = pObj.GroupById
	Set properties("InbndWebServicesEnabled") = pObj.InbndWebServicesEnabled
	Set properties("IsNameSpaceDefault") = pObj.IsNameSpaceDefault
	Set properties("LockCSPName") = pObj.LockCSPName
	Set properties("LoginPage") = pObj.LoginPage
	Set properties("MatchRoles") = pObj.MatchRoles
	Set properties("Name") = pObj.Name
	Set properties("NameSpace") = pObj.NameSpace
	Set properties("Package") = pObj.Package
	Set properties("Path") = pObj.Path
	Set properties("PermittedClasses") = pObj.PermittedClasses
	Set properties("Recurse") = pObj.Recurse
	Set properties("Resource") = pObj.Resource
	Set properties("Routines") = pObj.Routines
	Set properties("ServeFiles") = pObj.ServeFiles
	Set properties("ServeFilesTimeout") = pObj.ServeFilesTimeout
	Set properties("SessionScope") = pObj.SessionScope
	Set properties("SuperClass") = pObj.SuperClass
	Set properties("Timeout") = pObj.Timeout
	Set properties("Type") = pObj.Type
	Set properties("UseCookies") = pObj.UseCookies
	Set properties("UserCookieScope") = pObj.UserCookieScope
	Set properties("iKnowEnabled") = pObj.iKnowEnabled
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"AutheEnabled") properties("AutheEnabled") = model.AutheEnabled
	Set:$$$CanSetProperty(model,"AutoCompile") properties("AutoCompile") = model.AutoCompile
	Set:$$$CanSetProperty(model,"CSPZENEnabled") properties("CSPZENEnabled") = model.CSPZENEnabled
	Set:$$$CanSetProperty(model,"CSRFToken") properties("CSRFToken") = model.CSRFToken
	Set:$$$CanSetProperty(model,"ChangePasswordPage") properties("ChangePasswordPage") = model.ChangePasswordPage
	Set:$$$CanSetProperty(model,"ClientApplications") properties("ClientApplications") = model.ClientApplications
	Set:$$$CanSetProperty(model,"CookiePath") properties("CookiePath") = model.CookiePath
	Set:$$$CanSetProperty(model,"DeepSeeEnabled") properties("DeepSeeEnabled") = model.DeepSeeEnabled
	Set:$$$CanSetProperty(model,"Description") properties("Description") = model.Description
	Set:$$$CanSetProperty(model,"DispatchClass") properties("DispatchClass") = model.DispatchClass
	Set:$$$CanSetProperty(model,"Enabled") properties("Enabled") = model.Enabled
	Set:$$$CanSetProperty(model,"ErrorPage") properties("ErrorPage") = model.ErrorPage
	Set:$$$CanSetProperty(model,"EventClass") properties("EventClass") = model.EventClass
	Set:$$$CanSetProperty(model,"GroupById") properties("GroupById") = model.GroupById
	Set:$$$CanSetProperty(model,"InbndWebServicesEnabled") properties("InbndWebServicesEnabled") = model.InbndWebServicesEnabled
	Set:$$$CanSetProperty(model,"IsNameSpaceDefault") properties("IsNameSpaceDefault") = model.IsNameSpaceDefault
	Set:$$$CanSetProperty(model,"LockCSPName") properties("LockCSPName") = model.LockCSPName
	Set:$$$CanSetProperty(model,"LoginPage") properties("LoginPage") = model.LoginPage
	Set:$$$CanSetProperty(model,"MatchRoles") properties("MatchRoles") = model.MatchRoles
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"NameSpace") properties("NameSpace") = model.NameSpace
	Set:$$$CanSetProperty(model,"Package") properties("Package") = model.Package
	Set:$$$CanSetProperty(model,"Path") properties("Path") = model.Path
	Set:$$$CanSetProperty(model,"PermittedClasses") properties("PermittedClasses") = model.PermittedClasses
	Set:$$$CanSetProperty(model,"Recurse") properties("Recurse") = model.Recurse
	Set:$$$CanSetProperty(model,"Resource") properties("Resource") = model.Resource
	Set:$$$CanSetProperty(model,"Routines") properties("Routines") = model.Routines
	Set:$$$CanSetProperty(model,"ServeFiles") properties("ServeFiles") = model.ServeFiles
	Set:$$$CanSetProperty(model,"ServeFilesTimeout") properties("ServeFilesTimeout") = model.ServeFilesTimeout
	Set:$$$CanSetProperty(model,"SessionScope") properties("SessionScope") = model.SessionScope
	Set:$$$CanSetProperty(model,"SuperClass") properties("SuperClass") = model.SuperClass
	Set:$$$CanSetProperty(model,"Timeout") properties("Timeout") = model.Timeout
	Set:$$$CanSetProperty(model,"Type") properties("Type") = model.Type
	Set:$$$CanSetProperty(model,"UseCookies") properties("UseCookies") = model.UseCookies
	Set:$$$CanSetProperty(model,"UserCookieScope") properties("UserCookieScope") = model.UserCookieScope
	Set:$$$CanSetProperty(model,"iKnowEnabled") properties("iKnowEnabled") = model.iKnowEnabled
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("AutheEnabled")) model.%Set("AutheEnabled", properties("AutheEnabled"), "string")
	Do:$Data(properties("AutoCompile")) model.%Set("AutoCompile", properties("AutoCompile"), "boolean")
	Do:$Data(properties("CSPZENEnabled")) model.%Set("CSPZENEnabled", properties("CSPZENEnabled"), "boolean")
	Do:$Data(properties("CSRFToken")) model.%Set("CSRFToken", properties("CSRFToken"), "boolean")
	Do:$Data(properties("ChangePasswordPage")) model.%Set("ChangePasswordPage", properties("ChangePasswordPage"), "string")
	Do:$Data(properties("ClientApplications")) model.%Set("ClientApplications", properties("ClientApplications"), "string")
	Do:$Data(properties("CookiePath")) model.%Set("CookiePath", properties("CookiePath"), "string")
	Do:$Data(properties("DeepSeeEnabled")) model.%Set("DeepSeeEnabled", properties("DeepSeeEnabled"), "boolean")
	Do:$Data(properties("Description")) model.%Set("Description", properties("Description"), "string")
	Do:$Data(properties("DispatchClass")) model.%Set("DispatchClass", properties("DispatchClass"), "string")
	Do:$Data(properties("Enabled")) model.%Set("Enabled", properties("Enabled"), "boolean")
	Do:$Data(properties("ErrorPage")) model.%Set("ErrorPage", properties("ErrorPage"), "string")
	Do:$Data(properties("EventClass")) model.%Set("EventClass", properties("EventClass"), "string")
	Do:$Data(properties("GroupById")) model.%Set("GroupById", properties("GroupById"), "string")
	Do:$Data(properties("InbndWebServicesEnabled")) model.%Set("InbndWebServicesEnabled", properties("InbndWebServicesEnabled"), "boolean")
	Do:$Data(properties("IsNameSpaceDefault")) model.%Set("IsNameSpaceDefault", properties("IsNameSpaceDefault"), "boolean")
	Do:$Data(properties("LockCSPName")) model.%Set("LockCSPName", properties("LockCSPName"), "boolean")
	Do:$Data(properties("LoginPage")) model.%Set("LoginPage", properties("LoginPage"), "string")
	Do:$Data(properties("MatchRoles")) model.%Set("MatchRoles", properties("MatchRoles"), "string")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("NameSpace")) model.%Set("NameSpace", properties("NameSpace"), "string")
	Do:$Data(properties("Package")) model.%Set("Package", properties("Package"), "string")
	Do:$Data(properties("Path")) model.%Set("Path", properties("Path"), "string")
	Do:$Data(properties("PermittedClasses")) model.%Set("PermittedClasses", properties("PermittedClasses"), "string")
	Do:$Data(properties("Recurse")) model.%Set("Recurse", properties("Recurse"), "boolean")
	Do:$Data(properties("Resource")) model.%Set("Resource", properties("Resource"), "string")
	Do:$Data(properties("Routines")) model.%Set("Routines", properties("Routines"), "string")
	Do:$Data(properties("ServeFiles")) model.%Set("ServeFiles", properties("ServeFiles"), "number")
	Do:$Data(properties("ServeFilesTimeout")) model.%Set("ServeFilesTimeout", properties("ServeFilesTimeout"), "number")
	Do:$Data(properties("SessionScope")) model.%Set("SessionScope", properties("SessionScope"), "number")
	Do:$Data(properties("SuperClass")) model.%Set("SuperClass", properties("SuperClass"), "string")
	Do:$Data(properties("Timeout")) model.%Set("Timeout", properties("Timeout"), "number")
	Do:$Data(properties("Type")) model.%Set("Type", properties("Type"), "string")
	Do:$Data(properties("UseCookies")) model.%Set("UseCookies", properties("UseCookies"), "number")
	Do:$Data(properties("UserCookieScope")) model.%Set("UserCookieScope", properties("UserCookieScope"), "number")
	Do:$Data(properties("iKnowEnabled")) model.%Set("iKnowEnabled", properties("iKnowEnabled"), "boolean")
	Quit model
}

}
