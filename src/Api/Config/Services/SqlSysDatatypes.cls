Include Api.Config.inc

Class Api.Config.Services.SqlSysDatatypes Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Config.SqlSysDatatypes";

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Datatype="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Datatype property is mandatory."))
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

}
