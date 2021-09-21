Include Api.Config.inc

Class Api.Config.Services.MapMirrors Extends Api.Config.Services.Common.MethodsObjectGenerator
{

Parameter SYSCLASS = "Config.MapMirrors";

Parameter ISMAP = 1;

Parameter PIDENTIFIER = "ID,Name";

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.GUID="" sc = $$$ADDSC(sc,$$$ERROR(5001, "GUID property is mandatory."))
	Set:model.ID="" sc = $$$ADDSC(sc,$$$ERROR(5001, "ID property is mandatory."))
	Set:model.InstanceDirectory="" sc = $$$ADDSC(sc,$$$ERROR(5001, "InstanceDirectory property is mandatory."))
	Set:model.MirrorAddress="" sc = $$$ADDSC(sc,$$$ERROR(5001, "MirrorAddress property is mandatory."))
	Set:model.MirrorSSPort="" sc = $$$ADDSC(sc,$$$ERROR(5001, "MirrorSSPort property is mandatory."))
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.MapMirrors).Create(model.ID,model.Name,.properties)
}

ClassMethod Delete(ID As %String, Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Config.MapMirrors).Delete(ID,Name)
}

ClassMethod Exists(ID As %String, Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Config.MapMirrors).Exists(ID,Name)
}

ClassMethod Get(ID As %String, Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(ID,Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.MapMirrors).Get(ID,Name,.properties))
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
	Quit ##class(Config.MapMirrors).Modify(model.ID,model.Name,.properties)
}

ClassMethod ListKey1() As %List
{
	Set l = ""
	Do ##class(Api.Config.Services.Mirrors).ExecQry("*",.tmp)
	Set key = ""
	For  {
		Set key = $Order(tmp(key),1,k1)
		Quit:key=""
		Set $list(l,key)=k1
	}
	Return l
}

}
