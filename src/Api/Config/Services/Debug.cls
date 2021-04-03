Include Api.Config.inc

Class Api.Config.Services.Debug Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Config.Debug";

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

}
