Include Api.Config.inc

Class Api.Config.Services.Common.Single Extends Api.Config.Services.Common.MethodsObjectGenerator
{

Parameter SYSCLASS;

Parameter ISSINGLE = 1;

ClassMethod Get() As %Library.DynamicObject
{
	$$$switchNSSys
	$$$ThrowOnError($CLASSMETHOD(..#SYSCLASS, "Get", .properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit $CLASSMETHOD(..#SYSCLASS, "Modify", .properties)
}

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

}
