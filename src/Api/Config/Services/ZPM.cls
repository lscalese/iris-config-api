/// Description
Class Api.Config.Services.ZPM
{

/// Description
ClassMethod Execute(namespace As %String, command As %String, args As %String = "", pTerminateOnError As %Boolean = 0) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = namespace
    Quit ##class(%ZPM.PackageManager).Shell(command _ " " _ args, pTerminateOnError)
}

}
