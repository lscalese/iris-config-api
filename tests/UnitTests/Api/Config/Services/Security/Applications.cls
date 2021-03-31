Class UnitTests.Api.Config.Services.Security.Applications Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestCreate() As %Status
{
	Set sc = $$$OK
	Set model = {
		"Name":"/csp/zzzrestapp",
		"DispatchClass" : "my.dispatch.class",
		"NameSpace" : "MYAPP",
		"Enabled" : "1",
		"AutheEnabled": "64",
		"CookiePath" : "/csp/zzzrestapp/"
	}
	Set sc = ##class(Api.Config.Services.Security.Applications).Create(model)
	Do $$$AssertStatusOK(sc,"Create status")
	
	Quit sc
}

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set Name = "/csp/zzzrestapp"
	Set model = ##class(Api.Config.Services.Security.Applications).Get(Name)
	zw model
	Set expected = "DispatchClass"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "NameSpace"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "AutheEnabled"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

Method TestList() As %Status
{
	Set sc = $$$OK
	Set list = ##class(Api.Config.Services.Security.Applications).List()
	Set iter = list.%GetIterator()
	While iter.%GetNext(.key,.value) {
		Set exists(value.Name)=""
	}
	Do $$$AssertTrue($Data(exists("/csp/zzzrestapp")),"Check if /csp/zzzrestapp is in the list")
	Quit sc
}

Method TestUpdate() As %Status
{
	Set sc = $$$OK
	Set model = {
		"Name":"/csp/zzzrestapp",
		"DispatchClass" : "my.dispatch.class",
		"Namespace" : "MYAPP",
		"Enabled" : "0",
		"AuthEnabled": "64",
		"CookiePath" : "/csp/zzzrestapp/"
	}
	Set sc = ##class(Api.Config.Services.Security.Applications).Update(model)
	Do $$$AssertStatusOK(sc)

	Set sc = ##class(Api.Config.Services.Security.Applications).Delete("/csp/zzzrestapp")
	Do $$$AssertStatusOK(sc,"Delete created ressource")

	Quit sc
}

}
