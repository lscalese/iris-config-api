Include Api.Config.inc

Class Api.Config.Services.Devices Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Config.Devices";

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Set:model.PhysicalDevice="" sc = $$$ADDSC(sc,$$$ERROR(5001, "PhysicalDevice property is mandatory."))
	Set:model.SubType="" sc = $$$ADDSC(sc,$$$ERROR(5001, "SubType property is mandatory."))
	Set:model.Type="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Type property is mandatory."))
	Quit sc
}

}
