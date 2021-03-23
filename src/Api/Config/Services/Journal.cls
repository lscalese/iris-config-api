Include Api.Config.inc

Class Api.Config.Services.Journal [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

ClassMethod Get() As %Library.DynamicObject
{
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.Journal).Get(.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("AlternateDirectory") = pObj.AlternateDirectory
	Set properties("BackupsBeforePurge") = pObj.BackupsBeforePurge
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("Comments") = pObj.Comments
	Set properties("CurrentDirectory") = pObj.CurrentDirectory
	Set properties("DaysBeforePurge") = pObj.DaysBeforePurge
	Set properties("FileSizeLimit") = pObj.FileSizeLimit
	Set properties("Flags") = pObj.Flags
	Set properties("FreezeOnError") = pObj.FreezeOnError
	Set properties("JournalFilePrefix") = pObj.JournalFilePrefix
	Set properties("JournalcspSession") = pObj.JournalcspSession
	Set properties("Name") = pObj.Name
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"AlternateDirectory") properties("AlternateDirectory") = model.AlternateDirectory
	Set:$$$CanSetProperty(model,"BackupsBeforePurge") properties("BackupsBeforePurge") = model.BackupsBeforePurge
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"CurrentDirectory") properties("CurrentDirectory") = model.CurrentDirectory
	Set:$$$CanSetProperty(model,"DaysBeforePurge") properties("DaysBeforePurge") = model.DaysBeforePurge
	Set:$$$CanSetProperty(model,"FileSizeLimit") properties("FileSizeLimit") = model.FileSizeLimit
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"FreezeOnError") properties("FreezeOnError") = model.FreezeOnError
	Set:$$$CanSetProperty(model,"JournalFilePrefix") properties("JournalFilePrefix") = model.JournalFilePrefix
	Set:$$$CanSetProperty(model,"JournalcspSession") properties("JournalcspSession") = model.JournalcspSession
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("AlternateDirectory")) model.%Set("AlternateDirectory", properties("AlternateDirectory"), "string")
	Do:$Data(properties("BackupsBeforePurge")) model.%Set("BackupsBeforePurge", properties("BackupsBeforePurge"), "number")
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("CurrentDirectory")) model.%Set("CurrentDirectory", properties("CurrentDirectory"), "string")
	Do:$Data(properties("DaysBeforePurge")) model.%Set("DaysBeforePurge", properties("DaysBeforePurge"), "number")
	Do:$Data(properties("FileSizeLimit")) model.%Set("FileSizeLimit", properties("FileSizeLimit"), "number")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("FreezeOnError")) model.%Set("FreezeOnError", properties("FreezeOnError"), "boolean")
	Do:$Data(properties("JournalFilePrefix")) model.%Set("JournalFilePrefix", properties("JournalFilePrefix"), "string")
	Do:$Data(properties("JournalcspSession")) model.%Set("JournalcspSession", properties("JournalcspSession"), "boolean")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Journal).Modify(.properties)
}

}
