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

ClassMethod ExecQry(Names, ByRef tmp)
{
	$$$switchNSSys
	Try{
		Set rs = ##class(%ResultSet).%New(..#SYSCLASS_":List")
		Set sc = rs.Execute(Names)
		If $$$ISERR(sc) $$$ThrowStatus(sc)
		While rs.Next() {
			Set tmp($i(tmp))=rs.Get("Name")
		}
		Do rs.Close()
		Kill rs
	} Catch(ex) {
		Throw ex
	}

	Quit
}

}
