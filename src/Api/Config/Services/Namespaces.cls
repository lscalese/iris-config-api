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
		Set tStatement = ##class(%SQL.Statement).%New()
		Set sc = tStatement.%PrepareClassQuery(..#SYSCLASS,"List")
		If $$$ISERR(sc) $$$ThrowStatus(sc)
		Set tResult = tStatement.%Execute(Names)
		If (tResult.%SQLCODE'=0)&&(tResult.%SQLCODE'=100) $$$ThrowStatus($$$ERROR($$$SQLError, tResult.%SQLCODE, tResult.%Message)) 
		While tResult.%Next() {
			Set tmp($i(tmp))=tResult.%Get("Namespace")
		}
		Kill tResult,tStatement
	} Catch(ex) {
		Throw ex
	}

	Quit
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Set sc = $CLASSMETHOD(..#SYSCLASS, "Create",model.Name,.properties)
	
	If $$$ISOK(sc), model.Ensemble {
		Do ##class(%Library.EnsembleMgr).EnableNamespace(model.Name)
	}

	Quit sc
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Set sc = $CLASSMETHOD(..#SYSCLASS, "Modify", model.Name,.properties)
	
	If $$$ISOK(sc), model.Ensemble {
		Do ##class(%Library.EnsembleMgr).EnableNamespace(model.Name)
	}

	Quit sc
}

}
