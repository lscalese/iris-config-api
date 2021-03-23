Include Api.Config.inc

Class Api.Config.Services.Startup [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

ClassMethod Get() As %Library.DynamicObject
{
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.Startup).Get(.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("ArbiterURL") = pObj.ArbiterURL
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("CallinHalt") = pObj.CallinHalt
	Set properties("CallinStart") = pObj.CallinStart
	Set properties("CliSysName") = pObj.CliSysName
	Set properties("Comments") = pObj.Comments
	Set properties("DBSizesAllowed") = pObj.DBSizesAllowed
	Set properties("DefaultPort") = pObj.DefaultPort
	Set properties("DefaultPortBindAddress") = pObj.DefaultPortBindAddress
	Set properties("EnableVSSBackup") = pObj.EnableVSSBackup
	Set properties("EnsembleAutoStart") = pObj.EnsembleAutoStart
	Set properties("ErrorPurge") = pObj.ErrorPurge
	Set properties("FIPSMode") = pObj.FIPSMode
	Set properties("Flags") = pObj.Flags
	Set properties("IPv6") = pObj.IPv6
	Set properties("JobHalt") = pObj.JobHalt
	Set properties("JobServers") = pObj.JobServers
	Set properties("JobStart") = pObj.JobStart
	Set properties("LicenseID") = pObj.LicenseID
	Set properties("MaxConsoleLogSize") = pObj.MaxConsoleLogSize
	Set properties("MaxIRISTempSizeAtStart") = pObj.MaxIRISTempSizeAtStart
	Set properties("MirrorMember") = pObj.MirrorMember
	Set properties("MirrorPrimary") = pObj.MirrorPrimary
	Set properties("MirrorSetName") = pObj.MirrorSetName
	Set properties("Name") = pObj.Name
	Set properties("PasswordHash") = pObj.PasswordHash
	Set properties("ProcessHalt") = pObj.ProcessHalt
	Set properties("ProcessStart") = pObj.ProcessStart
	Set properties("ShardClusterURL") = pObj.ShardClusterURL
	Set properties("ShardMasterRegexp") = pObj.ShardMasterRegexp
	Set properties("ShardMirrorMember") = pObj.ShardMirrorMember
	Set properties("ShardRegexp") = pObj.ShardRegexp
	Set properties("ShardRole") = pObj.ShardRole
	Set properties("ShutdownTimeout") = pObj.ShutdownTimeout
	Set properties("SystemHalt") = pObj.SystemHalt
	Set properties("SystemMode") = pObj.SystemMode
	Set properties("SystemStart") = pObj.SystemStart
	Set properties("TempDirectory") = pObj.TempDirectory
	Set properties("TerminalPrompt") = pObj.TerminalPrompt
	Set properties("WebServer") = pObj.WebServer
	Set properties("WebServerName") = pObj.WebServerName
	Set properties("WebServerPort") = pObj.WebServerPort
	Set properties("WebServerURLPrefix") = pObj.WebServerURLPrefix
	Set properties("ZSTU") = pObj.ZSTU
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"ArbiterURL") properties("ArbiterURL") = model.ArbiterURL
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"CallinHalt") properties("CallinHalt") = model.CallinHalt
	Set:$$$CanSetProperty(model,"CallinStart") properties("CallinStart") = model.CallinStart
	Set:$$$CanSetProperty(model,"CliSysName") properties("CliSysName") = model.CliSysName
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"DBSizesAllowed") properties("DBSizesAllowed") = model.DBSizesAllowed
	Set:$$$CanSetProperty(model,"DefaultPort") properties("DefaultPort") = model.DefaultPort
	Set:$$$CanSetProperty(model,"DefaultPortBindAddress") properties("DefaultPortBindAddress") = model.DefaultPortBindAddress
	Set:$$$CanSetProperty(model,"EnableVSSBackup") properties("EnableVSSBackup") = model.EnableVSSBackup
	Set:$$$CanSetProperty(model,"EnsembleAutoStart") properties("EnsembleAutoStart") = model.EnsembleAutoStart
	Set:$$$CanSetProperty(model,"ErrorPurge") properties("ErrorPurge") = model.ErrorPurge
	Set:$$$CanSetProperty(model,"FIPSMode") properties("FIPSMode") = model.FIPSMode
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"IPv6") properties("IPv6") = model.IPv6
	Set:$$$CanSetProperty(model,"JobHalt") properties("JobHalt") = model.JobHalt
	Set:$$$CanSetProperty(model,"JobServers") properties("JobServers") = model.JobServers
	Set:$$$CanSetProperty(model,"JobStart") properties("JobStart") = model.JobStart
	Set:$$$CanSetProperty(model,"LicenseID") properties("LicenseID") = model.LicenseID
	Set:$$$CanSetProperty(model,"MaxConsoleLogSize") properties("MaxConsoleLogSize") = model.MaxConsoleLogSize
	Set:$$$CanSetProperty(model,"MaxIRISTempSizeAtStart") properties("MaxIRISTempSizeAtStart") = model.MaxIRISTempSizeAtStart
	Set:$$$CanSetProperty(model,"MirrorMember") properties("MirrorMember") = model.MirrorMember
	Set:$$$CanSetProperty(model,"MirrorPrimary") properties("MirrorPrimary") = model.MirrorPrimary
	Set:$$$CanSetProperty(model,"MirrorSetName") properties("MirrorSetName") = model.MirrorSetName
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"PasswordHash") properties("PasswordHash") = model.PasswordHash
	Set:$$$CanSetProperty(model,"ProcessHalt") properties("ProcessHalt") = model.ProcessHalt
	Set:$$$CanSetProperty(model,"ProcessStart") properties("ProcessStart") = model.ProcessStart
	Set:$$$CanSetProperty(model,"ShardClusterURL") properties("ShardClusterURL") = model.ShardClusterURL
	Set:$$$CanSetProperty(model,"ShardMasterRegexp") properties("ShardMasterRegexp") = model.ShardMasterRegexp
	Set:$$$CanSetProperty(model,"ShardMirrorMember") properties("ShardMirrorMember") = model.ShardMirrorMember
	Set:$$$CanSetProperty(model,"ShardRegexp") properties("ShardRegexp") = model.ShardRegexp
	Set:$$$CanSetProperty(model,"ShardRole") properties("ShardRole") = model.ShardRole
	Set:$$$CanSetProperty(model,"ShutdownTimeout") properties("ShutdownTimeout") = model.ShutdownTimeout
	Set:$$$CanSetProperty(model,"SystemHalt") properties("SystemHalt") = model.SystemHalt
	Set:$$$CanSetProperty(model,"SystemMode") properties("SystemMode") = model.SystemMode
	Set:$$$CanSetProperty(model,"SystemStart") properties("SystemStart") = model.SystemStart
	Set:$$$CanSetProperty(model,"TempDirectory") properties("TempDirectory") = model.TempDirectory
	Set:$$$CanSetProperty(model,"TerminalPrompt") properties("TerminalPrompt") = model.TerminalPrompt
	Set:$$$CanSetProperty(model,"WebServer") properties("WebServer") = model.WebServer
	Set:$$$CanSetProperty(model,"WebServerName") properties("WebServerName") = model.WebServerName
	Set:$$$CanSetProperty(model,"WebServerPort") properties("WebServerPort") = model.WebServerPort
	Set:$$$CanSetProperty(model,"WebServerURLPrefix") properties("WebServerURLPrefix") = model.WebServerURLPrefix
	Set:$$$CanSetProperty(model,"ZSTU") properties("ZSTU") = model.ZSTU
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("ArbiterURL")) model.%Set("ArbiterURL", properties("ArbiterURL"), "string")
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("CallinHalt")) model.%Set("CallinHalt", properties("CallinHalt"), "boolean")
	Do:$Data(properties("CallinStart")) model.%Set("CallinStart", properties("CallinStart"), "boolean")
	Do:$Data(properties("CliSysName")) model.%Set("CliSysName", properties("CliSysName"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("DBSizesAllowed")) model.%Set("DBSizesAllowed", properties("DBSizesAllowed"), "string")
	Do:$Data(properties("DefaultPort")) model.%Set("DefaultPort", properties("DefaultPort"), "number")
	Do:$Data(properties("DefaultPortBindAddress")) model.%Set("DefaultPortBindAddress", properties("DefaultPortBindAddress"), "string")
	Do:$Data(properties("EnableVSSBackup")) model.%Set("EnableVSSBackup", properties("EnableVSSBackup"), "boolean")
	Do:$Data(properties("EnsembleAutoStart")) model.%Set("EnsembleAutoStart", properties("EnsembleAutoStart"), "boolean")
	Do:$Data(properties("ErrorPurge")) model.%Set("ErrorPurge", properties("ErrorPurge"), "number")
	Do:$Data(properties("FIPSMode")) model.%Set("FIPSMode", properties("FIPSMode"), "boolean")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("IPv6")) model.%Set("IPv6", properties("IPv6"), "boolean")
	Do:$Data(properties("JobHalt")) model.%Set("JobHalt", properties("JobHalt"), "boolean")
	Do:$Data(properties("JobServers")) model.%Set("JobServers", properties("JobServers"), "number")
	Do:$Data(properties("JobStart")) model.%Set("JobStart", properties("JobStart"), "boolean")
	Do:$Data(properties("LicenseID")) model.%Set("LicenseID", properties("LicenseID"), "string")
	Do:$Data(properties("MaxConsoleLogSize")) model.%Set("MaxConsoleLogSize", properties("MaxConsoleLogSize"), "number")
	Do:$Data(properties("MaxIRISTempSizeAtStart")) model.%Set("MaxIRISTempSizeAtStart", properties("MaxIRISTempSizeAtStart"), "number")
	Do:$Data(properties("MirrorMember")) model.%Set("MirrorMember", properties("MirrorMember"), "string")
	Do:$Data(properties("MirrorPrimary")) model.%Set("MirrorPrimary", properties("MirrorPrimary"), "string")
	Do:$Data(properties("MirrorSetName")) model.%Set("MirrorSetName", properties("MirrorSetName"), "string")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("PasswordHash")) model.%Set("PasswordHash", properties("PasswordHash"), "string")
	Do:$Data(properties("ProcessHalt")) model.%Set("ProcessHalt", properties("ProcessHalt"), "boolean")
	Do:$Data(properties("ProcessStart")) model.%Set("ProcessStart", properties("ProcessStart"), "boolean")
	Do:$Data(properties("ShardClusterURL")) model.%Set("ShardClusterURL", properties("ShardClusterURL"), "string")
	Do:$Data(properties("ShardMasterRegexp")) model.%Set("ShardMasterRegexp", properties("ShardMasterRegexp"), "string")
	Do:$Data(properties("ShardMirrorMember")) model.%Set("ShardMirrorMember", properties("ShardMirrorMember"), "string")
	Do:$Data(properties("ShardRegexp")) model.%Set("ShardRegexp", properties("ShardRegexp"), "string")
	Do:$Data(properties("ShardRole")) model.%Set("ShardRole", properties("ShardRole"), "string")
	Do:$Data(properties("ShutdownTimeout")) model.%Set("ShutdownTimeout", properties("ShutdownTimeout"), "number")
	Do:$Data(properties("SystemHalt")) model.%Set("SystemHalt", properties("SystemHalt"), "boolean")
	Do:$Data(properties("SystemMode")) model.%Set("SystemMode", properties("SystemMode"), "string")
	Do:$Data(properties("SystemStart")) model.%Set("SystemStart", properties("SystemStart"), "boolean")
	Do:$Data(properties("TempDirectory")) model.%Set("TempDirectory", properties("TempDirectory"), "string")
	Do:$Data(properties("TerminalPrompt")) model.%Set("TerminalPrompt", properties("TerminalPrompt"), "string")
	Do:$Data(properties("WebServer")) model.%Set("WebServer", properties("WebServer"), "boolean")
	Do:$Data(properties("WebServerName")) model.%Set("WebServerName", properties("WebServerName"), "string")
	Do:$Data(properties("WebServerPort")) model.%Set("WebServerPort", properties("WebServerPort"), "number")
	Do:$Data(properties("WebServerURLPrefix")) model.%Set("WebServerURLPrefix", properties("WebServerURLPrefix"), "string")
	Do:$Data(properties("ZSTU")) model.%Set("ZSTU", properties("ZSTU"), "boolean")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Startup).Modify(.properties)
}

}
