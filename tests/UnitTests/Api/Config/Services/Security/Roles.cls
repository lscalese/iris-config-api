Class UnitTests.Api.Config.Services.Security.Roles Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestCreateAndDelete() As %Status
{
	Set sc = $$$OK
	Set Name = "ZZUnitTestsRole"
	Do ##class(Api.Config.Services.Security.Roles).Delete(Name)
	Set model = {
		"Name" : (Name),
		"Description": "config-api unit tests role",
		"GrantedRoles":""
	}
	Set sc = ##class(Api.Config.Services.Security.Roles).Create(model)
	Do $$$AssertStatusOK(sc,"Create status")
	
	Set sc = ##class(Api.Config.Services.Security.Roles).Delete(Name)
	Do $$$AssertStatusOK(sc,"Delete created ressource")
	Quit sc
}

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set Name = ""
	Set model = ##class(Api.Config.Services.Security.Roles).Get("%ALL")
	Set expected = "Name"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "Description"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "GrantedRoles"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

Method TestList() As %Status
{
	Set sc = $$$OK
	Set list = ##class(Api.Config.Services.Security.Roles).List()
	Set iter = list.%GetIterator()
	While iter.%GetNext(.key,.value) {
		Set exists(value.Name)=""
	}
	Do $$$AssertTrue($Data(exists("%All")),"Check if %All is in the list")
	
	Quit sc
}

Method TestUpdate() As %Status
{
	Set sc = $$$OK
	Set model = {
		"Name":"%DB_%DEFAULT",
		"Description":"R/W access for this resource"
	}
	Set sc = ##class(Api.Config.Services.Security.Roles).Update(model)
	Do $$$AssertStatusOK(sc)
	Quit sc
}

}
