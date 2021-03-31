Class UnitTests.Api.Config.Services.MapGlobals Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestCreate() As %Status
{
	Set sc = $$$OK
	Do ##class(Api.Config.Services.MapGlobals).Delete("USER","ZZTESTAPI")
	Set model = {
		"Collation": 5,
		"Database": "USER",
		"Name": "ZZTESTAPI",
		"Namespace": "USER"
	}
	Set sc = ##class(Api.Config.Services.MapGlobals).Create(model)
	Do $$$AssertStatusOK(sc,"Create status")
	
	Quit sc
}

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set Namespace = "USER"
	Set Name = "ZZTESTAPI"
	Set model = ##class(Api.Config.Services.MapGlobals).Get(Namespace,Name)
	Set expected = "Name"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "Namespace"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "Collation"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))

	Quit sc
}

Method TestList() As %Status
{
	Set sc = $$$OK
	Set Namespace = "USER"
	Set list = ##class(Api.Config.Services.MapGlobals).List(Namespace)
	Set iter = list.%GetIterator()
	While iter.%GetNext(.key,.value) {
		Set exists(value.Name)=""
	}
	Do $$$AssertTrue($Data(exists("ZZTESTAPI")),"Check if ZZTESTAPI mapping exists is in the list")
	Quit sc
}

Method TestUpdate() As %Status
{
	Set sc = $$$OK
	Set model = {
		"Collation": 5,
		"Database": "USER",
		"Name": "ZZTESTAPI",
		"Namespace": "USER"
	}
	Set sc = ##class(Api.Config.Services.MapGlobals).Update(model)
	Do $$$AssertStatusOK(sc)

	Set sc = ##class(Api.Config.Services.MapGlobals).Delete("USER","ZZTESTAPI")
	Do $$$AssertStatusOK(sc,"Delete created ressource")

	Quit sc
}

}
