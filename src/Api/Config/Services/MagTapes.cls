Include Api.Config.inc

Class Api.Config.Services.MagTapes Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Config.MagTapes";

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Set:model.SystemDevice="" sc = $$$ADDSC(sc,$$$ERROR(5001, "SystemDevice property is mandatory."))
	Quit sc
}

}
