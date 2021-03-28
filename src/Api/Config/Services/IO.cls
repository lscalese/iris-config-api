Include Api.Config.inc

Class Api.Config.Services.IO [ ProcedureBlock ]
{

Parameter ISSINGLE = 1;

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

ClassMethod Get() As %Library.DynamicObject
{
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.IO).Get(.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("Comments") = pObj.Comments
	Set properties("File") = pObj.File
	Set properties("Flags") = pObj.Flags
	Set properties("MagTape") = pObj.MagTape
	Set properties("Name") = pObj.Name
	Set properties("Other") = pObj.Other
	Set properties("Terminal") = pObj.Terminal
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"File") properties("File") = model.File
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"MagTape") properties("MagTape") = model.MagTape
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"Other") properties("Other") = model.Other
	Set:$$$CanSetProperty(model,"Terminal") properties("Terminal") = model.Terminal
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("File")) model.%Set("File", properties("File"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("MagTape")) model.%Set("MagTape", properties("MagTape"), "string")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("Other")) model.%Set("Other", properties("Other"), "string")
	Do:$Data(properties("Terminal")) model.%Set("Terminal", properties("Terminal"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.IO).Modify(.properties)
}

}
