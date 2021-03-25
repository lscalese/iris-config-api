Include Api.Config.inc

Class Api.Config.Services.SQL [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

ClassMethod Get() As %Library.DynamicObject
{
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.SQL).Get(.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("ANSIPrecedence") = pObj.ANSIPrecedence
	Set properties("AllowRowIDUpdate") = pObj.AllowRowIDUpdate
	Set properties("AutoParallel") = pObj.AutoParallel
	Set properties("AutoParallelThreshold") = pObj.AutoParallelThreshold
	Set properties("BiasQueriesAsOutlier") = pObj.BiasQueriesAsOutlier
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("Comment") = pObj.Comment
	Set properties("Comments") = pObj.Comments
	Set properties("DBMSSecurity") = pObj.DBMSSecurity
	Set properties("DDLDefineBitmapExtent") = pObj.DDLDefineBitmapExtent
	Set properties("DDLFinal") = pObj.DDLFinal
	Set properties("DDLNo201") = pObj.DDLNo201
	Set properties("DDLNo30") = pObj.DDLNo30
	Set properties("DDLNo307") = pObj.DDLNo307
	Set properties("DDLNo311") = pObj.DDLNo311
	Set properties("DDLNo315") = pObj.DDLNo315
	Set properties("DDLNo324") = pObj.DDLNo324
	Set properties("DDLNo333") = pObj.DDLNo333
	Set properties("DDLSQLOnlyCompile") = pObj.DDLSQLOnlyCompile
	Set properties("DDLUseExtentSet") = pObj.DDLUseExtentSet
	Set properties("DDLUseSequence") = pObj.DDLUseSequence
	Set properties("DefaultSchema") = pObj.DefaultSchema
	Set properties("DelimitedIds") = pObj.DelimitedIds
	Set properties("DropDelete") = pObj.DropDelete
	Set properties("ECPSync") = pObj.ECPSync
	Set properties("ExtrinsicFunctions") = pObj.ExtrinsicFunctions
	Set properties("FastDistinct") = pObj.FastDistinct
	Set properties("Flags") = pObj.Flags
	Set properties("IdKey") = pObj.IdKey
	Set properties("IdTrxFrom") = pObj.IdTrxFrom
	Set properties("IdTrxTo") = pObj.IdTrxTo
	Set properties("JDBCGatewayJVMArgs") = pObj.JDBCGatewayJVMArgs
	Set properties("JDBCGatewayLog") = pObj.JDBCGatewayLog
	Set properties("JDBCGatewayPort") = pObj.JDBCGatewayPort
	Set properties("JDBCGatewayUsePassphrase") = pObj.JDBCGatewayUsePassphrase
	Set properties("JavaClassPath") = pObj.JavaClassPath
	Set properties("JavaHome") = pObj.JavaHome
	Set properties("LockThreshold") = pObj.LockThreshold
	Set properties("LockTimeout") = pObj.LockTimeout
	Set properties("Name") = pObj.Name
	Set properties("ODBCVarcharMaxlen") = pObj.ODBCVarcharMaxlen
	Set properties("QueryProcedures") = pObj.QueryProcedures
	Set properties("RTPC") = pObj.RTPC
	Set properties("ReferentialChecks") = pObj.ReferentialChecks
	Set properties("SaveMAC") = pObj.SaveMAC
	Set properties("TCPKeepAlive") = pObj.TCPKeepAlive
	Set properties("TODATEDefaultFormat") = pObj.TODATEDefaultFormat
	Set properties("TimePrecision") = pObj.TimePrecision
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"ANSIPrecedence") properties("ANSIPrecedence") = model.ANSIPrecedence
	Set:$$$CanSetProperty(model,"AllowRowIDUpdate") properties("AllowRowIDUpdate") = model.AllowRowIDUpdate
	Set:$$$CanSetProperty(model,"AutoParallel") properties("AutoParallel") = model.AutoParallel
	Set:$$$CanSetProperty(model,"AutoParallelThreshold") properties("AutoParallelThreshold") = model.AutoParallelThreshold
	Set:$$$CanSetProperty(model,"BiasQueriesAsOutlier") properties("BiasQueriesAsOutlier") = model.BiasQueriesAsOutlier
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comment") properties("Comment") = model.Comment
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"DBMSSecurity") properties("DBMSSecurity") = model.DBMSSecurity
	Set:$$$CanSetProperty(model,"DDLDefineBitmapExtent") properties("DDLDefineBitmapExtent") = model.DDLDefineBitmapExtent
	Set:$$$CanSetProperty(model,"DDLFinal") properties("DDLFinal") = model.DDLFinal
	Set:$$$CanSetProperty(model,"DDLNo201") properties("DDLNo201") = model.DDLNo201
	Set:$$$CanSetProperty(model,"DDLNo30") properties("DDLNo30") = model.DDLNo30
	Set:$$$CanSetProperty(model,"DDLNo307") properties("DDLNo307") = model.DDLNo307
	Set:$$$CanSetProperty(model,"DDLNo311") properties("DDLNo311") = model.DDLNo311
	Set:$$$CanSetProperty(model,"DDLNo315") properties("DDLNo315") = model.DDLNo315
	Set:$$$CanSetProperty(model,"DDLNo324") properties("DDLNo324") = model.DDLNo324
	Set:$$$CanSetProperty(model,"DDLNo333") properties("DDLNo333") = model.DDLNo333
	Set:$$$CanSetProperty(model,"DDLSQLOnlyCompile") properties("DDLSQLOnlyCompile") = model.DDLSQLOnlyCompile
	Set:$$$CanSetProperty(model,"DDLUseExtentSet") properties("DDLUseExtentSet") = model.DDLUseExtentSet
	Set:$$$CanSetProperty(model,"DDLUseSequence") properties("DDLUseSequence") = model.DDLUseSequence
	Set:$$$CanSetProperty(model,"DefaultSchema") properties("DefaultSchema") = model.DefaultSchema
	Set:$$$CanSetProperty(model,"DelimitedIds") properties("DelimitedIds") = model.DelimitedIds
	Set:$$$CanSetProperty(model,"DropDelete") properties("DropDelete") = model.DropDelete
	Set:$$$CanSetProperty(model,"ECPSync") properties("ECPSync") = model.ECPSync
	Set:$$$CanSetProperty(model,"ExtrinsicFunctions") properties("ExtrinsicFunctions") = model.ExtrinsicFunctions
	Set:$$$CanSetProperty(model,"FastDistinct") properties("FastDistinct") = model.FastDistinct
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"IdKey") properties("IdKey") = model.IdKey
	Set:$$$CanSetProperty(model,"IdTrxFrom") properties("IdTrxFrom") = model.IdTrxFrom
	Set:$$$CanSetProperty(model,"IdTrxTo") properties("IdTrxTo") = model.IdTrxTo
	Set:$$$CanSetProperty(model,"JDBCGatewayJVMArgs") properties("JDBCGatewayJVMArgs") = model.JDBCGatewayJVMArgs
	Set:$$$CanSetProperty(model,"JDBCGatewayLog") properties("JDBCGatewayLog") = model.JDBCGatewayLog
	Set:$$$CanSetProperty(model,"JDBCGatewayPort") properties("JDBCGatewayPort") = model.JDBCGatewayPort
	Set:$$$CanSetProperty(model,"JDBCGatewayUsePassphrase") properties("JDBCGatewayUsePassphrase") = model.JDBCGatewayUsePassphrase
	Set:$$$CanSetProperty(model,"JavaClassPath") properties("JavaClassPath") = model.JavaClassPath
	Set:$$$CanSetProperty(model,"JavaHome") properties("JavaHome") = model.JavaHome
	Set:$$$CanSetProperty(model,"LockThreshold") properties("LockThreshold") = model.LockThreshold
	Set:$$$CanSetProperty(model,"LockTimeout") properties("LockTimeout") = model.LockTimeout
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"ODBCVarcharMaxlen") properties("ODBCVarcharMaxlen") = model.ODBCVarcharMaxlen
	Set:$$$CanSetProperty(model,"QueryProcedures") properties("QueryProcedures") = model.QueryProcedures
	Set:$$$CanSetProperty(model,"RTPC") properties("RTPC") = model.RTPC
	Set:$$$CanSetProperty(model,"ReferentialChecks") properties("ReferentialChecks") = model.ReferentialChecks
	Set:$$$CanSetProperty(model,"SaveMAC") properties("SaveMAC") = model.SaveMAC
	Set:$$$CanSetProperty(model,"TCPKeepAlive") properties("TCPKeepAlive") = model.TCPKeepAlive
	Set:$$$CanSetProperty(model,"TODATEDefaultFormat") properties("TODATEDefaultFormat") = model.TODATEDefaultFormat
	Set:$$$CanSetProperty(model,"TimePrecision") properties("TimePrecision") = model.TimePrecision
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("ANSIPrecedence")) model.%Set("ANSIPrecedence", properties("ANSIPrecedence"), "boolean")
	Do:$Data(properties("AllowRowIDUpdate")) model.%Set("AllowRowIDUpdate", properties("AllowRowIDUpdate"), "boolean")
	Do:$Data(properties("AutoParallel")) model.%Set("AutoParallel", properties("AutoParallel"), "boolean")
	Do:$Data(properties("AutoParallelThreshold")) model.%Set("AutoParallelThreshold", properties("AutoParallelThreshold"), "number")
	Do:$Data(properties("BiasQueriesAsOutlier")) model.%Set("BiasQueriesAsOutlier", properties("BiasQueriesAsOutlier"), "boolean")
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comment")) model.%Set("Comment", properties("Comment"), "boolean")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("DBMSSecurity")) model.%Set("DBMSSecurity", properties("DBMSSecurity"), "boolean")
	Do:$Data(properties("DDLDefineBitmapExtent")) model.%Set("DDLDefineBitmapExtent", properties("DDLDefineBitmapExtent"), "boolean")
	Do:$Data(properties("DDLFinal")) model.%Set("DDLFinal", properties("DDLFinal"), "boolean")
	Do:$Data(properties("DDLNo201")) model.%Set("DDLNo201", properties("DDLNo201"), "boolean")
	Do:$Data(properties("DDLNo30")) model.%Set("DDLNo30", properties("DDLNo30"), "boolean")
	Do:$Data(properties("DDLNo307")) model.%Set("DDLNo307", properties("DDLNo307"), "boolean")
	Do:$Data(properties("DDLNo311")) model.%Set("DDLNo311", properties("DDLNo311"), "boolean")
	Do:$Data(properties("DDLNo315")) model.%Set("DDLNo315", properties("DDLNo315"), "boolean")
	Do:$Data(properties("DDLNo324")) model.%Set("DDLNo324", properties("DDLNo324"), "boolean")
	Do:$Data(properties("DDLNo333")) model.%Set("DDLNo333", properties("DDLNo333"), "boolean")
	Do:$Data(properties("DDLSQLOnlyCompile")) model.%Set("DDLSQLOnlyCompile", properties("DDLSQLOnlyCompile"), "boolean")
	Do:$Data(properties("DDLUseExtentSet")) model.%Set("DDLUseExtentSet", properties("DDLUseExtentSet"), "boolean")
	Do:$Data(properties("DDLUseSequence")) model.%Set("DDLUseSequence", properties("DDLUseSequence"), "boolean")
	Do:$Data(properties("DefaultSchema")) model.%Set("DefaultSchema", properties("DefaultSchema"), "string")
	Do:$Data(properties("DelimitedIds")) model.%Set("DelimitedIds", properties("DelimitedIds"), "boolean")
	Do:$Data(properties("DropDelete")) model.%Set("DropDelete", properties("DropDelete"), "boolean")
	Do:$Data(properties("ECPSync")) model.%Set("ECPSync", properties("ECPSync"), "boolean")
	Do:$Data(properties("ExtrinsicFunctions")) model.%Set("ExtrinsicFunctions", properties("ExtrinsicFunctions"), "boolean")
	Do:$Data(properties("FastDistinct")) model.%Set("FastDistinct", properties("FastDistinct"), "boolean")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("IdKey")) model.%Set("IdKey", properties("IdKey"), "boolean")
	Do:$Data(properties("IdTrxFrom")) model.%Set("IdTrxFrom", properties("IdTrxFrom"), "string")
	Do:$Data(properties("IdTrxTo")) model.%Set("IdTrxTo", properties("IdTrxTo"), "string")
	Do:$Data(properties("JDBCGatewayJVMArgs")) model.%Set("JDBCGatewayJVMArgs", properties("JDBCGatewayJVMArgs"), "string")
	Do:$Data(properties("JDBCGatewayLog")) model.%Set("JDBCGatewayLog", properties("JDBCGatewayLog"), "string")
	Do:$Data(properties("JDBCGatewayPort")) model.%Set("JDBCGatewayPort", properties("JDBCGatewayPort"), "number")
	Do:$Data(properties("JDBCGatewayUsePassphrase")) model.%Set("JDBCGatewayUsePassphrase", properties("JDBCGatewayUsePassphrase"), "boolean")
	Do:$Data(properties("JavaClassPath")) model.%Set("JavaClassPath", properties("JavaClassPath"), "string")
	Do:$Data(properties("JavaHome")) model.%Set("JavaHome", properties("JavaHome"), "string")
	Do:$Data(properties("LockThreshold")) model.%Set("LockThreshold", properties("LockThreshold"), "number")
	Do:$Data(properties("LockTimeout")) model.%Set("LockTimeout", properties("LockTimeout"), "number")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("ODBCVarcharMaxlen")) model.%Set("ODBCVarcharMaxlen", properties("ODBCVarcharMaxlen"), "number")
	Do:$Data(properties("QueryProcedures")) model.%Set("QueryProcedures", properties("QueryProcedures"), "boolean")
	Do:$Data(properties("RTPC")) model.%Set("RTPC", properties("RTPC"), "boolean")
	Do:$Data(properties("ReferentialChecks")) model.%Set("ReferentialChecks", properties("ReferentialChecks"), "boolean")
	Do:$Data(properties("SaveMAC")) model.%Set("SaveMAC", properties("SaveMAC"), "boolean")
	Do:$Data(properties("TCPKeepAlive")) model.%Set("TCPKeepAlive", properties("TCPKeepAlive"), "number")
	Do:$Data(properties("TODATEDefaultFormat")) model.%Set("TODATEDefaultFormat", properties("TODATEDefaultFormat"), "string")
	Do:$Data(properties("TimePrecision")) model.%Set("TimePrecision", properties("TimePrecision"), "number")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.SQL).Modify(.properties)
}

}
