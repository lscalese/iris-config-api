Include Api.Config.inc

Class Api.Config.Services.Namespaces [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Globals="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Globals property is mandatory."))
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Set:model.Routines="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Routines property is mandatory."))
	Quit sc
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Namespaces).Create(model.Name,.properties)
}

ClassMethod Delete(Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Config.Namespaces).Delete(Name)
}

ClassMethod Exists(Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Config.Namespaces).Exists(Name)
}

ClassMethod Get(Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.Namespaces).Get(Name,.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod List(Names As %String = "*", CPFFile As %String = "", Flags As %Integer = 0, Format As %Integer = 0) As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Config.Namespaces:List")
		Do rs.Execute(Names,CPFFile,Flags,Format)
		While rs.Next() {
			Do list.%Push(..Get(rs.Data("Name")))
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
	Set properties("Comments") = pObj.Comments
	Set properties("Flags") = pObj.Flags
	Set properties("Globals") = pObj.Globals
	Set properties("Name") = pObj.Name
	Set properties("Routines") = pObj.Routines
	Set properties("TempGlobals") = pObj.TempGlobals
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"Globals") properties("Globals") = model.Globals
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"Routines") properties("Routines") = model.Routines
	Set:$$$CanSetProperty(model,"TempGlobals") properties("TempGlobals") = model.TempGlobals
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("Globals")) model.%Set("Globals", properties("Globals"), "string")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("Routines")) model.%Set("Routines", properties("Routines"), "string")
	Do:$Data(properties("TempGlobals")) model.%Set("TempGlobals", properties("TempGlobals"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Namespaces).Modify(model.Name,.properties)
}

}
