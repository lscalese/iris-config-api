Include Api.Config.inc

Class Api.Config.Services.Security.Users Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Security.Users";

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
    kill properties("Name")
	Quit $CLASSMETHOD(..#SYSCLASS, "Create",model.Name,.properties)
}

}
