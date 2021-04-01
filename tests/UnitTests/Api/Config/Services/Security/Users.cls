Class UnitTests.Api.Config.Services.Security.Users Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestCreateAndDelete() As %Status
{
	Set sc = $$$OK
	Set Name = "configapiusertest"
	Set model = {
		"Name":(Name),
		"Password":"*$test123]",
		"NameSpace":"USER",
		"PasswordNeverExpires":1
	}
	Set sc = ##class(Api.Config.Services.Security.Users).Create(model)
	Do $$$AssertStatusOK(sc,"Create status")
	
	Set sc = ##class(Api.Config.Services.Security.Users).Delete(Name)
	Do $$$AssertStatusOK(sc,"Delete created ressource")
	Quit sc
}

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set Name = "_SYSTEM"
	Set model = ##class(Api.Config.Services.Security.Users).Get(Name)
	Set expected = "Name"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "Comment"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "Roles"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

Method TestList() As %Status
{
	Set sc = $$$OK
	Set list = ##class(Api.Config.Services.Security.Users).List()
	Set iter = list.%GetIterator()
	While iter.%GetNext(.key,.value) {
		Set exists(value.Name)=""
	}
	Do $$$AssertTrue($Data(exists("_SYSTEM")),"Check if _SYSTEM is in the list")
	
	Quit sc
}

Method TestUpdate() As %Status
{
	Set sc = $$$OK
	Set model = {
		"Name":"_SYSTEM",
		"Comment":""
	}
	Set sc = ##class(Api.Config.Services.Security.Users).Update(model)
	Do $$$AssertStatusOK(sc)
	Quit sc
}

}
