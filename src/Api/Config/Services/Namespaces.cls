Include Api.Config.inc

Class Api.Config.Services.Namespaces Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Config.Namespaces";

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Globals="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Globals property is mandatory."))
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Set:model.Routines="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Routines property is mandatory."))
	Quit sc
}

ClassMethod ExecQry(Names, ByRef tmp)
{
	$$$switchNSSys
	Try{
		Set rs=##class(%Library.ResultSet).%New(..#SYSCLASS_":List")
		Do rs.Execute(Names)
		While rs.Next() {
			Set tmp($i(tmp))=rs.Data("Namespace")
		}
		Do rs.Close()
	}Catch(ex) {
		Throw ex
	}
	Kill rs
	Quit
}

}
