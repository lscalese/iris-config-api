Include Api.Config.inc

/// Description
Class Api.Config.Services.Security.System Extends Api.Config.Services.Common.Single
{

Parameter UPDATEONLY = 1;

Parameter SYSCLASS = "Security.System";

Parameter FIXID = "SYSTEM";

ClassMethod Get() As %Library.DynamicObject
{
	$$$switchNSSys
	$$$ThrowOnError($CLASSMETHOD(..#SYSCLASS, "Get", ..#FIXID, .properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit $CLASSMETHOD(..#SYSCLASS, "Modify", ..#FIXID, .properties)
}

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

}
