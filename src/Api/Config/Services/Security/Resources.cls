Include Api.Config.inc

Class Api.Config.Services.Security.Resources Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Security.Resources";

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit $CLASSMETHOD(..#SYSCLASS, "Create",model.Name,model.Description, model.PublicPermission,model.Type)
}

}
