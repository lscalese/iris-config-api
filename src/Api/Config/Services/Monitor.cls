Include Api.Config.inc

Class Api.Config.Services.Monitor [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

ClassMethod Get() As %Library.DynamicObject
{
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.Monitor).Get(.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("Comments") = pObj.Comments
	Set properties("Flags") = pObj.Flags
	Set properties("Name") = pObj.Name
	Set properties("PatrolCollectionInterval") = pObj.PatrolCollectionInterval
	Set properties("PatrolDisplayMode") = pObj.PatrolDisplayMode
	Set properties("PatrolEnabled") = pObj.PatrolEnabled
	Set properties("PatrolTopProcesses") = pObj.PatrolTopProcesses
	Set properties("SNMPEnabled") = pObj.SNMPEnabled
	Set properties("WMIEnabled") = pObj.WMIEnabled
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"PatrolCollectionInterval") properties("PatrolCollectionInterval") = model.PatrolCollectionInterval
	Set:$$$CanSetProperty(model,"PatrolDisplayMode") properties("PatrolDisplayMode") = model.PatrolDisplayMode
	Set:$$$CanSetProperty(model,"PatrolEnabled") properties("PatrolEnabled") = model.PatrolEnabled
	Set:$$$CanSetProperty(model,"PatrolTopProcesses") properties("PatrolTopProcesses") = model.PatrolTopProcesses
	Set:$$$CanSetProperty(model,"SNMPEnabled") properties("SNMPEnabled") = model.SNMPEnabled
	Set:$$$CanSetProperty(model,"WMIEnabled") properties("WMIEnabled") = model.WMIEnabled
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("PatrolCollectionInterval")) model.%Set("PatrolCollectionInterval", properties("PatrolCollectionInterval"), "number")
	Do:$Data(properties("PatrolDisplayMode")) model.%Set("PatrolDisplayMode", properties("PatrolDisplayMode"), "number")
	Do:$Data(properties("PatrolEnabled")) model.%Set("PatrolEnabled", properties("PatrolEnabled"), "boolean")
	Do:$Data(properties("PatrolTopProcesses")) model.%Set("PatrolTopProcesses", properties("PatrolTopProcesses"), "number")
	Do:$Data(properties("SNMPEnabled")) model.%Set("SNMPEnabled", properties("SNMPEnabled"), "boolean")
	Do:$Data(properties("WMIEnabled")) model.%Set("WMIEnabled", properties("WMIEnabled"), "boolean")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Monitor).Modify(.properties)
}

}
