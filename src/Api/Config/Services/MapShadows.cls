Include Api.Config.inc

Class Api.Config.Services.MapShadows Extends Api.Config.Services.Common.MethodsObjectGenerator
{

Parameter SYSCLASS = "Config.MapShadows";

Parameter ISMAP = 1;

Parameter PIDENTIFIER = "ID,Name";

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Directory="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Directory property is mandatory."))
	Set:model.ID="" sc = $$$ADDSC(sc,$$$ERROR(5001, "ID property is mandatory."))
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.MapShadows).Create(model.ID,model.Name,.properties)
}

ClassMethod Delete(ID As %String, Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Config.MapShadows).Delete(ID,Name)
}

ClassMethod Exists(ID As %String, Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Config.MapShadows).Exists(ID,Name)
}

ClassMethod Get(ID As %String, Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(ID,Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.MapShadows).Get(ID,Name,.properties))
	Set properties("ID") = ID, properties("Name") = Name
	Quit ..ToDynamic(.properties)
}

ClassMethod List(ID As %String, Names As %String = "*") As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set tStatement = ##class(%SQL.Statement).%New()
		Set sc = tStatement.%PrepareClassQuery(..#SYSCLASS,"List")
		If $$$ISERR(sc) $$$ThrowStatus(sc)
		Set tResult = tStatement.%Execute(ID,Names)
		If (tResult.%SQLCODE'=0)&&(tResult.%SQLCODE'=100) $$$ThrowStatus($$$ERROR($$$SQLError, tResult.%SQLCODE, tResult.%Message)) 
		While tResult.%Next() {
			Do list.%Push(..Get(ID, tResult.%Get("Name")))
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
	Quit ##class(Config.MapShadows).Modify(model.ID,model.Name,.properties)
}

}
