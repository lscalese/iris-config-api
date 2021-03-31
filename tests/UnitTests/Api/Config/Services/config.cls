Class UnitTests.Api.Config.Services.config Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set model = ##class(Api.Config.Services.config).Get()
	Set expected = "locksiz"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "gmheap"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "routines"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

Method TestUpdate() As %Status
{
	Set sc = $$$OK
	Set old = ##class(Api.Config.Services.config).Get()
	Set model = {
		"locksiz" : 33554432,
		"routines" : 256
	}
	Set sc = ##class(Api.Config.Services.config).Update(model)
	Do $$$AssertStatusOK(sc)
	Set sc = ##class(Api.Config.Services.config).Update(old)
	Quit sc
}

}
