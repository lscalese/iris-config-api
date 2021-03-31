Class UnitTests.Api.Config.Services.MapPackages Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestCreateAndDelete() As %Status
{
	Set sc = $$$OK
	Set model = {
		"Database": "USER",
		"Name": "ZZTESTAPI",
		"Namespace": "USER"
	}
	Set sc = ##class(Api.Config.Services.MapPackages).Create(model)
	Do $$$AssertStatusOK(sc,"Create status")
	
	Quit sc
}

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set Namespace = "USER"
	Set Name = "ZZTESTAPI"
	Set model = ##class(Api.Config.Services.MapPackages).Get(Namespace,Name)
	Set expected = "Database"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "Name"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "Namespace"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

Method TestList() As %Status
{
	Set sc = $$$OK
	Set Namespace = "USER"
	Set list = ##class(Api.Config.Services.MapPackages).List(Namespace)
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
		"Database": "USER",
		"Name": "ZZTESTAPI",
		"Namespace": "USER"
	}
	Set sc = ##class(Api.Config.Services.MapPackages).Update(model)
	Do $$$AssertStatusOK(sc)
	
	Set Namespace = "USER"
	Set Name = "ZZTESTAPI"
	Set sc = ##class(Api.Config.Services.MapPackages).Delete(Namespace,Name)
	Do $$$AssertStatusOK(sc,"Delete created ressource")
	Quit sc
}

}
