Class UnitTests.Api.Config.Services.Security.SSLConfigs Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestCreate() As %Status
{
	Set sc = $$$OK
	Set model = {
		"Name":"DefaultUnitTests",
		"Description" : "unit test"
	}
	Set sc = ##class(Api.Config.Services.Security.SSLConfigs).Create(model)
	Do $$$AssertStatusOK(sc,"Create status")
	Quit sc
}

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set Name = "DefaultUnitTests"
	Set model = ##class(Api.Config.Services.Security.SSLConfigs).Get(Name)
	Set expected = "Name"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "Description"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "PrivateKeyFile"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

Method TestList() As %Status
{
	Set sc = $$$OK
	Set list = ##class(Api.Config.Services.Security.SSLConfigs).List()
	Set iter = list.%GetIterator()
	While iter.%GetNext(.key,.value) {
		Set exists(value.Name)=""
	}
	Do $$$AssertTrue($Data(exists("DefaultUnitTests")),"Check if DefaultUnitTests is in the list")
	
	Quit sc
}

Method TestUpdate() As %Status
{
	Set sc = $$$OK
	Set model = {
		"Name":"DefaultUnitTests",
		"Description" : "unit test update"
	}
	Set sc = ##class(Api.Config.Services.Security.SSLConfigs).Update(model)
	Do $$$AssertStatusOK(sc)

	Set Name = "DefaultUnitTests"
	Set sc = ##class(Api.Config.Services.Security.SSLConfigs).Delete(Name)
	Do $$$AssertStatusOK(sc,"Delete created ressource")

	Quit sc
}

}
