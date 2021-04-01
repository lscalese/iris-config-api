Include Api.Config.inc

Class Api.Config.Services.Security.Roles Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Security.Roles";

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit $CLASSMETHOD(..#SYSCLASS, "Create",model.Name,model.Description, model.Resources,model.GrantedRoles)
}

}
