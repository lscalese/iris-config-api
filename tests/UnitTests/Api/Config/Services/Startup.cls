Class UnitTests.Api.Config.Services.Startup Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set model = ##class(Api.Config.Services.Startup).Get()
	Set expected = "SystemMode"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "TempDirectory"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "WebServerPort"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

Method TestUpdate() As %Status
{
	Set sc = $$$OK
	Set old = ##class(Api.Config.Services.Startup).Get()
	Set model = {
		"SystemMode":"DEVELOPMENT"
	}
	Set sc = ##class(Api.Config.Services.Startup).Update(model)
	Do $$$AssertStatusOK(sc)
	Set sc = ##class(Api.Config.Services.Startup).Update(old)

	Quit sc
}

}
