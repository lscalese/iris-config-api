Include Api.Config.inc

Class Api.Config.Services.Mirrors [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.GUID="" sc = $$$ADDSC(sc,$$$ERROR(5001, "GUID property is mandatory."))
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Mirrors).Create(model.Name,.properties)
}

ClassMethod Delete(Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Config.Mirrors).Delete(Name)
}

ClassMethod Exists(Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Config.Mirrors).Exists(Name)
}

ClassMethod Get(Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.Mirrors).Get(Name,.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod List(Names As %String = "*", CPFFile As %String = "", Flags As %Integer = 0, Format As %Integer = 0) As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Config.Mirrors:List")
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
	Set properties("AllowParallelDejournaling") = pObj.AllowParallelDejournaling
	Set properties("ArbiterNode") = pObj.ArbiterNode
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("Comments") = pObj.Comments
	Set properties("CompressionForAsyncMembers") = pObj.CompressionForAsyncMembers
	Set properties("CompressionForFailoverMembers") = pObj.CompressionForFailoverMembers
	Set properties("CompressionTypeForAsyncMembers") = pObj.CompressionTypeForAsyncMembers
	Set properties("CompressionTypeForFailoverMembers") = pObj.CompressionTypeForFailoverMembers
	Set properties("DefinedPrimary") = pObj.DefinedPrimary
	Set properties("Flags") = pObj.Flags
	Set properties("GUID") = pObj.GUID
	Set properties("Name") = pObj.Name
	Set properties("QOSTimeout") = pObj.QOSTimeout
	Set properties("UseSSL") = pObj.UseSSL
	Set properties("VirtualAddress") = pObj.VirtualAddress
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"AllowParallelDejournaling") properties("AllowParallelDejournaling") = model.AllowParallelDejournaling
	Set:$$$CanSetProperty(model,"ArbiterNode") properties("ArbiterNode") = model.ArbiterNode
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"CompressionForAsyncMembers") properties("CompressionForAsyncMembers") = model.CompressionForAsyncMembers
	Set:$$$CanSetProperty(model,"CompressionForFailoverMembers") properties("CompressionForFailoverMembers") = model.CompressionForFailoverMembers
	Set:$$$CanSetProperty(model,"CompressionTypeForAsyncMembers") properties("CompressionTypeForAsyncMembers") = model.CompressionTypeForAsyncMembers
	Set:$$$CanSetProperty(model,"CompressionTypeForFailoverMembers") properties("CompressionTypeForFailoverMembers") = model.CompressionTypeForFailoverMembers
	Set:$$$CanSetProperty(model,"DefinedPrimary") properties("DefinedPrimary") = model.DefinedPrimary
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"GUID") properties("GUID") = model.GUID
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"QOSTimeout") properties("QOSTimeout") = model.QOSTimeout
	Set:$$$CanSetProperty(model,"UseSSL") properties("UseSSL") = model.UseSSL
	Set:$$$CanSetProperty(model,"VirtualAddress") properties("VirtualAddress") = model.VirtualAddress
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("AllowParallelDejournaling")) model.%Set("AllowParallelDejournaling", properties("AllowParallelDejournaling"), "number")
	Do:$Data(properties("ArbiterNode")) model.%Set("ArbiterNode", properties("ArbiterNode"), "string")
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("CompressionForAsyncMembers")) model.%Set("CompressionForAsyncMembers", properties("CompressionForAsyncMembers"), "number")
	Do:$Data(properties("CompressionForFailoverMembers")) model.%Set("CompressionForFailoverMembers", properties("CompressionForFailoverMembers"), "number")
	Do:$Data(properties("CompressionTypeForAsyncMembers")) model.%Set("CompressionTypeForAsyncMembers", properties("CompressionTypeForAsyncMembers"), "number")
	Do:$Data(properties("CompressionTypeForFailoverMembers")) model.%Set("CompressionTypeForFailoverMembers", properties("CompressionTypeForFailoverMembers"), "number")
	Do:$Data(properties("DefinedPrimary")) model.%Set("DefinedPrimary", properties("DefinedPrimary"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("GUID")) model.%Set("GUID", properties("GUID"), "string")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("QOSTimeout")) model.%Set("QOSTimeout", properties("QOSTimeout"), "number")
	Do:$Data(properties("UseSSL")) model.%Set("UseSSL", properties("UseSSL"), "boolean")
	Do:$Data(properties("VirtualAddress")) model.%Set("VirtualAddress", properties("VirtualAddress"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Mirrors).Modify(model.Name,.properties)
}

}
