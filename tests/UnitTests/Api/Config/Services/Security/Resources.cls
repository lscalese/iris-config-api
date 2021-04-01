Class UnitTests.Api.Config.Services.Security.Resources Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestCreateAndDelete() As %Status
{
	Set sc = $$$OK
	Set Name = "ConfigAPIUnitTests"
	Set sc = ##class(Api.Config.Services.Security.Resources).Delete(Name)
	Set model = {
		"Description" : "Resources test",
		"Name":(Name),
		"PublicPermission":0,
		"Type":0

	}
	Set sc = ##class(Api.Config.Services.Security.Resources).Create(model)
	Do $$$AssertStatusOK(sc,"Create status")
	
	Set sc = ##class(Api.Config.Services.Security.Resources).Delete(Name)
	Do $$$AssertStatusOK(sc,"Delete created ressource")
	Quit sc
}

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set Name = "%Admin_Journal"
	Set model = ##class(Api.Config.Services.Security.Resources).Get(Name)
	Set expected = "Description"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "Name"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "PublicPermission"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

Method TestList() As %Status
{
	Set sc = $$$OK
	Set list = ##class(Api.Config.Services.Security.Resources).List()
	Set iter = list.%GetIterator()
	While iter.%GetNext(.key,.value) {
		Set exists(value.Name)=""
	}
	Do $$$AssertTrue($Data(exists("%Admin_Journal")),"Check if %Admin_Journal is in the list")

	Quit sc
}

Method TestUpdate() As %Status
{
	Set sc = $$$OK
	Set model = {
		"Name":"%Admin_Journal"
	}
	Set sc = ##class(Api.Config.Services.Security.Resources).Update(model)
	Do $$$AssertStatusOK(sc)
	Quit sc
}

}
