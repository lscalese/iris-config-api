Include Api.Config.inc

Class Api.Config.Services.Mirrors Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Config.Mirrors";

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

}
