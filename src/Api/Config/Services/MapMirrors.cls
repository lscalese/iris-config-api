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

ClassMethod List(ID As %String, Names As %String = "*", CPFFile As %String = "", Flags As %Integer = 0, Format As %Integer = 0) As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Config.MapMirrors:List")
		Do rs.Execute(ID,Names,CPFFile,Flags,Format)
		While rs.Next() {
			Do list.%Push(..Get(ID, rs.Data("Name")))
		}
		Do rs.Close()
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

}
