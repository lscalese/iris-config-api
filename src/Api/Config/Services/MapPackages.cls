Include Api.Config.inc

Class Api.Config.Services.MapPackages Extends Api.Config.Services.Common.MethodsObjectGenerator
{

Parameter SYSCLASS = "Config.MapPackages";

Parameter ISMAP = 1;

Parameter PIDENTIFIER = "Namespace,Name";

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Database="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Database property is mandatory."))
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Set:model.Namespace="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Namespace property is mandatory."))
	Quit sc
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.MapPackages).Create(model.Namespace,model.Name,.properties)
}

ClassMethod Delete(Namespace As %String, Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Config.MapPackages).Delete(Namespace,Name)
}

ClassMethod Exists(Namespace As %String, Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Config.MapPackages).Exists(Namespace,Name)
}

ClassMethod Get(Namespace As %String, Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Namespace,Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.MapPackages).Get(Namespace,Name,.properties))
	Set properties("Namespace") = Namespace, properties("Name") = Name
	Quit ..ToDynamic(.properties)
}

ClassMethod List(Namespace As %String, Names As %String = "*") As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set tStatement = ##class(%SQL.Statement).%New()
		Set sc = tStatement.%PrepareClassQuery(..#SYSCLASS,"List")
		If $$$ISERR(sc) $$$ThrowStatus(sc)
		Set tResult = tStatement.%Execute(Namespace,Names)
		If (tResult.%SQLCODE'=0)&&(tResult.%SQLCODE'=100) $$$ThrowStatus($$$ERROR($$$SQLError, tResult.%SQLCODE, tResult.%Message)) 
		While tResult.%Next() {
			Do list.%Push(..Get(Namespace, tResult.%Get("Name")))
		}
		Kill tResult,tStatement
		$$$restoreNS
	}Catch(ex) {
		$$$restoreNS
		Throw ex
	}
	Return list
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.MapPackages).Modify(model.Namespace,model.Name,.properties)
}

}
