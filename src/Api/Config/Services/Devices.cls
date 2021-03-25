Include Api.Config.inc

Class Api.Config.Services.Devices [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Set:model.PhysicalDevice="" sc = $$$ADDSC(sc,$$$ERROR(5001, "PhysicalDevice property is mandatory."))
	Set:model.SubType="" sc = $$$ADDSC(sc,$$$ERROR(5001, "SubType property is mandatory."))
	Set:model.Type="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Type property is mandatory."))
	Quit sc
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Devices).Create(model.Name,.properties)
}

ClassMethod Delete(Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Config.Devices).Delete(Name)
}

ClassMethod Exists(Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Config.Devices).Exists(Name)
}

ClassMethod Get(Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.Devices).Get(Name,.properties))
	Set properties("Name") = Name
	Quit ..ToDynamic(.properties)
}

ClassMethod List(Names As %String = "*", CPFFile As %String = "", Flags As %Integer = 0, Format As %Integer = 0) As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Config.Devices:List")
		Do rs.Execute(Names, CPFFile,Flags,Format)
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
	Set properties("Alias") = pObj.Alias
	Set properties("AlternateDevice") = pObj.AlternateDevice
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("Comments") = pObj.Comments
	Set properties("Description") = pObj.Description
	Set properties("Flags") = pObj.Flags
	Set properties("Name") = pObj.Name
	Set properties("OpenParameters") = pObj.OpenParameters
	Set properties("PhysicalDevice") = pObj.PhysicalDevice
	Set properties("Prompt") = pObj.Prompt
	Set properties("SubType") = pObj.SubType
	Set properties("Type") = pObj.Type
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"Alias") properties("Alias") = model.Alias
	Set:$$$CanSetProperty(model,"AlternateDevice") properties("AlternateDevice") = model.AlternateDevice
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"Description") properties("Description") = model.Description
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"OpenParameters") properties("OpenParameters") = model.OpenParameters
	Set:$$$CanSetProperty(model,"PhysicalDevice") properties("PhysicalDevice") = model.PhysicalDevice
	Set:$$$CanSetProperty(model,"Prompt") properties("Prompt") = model.Prompt
	Set:$$$CanSetProperty(model,"SubType") properties("SubType") = model.SubType
	Set:$$$CanSetProperty(model,"Type") properties("Type") = model.Type
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("Alias")) model.%Set("Alias", properties("Alias"), "number")
	Do:$Data(properties("AlternateDevice")) model.%Set("AlternateDevice", properties("AlternateDevice"), "string")
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("Description")) model.%Set("Description", properties("Description"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("OpenParameters")) model.%Set("OpenParameters", properties("OpenParameters"), "string")
	Do:$Data(properties("PhysicalDevice")) model.%Set("PhysicalDevice", properties("PhysicalDevice"), "string")
	Do:$Data(properties("Prompt")) model.%Set("Prompt", properties("Prompt"), "number")
	Do:$Data(properties("SubType")) model.%Set("SubType", properties("SubType"), "string")
	Do:$Data(properties("Type")) model.%Set("Type", properties("Type"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Devices).Modify(model.Name,.properties)
}

}
