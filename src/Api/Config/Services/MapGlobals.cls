Include Api.Config.inc

Class Api.Config.Services.MapGlobals [ ProcedureBlock ]
{

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
	Quit ##class(Config.MapGlobals).Create(model.Namespace,model.Name,.properties)
}

ClassMethod Delete(Namespace As %String, Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Config.MapGlobals).Delete(Namespace,Name)
}

ClassMethod Exists(Namespace As %String, Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Config.MapGlobals).Exists(Namespace,Name)
}

ClassMethod Get(Namespace As %String, Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Namespace,Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.MapGlobals).Get(Namespace,Name,.properties))
	Set properties("Name") = Name, properties("Namespace") = Namespace
	Quit ..ToDynamic(.properties)
}

ClassMethod List(Namespace As %String, Names As %String = "*", CPFFile As %String = "", Flags As %Integer = 0) As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Config.MapGlobals:List")
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

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("Collation") = pObj.Collation
	Set properties("Comments") = pObj.Comments
	Set properties("Database") = pObj.Database
	Set properties("Flags") = pObj.Flags
	Set properties("LockDatabase") = pObj.LockDatabase
	Set properties("Name") = pObj.Name
	Set properties("Namespace") = pObj.Namespace
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Collation") properties("Collation") = model.Collation
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"Database") properties("Database") = model.Database
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"LockDatabase") properties("LockDatabase") = model.LockDatabase
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"Namespace") properties("Namespace") = model.Namespace
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Collation")) model.%Set("Collation", properties("Collation"), "number")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("Database")) model.%Set("Database", properties("Database"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("LockDatabase")) model.%Set("LockDatabase", properties("LockDatabase"), "string")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("Namespace")) model.%Set("Namespace", properties("Namespace"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.MapGlobals).Modify(model.Namespace,model.Name,.properties)
}

}