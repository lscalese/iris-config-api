Include Api.Config.inc

Class Api.Config.Services.Databases Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Config.Databases";

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Directory="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Directory property is mandatory."))
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

}
