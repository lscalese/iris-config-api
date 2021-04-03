Class UnitTests.Api.Config.Services.Security.SQLPrivileges Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestCreate() As %Status
{
	Set sc = $$$OK
	Set model = {
		"Grantee" : "unittests1",
		"Grantor" : "_SYSTEM",
		"Namespace" : "USER",
		"SQLObject" : "1,Api_Config.*",
		"Grantable" : "0",
		"PrivList" : "dsu"
	}
	Set sc = ##class(Api.Config.Services.Security.SQLPrivileges).Create(model)
	Do $$$AssertStatusOK(sc,"Create status")
	;Set Name = ""
	;Set sc = ##class(Api.Config.Services.Security.SQLPrivileges).Delete(Name)
	;Do $$$AssertStatusOK(sc,"Delete created ressource")
	Quit sc
}

Method TestGet() As %Status
{
	Set sc = $$$OK
	
	Set model = ##class(Api.Config.Services.Security.SQLPrivileges).Get("USER","1,Api_Config.TempStream","s","unittests1","_SYSTEM")
	Do $$$AssertEquals($ISOBJECT(model),1)
	Set expected = "Grantee"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "Grantor"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "SQLObject"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

/*Method TestList() As %Status
{
	Set sc = $$$OK
	;Set list = ##class(Api.Config.Services.Security.SQLPrivileges).List()
	Quit sc
}*/
}
