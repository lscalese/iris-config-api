Include Api.Config.inc

Class Api.Config.Services.Shadows [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Address="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Address property is mandatory."))
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Shadows).Create(model.Name,.properties)
}

ClassMethod Delete(Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Config.Shadows).Delete(Name)
}

ClassMethod Exists(Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Config.Shadows).Exists(Name)
}

ClassMethod Get(Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.Shadows).Get(Name,.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod List(Names As %String = "*", CPFFile As %String = "", Flags As %Integer = 0, Format As %Integer = 0) As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Config.Shadows:List")
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
	Set properties("Address") = pObj.Address
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("Comments") = pObj.Comments
	Set properties("DaysBeforePurge") = pObj.DaysBeforePurge
	Set properties("DisableJournalUpdates") = pObj.DisableJournalUpdates
	Set properties("Enabled") = pObj.Enabled
	Set properties("FilterRoutine") = pObj.FilterRoutine
	Set properties("Flags") = pObj.Flags
	Set properties("JournalDirectory") = pObj.JournalDirectory
	Set properties("MaxErrors") = pObj.MaxErrors
	Set properties("Name") = pObj.Name
	Set properties("SSLConfig") = pObj.SSLConfig
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"Address") properties("Address") = model.Address
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"DaysBeforePurge") properties("DaysBeforePurge") = model.DaysBeforePurge
	Set:$$$CanSetProperty(model,"DisableJournalUpdates") properties("DisableJournalUpdates") = model.DisableJournalUpdates
	Set:$$$CanSetProperty(model,"Enabled") properties("Enabled") = model.Enabled
	Set:$$$CanSetProperty(model,"FilterRoutine") properties("FilterRoutine") = model.FilterRoutine
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"JournalDirectory") properties("JournalDirectory") = model.JournalDirectory
	Set:$$$CanSetProperty(model,"MaxErrors") properties("MaxErrors") = model.MaxErrors
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"SSLConfig") properties("SSLConfig") = model.SSLConfig
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("Address")) model.%Set("Address", properties("Address"), "string")
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("DaysBeforePurge")) model.%Set("DaysBeforePurge", properties("DaysBeforePurge"), "number")
	Do:$Data(properties("DisableJournalUpdates")) model.%Set("DisableJournalUpdates", properties("DisableJournalUpdates"), "boolean")
	Do:$Data(properties("Enabled")) model.%Set("Enabled", properties("Enabled"), "boolean")
	Do:$Data(properties("FilterRoutine")) model.%Set("FilterRoutine", properties("FilterRoutine"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("JournalDirectory")) model.%Set("JournalDirectory", properties("JournalDirectory"), "string")
	Do:$Data(properties("MaxErrors")) model.%Set("MaxErrors", properties("MaxErrors"), "number")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("SSLConfig")) model.%Set("SSLConfig", properties("SSLConfig"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Shadows).Modify(model.Name,.properties)
}

}
