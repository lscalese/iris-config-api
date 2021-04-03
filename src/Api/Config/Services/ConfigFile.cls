Include Api.Config.inc

Class Api.Config.Services.ConfigFile Extends Api.Config.Services.Common.Single
{

Parameter SYSCLASS = "Config.ConfigFile";

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Version="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Version property is mandatory."))
	Quit sc
}

}
