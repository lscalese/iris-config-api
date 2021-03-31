Class UnitTests.Api.Config.Services.Databases Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestCreateAndDelete() As %Status
{
	Set sc = $$$OK
	Set Name = "USER"
	Set model = ##class(Api.Config.Services.Databases).Get(Name)

	Set Name = "ZZUNITTESTSAPIDB1"
	Set model = {
		"ClusterMountMode": false,
		"Directory": (model.Directory),
		"MountAtStartup": false,
		"MountRequired": false,
		"Name": (Name)
	}
	Set sc = ##class(Api.Config.Services.Databases).Create(model)
	Do $$$AssertStatusOK(sc,"Create status")
	Set sc = ##class(Api.Config.Services.Databases).Delete(Name)
	Do $$$AssertStatusOK(sc,"Delete created ressource")
	Quit sc
}

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set Name = "USER"
	Set model = ##class(Api.Config.Services.Databases).Get(Name)
	Set expected = "Directory"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "MountAtStartup"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "Name"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

Method TestList() As %Status
{
	Set sc = $$$OK
	Set list = ##class(Api.Config.Services.Databases).List()
	Set iter = list.%GetIterator()
	While iter.%GetNext(.key,.value) {
		Set exists(value.Name)=""
	}
	Do $$$AssertTrue($Data(exists("USER")),"Check if USER exists is in the list")
	Quit sc
}

Method TestUpdate() As %Status
{
	Set sc = $$$OK, Name="USER"
	Set model = {
		"ClusterMountMode": false,
		"MountAtStartup": false,
		"MountRequired": false,
		"Name": (Name)
	}
	Set sc = ##class(Api.Config.Services.Databases).Update(model)
	Do $$$AssertStatusOK(sc)
	Quit sc
}

}
