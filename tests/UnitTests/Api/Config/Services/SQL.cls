Class UnitTests.Api.Config.Services.SQL Extends %UnitTest.TestCase [ ProcedureBlock ]
{

Method TestGet() As %Status
{
	Set sc = $$$OK
	Set model = ##class(Api.Config.Services.SQL).Get()
	Set expected = "LockThreshold"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "LockTimeout"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Set expected = "JDBCGatewayPort"
	Do $$$AssertTrue(model.%IsDefined(expected),$replace("Check if property %1 is defined","%1",expected))
	Quit sc
}

Method TestUpdate() As %Status
{
	Set sc = $$$OK
	Set model = {
		"LockThreshold":1500
	}
	Set sc = ##class(Api.Config.Services.SQL).Update(model)
	Do $$$AssertStatusOK(sc)
	Quit sc
}

}
