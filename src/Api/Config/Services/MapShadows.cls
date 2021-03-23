Include Api.Config.inc

Class Api.Config.Services.MapShadows [ ProcedureBlock ]
{

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
	Quit ..ToDynamic(.properties)
}

ClassMethod List(ID As %String, Names As %String = "*", CPFFile As %String = "", Flags As %Integer = 0, Format As %Integer = 0) As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Config.MapShadows:List")
		Do rs.Execute(ID,Names,CPFFile,Flags,Format)
		While rs.Next() {
			Do list.%Push(..Get())
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
	Set properties("Directory") = pObj.Directory
	Set properties("Flags") = pObj.Flags
	Set properties("ID") = pObj.ID
	Set properties("Name") = pObj.Name
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"Directory") properties("Directory") = model.Directory
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"ID") properties("ID") = model.ID
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("Directory")) model.%Set("Directory", properties("Directory"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("ID")) model.%Set("ID", properties("ID"), "string")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.MapShadows).Modify(model.ID,model.Name,.properties)
}

}
