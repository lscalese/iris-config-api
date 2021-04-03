Include Api.Config.inc

Class Api.Config.Services.ECPServers Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Config.ECPServers";

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Address="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Address property is mandatory."))
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

}
