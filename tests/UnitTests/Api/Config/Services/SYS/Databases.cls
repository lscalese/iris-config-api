Class UnitTests.Api.Config.Services.SYS.Databases Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestCreateAndDelete() As %Status
{
	Set sc = $$$OK
	Set Directory = ##class(%File).NormalizeDirectory($SYSTEM.Util.ManagerDirectory() _ "ztestapidata/")
	Set model = {
		"Directory": (Directory),
		"ExpansionSize": 128,
		"NewGlobalCollation": "5",
		"ReadOnly": false
	}
	Set sc = ##class(Api.Config.Services.SYS.Databases).Create(model)
	Do $$$AssertStatusOK(sc,"Create status")
	Set sc = ##class(Api.Config.Services.SYS.Databases).Delete(Directory)
	Do $$$AssertStatusOK(sc,"Delete created ressource")
	Quit sc
}

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set user = ##class(Api.Config.Services.Databases).Get("USER")
	Set Directory = user.Directory
	Set model = ##class(Api.Config.Services.SYS.Databases).Get(Directory)
	Set expected = "Directory"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "NewGlobalCollation"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "ReadOnly"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

Method TestList() As %Status
{
	Set sc = $$$OK
	Set user = ##class(Api.Config.Services.Databases).Get("USER")
	Set Directory = user.Directory

	Set list = ##class(Api.Config.Services.SYS.Databases).List()
	Set iter = list.%GetIterator()
	While iter.%GetNext(.key,.value) {
		Set exists(value.Directory)=""
	}
	Do $$$AssertTrue($Data(exists(Directory)),"Check if USER db directory exists is in the list")
	Quit sc
}

Method TestUpdate() As %Status
{
	Set sc = $$$OK
	Set model = ##class(Api.Config.Services.Databases).Get("USER")
	Set sc = ##class(Api.Config.Services.SYS.Databases).Update(model)
	Do $$$AssertStatusOK(sc)
	Quit sc
}

}
