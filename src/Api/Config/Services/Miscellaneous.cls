Include Api.Config.inc

Class Api.Config.Services.Miscellaneous [ ProcedureBlock ]
{

Parameter ISSINGLE = 1;

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

ClassMethod Get() As %Library.DynamicObject
{
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.Miscellaneous).Get(.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("AsyncDisconnectErr") = pObj.AsyncDisconnectErr
	Set properties("AsynchError") = pObj.AsynchError
	Set properties("BreakMode") = pObj.BreakMode
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("CollectResourceStats") = pObj.CollectResourceStats
	Set properties("Comments") = pObj.Comments
	Set properties("DX") = pObj.DX
	Set properties("DisconnectErr") = pObj.DisconnectErr
	Set properties("FileMode") = pObj.FileMode
	Set properties("Flags") = pObj.Flags
	Set properties("GlobalKillEnabled") = pObj.GlobalKillEnabled
	Set properties("IEEEError") = pObj.IEEEError
	Set properties("LineRecall") = pObj.LineRecall
	Set properties("ListFormat") = pObj.ListFormat
	Set properties("LogRollback") = pObj.LogRollback
	Set properties("MVDefined") = pObj.MVDefined
	Set properties("Name") = pObj.Name
	Set properties("NodeNameInPid") = pObj.NodeNameInPid
	Set properties("NullSubscripts") = pObj.NullSubscripts
	Set properties("OldZU5") = pObj.OldZU5
	Set properties("OpenMode") = pObj.OpenMode
	Set properties("PopError") = pObj.PopError
	Set properties("RefInKind") = pObj.RefInKind
	Set properties("ScientificNotation") = pObj.ScientificNotation
	Set properties("SetZEOF") = pObj.SetZEOF
	Set properties("ShutDownLogErrors") = pObj.ShutDownLogErrors
	Set properties("StopID") = pObj.StopID
	Set properties("SwitchOSdir") = pObj.SwitchOSdir
	Set properties("SynchCommit") = pObj.SynchCommit
	Set properties("TelnetNUL") = pObj.TelnetNUL
	Set properties("TruncateOverflow") = pObj.TruncateOverflow
	Set properties("Undefined") = pObj.Undefined
	Set properties("UseNagleAlgorithm") = pObj.UseNagleAlgorithm
	Set properties("ViewPastData") = pObj.ViewPastData
	Set properties("ZDateNull") = pObj.ZDateNull
	Set properties("ZaMode") = pObj.ZaMode
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"AsyncDisconnectErr") properties("AsyncDisconnectErr") = model.AsyncDisconnectErr
	Set:$$$CanSetProperty(model,"AsynchError") properties("AsynchError") = model.AsynchError
	Set:$$$CanSetProperty(model,"BreakMode") properties("BreakMode") = model.BreakMode
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"CollectResourceStats") properties("CollectResourceStats") = model.CollectResourceStats
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"DX") properties("DX") = model.DX
	Set:$$$CanSetProperty(model,"DisconnectErr") properties("DisconnectErr") = model.DisconnectErr
	Set:$$$CanSetProperty(model,"FileMode") properties("FileMode") = model.FileMode
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"GlobalKillEnabled") properties("GlobalKillEnabled") = model.GlobalKillEnabled
	Set:$$$CanSetProperty(model,"IEEEError") properties("IEEEError") = model.IEEEError
	Set:$$$CanSetProperty(model,"LineRecall") properties("LineRecall") = model.LineRecall
	Set:$$$CanSetProperty(model,"ListFormat") properties("ListFormat") = model.ListFormat
	Set:$$$CanSetProperty(model,"LogRollback") properties("LogRollback") = model.LogRollback
	Set:$$$CanSetProperty(model,"MVDefined") properties("MVDefined") = model.MVDefined
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"NodeNameInPid") properties("NodeNameInPid") = model.NodeNameInPid
	Set:$$$CanSetProperty(model,"NullSubscripts") properties("NullSubscripts") = model.NullSubscripts
	Set:$$$CanSetProperty(model,"OldZU5") properties("OldZU5") = model.OldZU5
	Set:$$$CanSetProperty(model,"OpenMode") properties("OpenMode") = model.OpenMode
	Set:$$$CanSetProperty(model,"PopError") properties("PopError") = model.PopError
	Set:$$$CanSetProperty(model,"RefInKind") properties("RefInKind") = model.RefInKind
	Set:$$$CanSetProperty(model,"ScientificNotation") properties("ScientificNotation") = model.ScientificNotation
	Set:$$$CanSetProperty(model,"SetZEOF") properties("SetZEOF") = model.SetZEOF
	Set:$$$CanSetProperty(model,"ShutDownLogErrors") properties("ShutDownLogErrors") = model.ShutDownLogErrors
	Set:$$$CanSetProperty(model,"StopID") properties("StopID") = model.StopID
	Set:$$$CanSetProperty(model,"SwitchOSdir") properties("SwitchOSdir") = model.SwitchOSdir
	Set:$$$CanSetProperty(model,"SynchCommit") properties("SynchCommit") = model.SynchCommit
	Set:$$$CanSetProperty(model,"TelnetNUL") properties("TelnetNUL") = model.TelnetNUL
	Set:$$$CanSetProperty(model,"TruncateOverflow") properties("TruncateOverflow") = model.TruncateOverflow
	Set:$$$CanSetProperty(model,"Undefined") properties("Undefined") = model.Undefined
	Set:$$$CanSetProperty(model,"UseNagleAlgorithm") properties("UseNagleAlgorithm") = model.UseNagleAlgorithm
	Set:$$$CanSetProperty(model,"ViewPastData") properties("ViewPastData") = model.ViewPastData
	Set:$$$CanSetProperty(model,"ZDateNull") properties("ZDateNull") = model.ZDateNull
	Set:$$$CanSetProperty(model,"ZaMode") properties("ZaMode") = model.ZaMode
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("AsyncDisconnectErr")) model.%Set("AsyncDisconnectErr", properties("AsyncDisconnectErr"), "boolean")
	Do:$Data(properties("AsynchError")) model.%Set("AsynchError", properties("AsynchError"), "boolean")
	Do:$Data(properties("BreakMode")) model.%Set("BreakMode", properties("BreakMode"), "boolean")
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("CollectResourceStats")) model.%Set("CollectResourceStats", properties("CollectResourceStats"), "boolean")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("DX")) model.%Set("DX", properties("DX"), "boolean")
	Do:$Data(properties("DisconnectErr")) model.%Set("DisconnectErr", properties("DisconnectErr"), "boolean")
	Do:$Data(properties("FileMode")) model.%Set("FileMode", properties("FileMode"), "boolean")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("GlobalKillEnabled")) model.%Set("GlobalKillEnabled", properties("GlobalKillEnabled"), "boolean")
	Do:$Data(properties("IEEEError")) model.%Set("IEEEError", properties("IEEEError"), "boolean")
	Do:$Data(properties("LineRecall")) model.%Set("LineRecall", properties("LineRecall"), "boolean")
	Do:$Data(properties("ListFormat")) model.%Set("ListFormat", properties("ListFormat"), "number")
	Do:$Data(properties("LogRollback")) model.%Set("LogRollback", properties("LogRollback"), "boolean")
	Do:$Data(properties("MVDefined")) model.%Set("MVDefined", properties("MVDefined"), "boolean")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("NodeNameInPid")) model.%Set("NodeNameInPid", properties("NodeNameInPid"), "boolean")
	Do:$Data(properties("NullSubscripts")) model.%Set("NullSubscripts", properties("NullSubscripts"), "boolean")
	Do:$Data(properties("OldZU5")) model.%Set("OldZU5", properties("OldZU5"), "boolean")
	Do:$Data(properties("OpenMode")) model.%Set("OpenMode", properties("OpenMode"), "number")
	Do:$Data(properties("PopError")) model.%Set("PopError", properties("PopError"), "boolean")
	Do:$Data(properties("RefInKind")) model.%Set("RefInKind", properties("RefInKind"), "boolean")
	Do:$Data(properties("ScientificNotation")) model.%Set("ScientificNotation", properties("ScientificNotation"), "boolean")
	Do:$Data(properties("SetZEOF")) model.%Set("SetZEOF", properties("SetZEOF"), "boolean")
	Do:$Data(properties("ShutDownLogErrors")) model.%Set("ShutDownLogErrors", properties("ShutDownLogErrors"), "boolean")
	Do:$Data(properties("StopID")) model.%Set("StopID", properties("StopID"), "boolean")
	Do:$Data(properties("SwitchOSdir")) model.%Set("SwitchOSdir", properties("SwitchOSdir"), "boolean")
	Do:$Data(properties("SynchCommit")) model.%Set("SynchCommit", properties("SynchCommit"), "boolean")
	Do:$Data(properties("TelnetNUL")) model.%Set("TelnetNUL", properties("TelnetNUL"), "boolean")
	Do:$Data(properties("TruncateOverflow")) model.%Set("TruncateOverflow", properties("TruncateOverflow"), "boolean")
	Do:$Data(properties("Undefined")) model.%Set("Undefined", properties("Undefined"), "number")
	Do:$Data(properties("UseNagleAlgorithm")) model.%Set("UseNagleAlgorithm", properties("UseNagleAlgorithm"), "boolean")
	Do:$Data(properties("ViewPastData")) model.%Set("ViewPastData", properties("ViewPastData"), "boolean")
	Do:$Data(properties("ZDateNull")) model.%Set("ZDateNull", properties("ZDateNull"), "boolean")
	Do:$Data(properties("ZaMode")) model.%Set("ZaMode", properties("ZaMode"), "boolean")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Miscellaneous).Modify(.properties)
}

}
