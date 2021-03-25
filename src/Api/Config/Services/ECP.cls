Include Api.Config.inc

Class Api.Config.Services.ECP [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

ClassMethod Get() As %Library.DynamicObject
{
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.ECP).Get(.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("ClientReconnectDuration") = pObj.ClientReconnectDuration
	Set properties("ClientReconnectInterval") = pObj.ClientReconnectInterval
	Set properties("Comments") = pObj.Comments
	Set properties("Flags") = pObj.Flags
	Set properties("Name") = pObj.Name
	Set properties("ServerTroubleDuration") = pObj.ServerTroubleDuration
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"ClientReconnectDuration") properties("ClientReconnectDuration") = model.ClientReconnectDuration
	Set:$$$CanSetProperty(model,"ClientReconnectInterval") properties("ClientReconnectInterval") = model.ClientReconnectInterval
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"ServerTroubleDuration") properties("ServerTroubleDuration") = model.ServerTroubleDuration
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("ClientReconnectDuration")) model.%Set("ClientReconnectDuration", properties("ClientReconnectDuration"), "number")
	Do:$Data(properties("ClientReconnectInterval")) model.%Set("ClientReconnectInterval", properties("ClientReconnectInterval"), "number")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("ServerTroubleDuration")) model.%Set("ServerTroubleDuration", properties("ServerTroubleDuration"), "number")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.ECP).Modify(.properties)
}

}
