Include Api.Config.inc

Class Api.Config.Services.MapRoutines Extends Api.Config.Services.Common.MethodsObjectGenerator
{

Parameter SYSCLASS = "Config.MapRoutines";

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
	Quit ##class(Config.MapRoutines).Create(model.Namespace,model.Name,.properties)
}

ClassMethod Delete(Namespace As %String, Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Config.MapRoutines).Delete(Namespace,Name)
}

ClassMethod Exists(Namespace As %String, Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Config.MapRoutines).Exists(Namespace,Name)
}

ClassMethod Get(Namespace As %String, Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Namespace,Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.MapRoutines).Get(Namespace,Name,.properties))
	Set properties("Namespace") = Namespace, properties("Name") = Name
	Quit ..ToDynamic(.properties)
}

ClassMethod List(Namespace As %String, Names As %String = "*", CPFFile As %String = "", Flags As %Integer = 0) As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Config.MapRoutines:List")
		Do rs.Execute(Namespace,Names,CPFFile,Flags)
		While rs.Next() {
			Do list.%Push(..Get(Namespace, rs.Data("Name")))
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
	Quit ##class(Config.MapRoutines).Modify(model.Namespace,model.Name,.properties)
}

}
