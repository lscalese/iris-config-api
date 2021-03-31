Class UnitTests.Api.Config.Services.Namespaces Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestCreateAndDelete() As %Status
{
	Set sc = $$$OK
	Set Name = "ZZAPICONFIGUNITTESTS"

	If ##class(Api.Config.Services.Namespaces).Exists(Name) {
		Do ##class(Api.Config.Services.Namespaces).Delete(Name)
	}

	Set model = {
		"Name" : (Name),
		"Globals" : "USER",
		"Routines" : "USER"
	}
	Set sc = ##class(Api.Config.Services.Namespaces).Create(model)
	Do $$$AssertStatusOK(sc,"Create status")
	
	Set sc = ##class(Api.Config.Services.Namespaces).Delete(Name)
	Do $$$AssertStatusOK(sc,"Delete created ressource")
	Quit sc
}

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set Name = "USER"
	Set model = ##class(Api.Config.Services.Namespaces).Get(Name)
	Set expected = "Globals"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "Routines"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "TempGlobals"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

Method TestList() As %Status
{
	Set sc = $$$OK
	Set list = ##class(Api.Config.Services.Namespaces).List()
	Set iter = list.%GetIterator()
	While iter.%GetNext(.key,.value) {
		Set exists(value.Name)=""
	}
	Do $$$AssertTrue($Data(exists("%SYS")),"Check if SYS is in the list")
	Do $$$AssertTrue($Data(exists("USER")),"Check if USER is in the list")
	
	Quit sc
}

Method TestUpdate() As %Status
{
	Set sc = $$$OK
	Set model = {
		"Name" : "USER",
		"Globals" : "USER",
		"Routines" : "USER"
	}
	Set sc = ##class(Api.Config.Services.Namespaces).Update(model)
	Do $$$AssertStatusOK(sc)
	Quit sc
}

}
