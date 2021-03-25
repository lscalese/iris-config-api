Include Api.Config.inc

Class Api.Config.Services.MapMirrors [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.GUID="" sc = $$$ADDSC(sc,$$$ERROR(5001, "GUID property is mandatory."))
	Set:model.ID="" sc = $$$ADDSC(sc,$$$ERROR(5001, "ID property is mandatory."))
	Set:model.InstanceDirectory="" sc = $$$ADDSC(sc,$$$ERROR(5001, "InstanceDirectory property is mandatory."))
	Set:model.MirrorAddress="" sc = $$$ADDSC(sc,$$$ERROR(5001, "MirrorAddress property is mandatory."))
	Set:model.MirrorSSPort="" sc = $$$ADDSC(sc,$$$ERROR(5001, "MirrorSSPort property is mandatory."))
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.MapMirrors).Create(model.ID,model.Name,.properties)
}

ClassMethod Delete(ID As %String, Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Config.MapMirrors).Delete(ID,Name)
}

ClassMethod Exists(ID As %String, Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Config.MapMirrors).Exists(ID,Name)
}

ClassMethod Get(ID As %String, Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(ID,Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.MapMirrors).Get(ID,Name,.properties))
	Set properties("ID") = ID, properties("Name") = Name
	Quit ..ToDynamic(.properties)
}

ClassMethod List(ID As %String, Names As %String = "*", CPFFile As %String = "", Flags As %Integer = 0, Format As %Integer = 0) As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Config.MapMirrors:List")
		Do rs.Execute(ID,Names,CPFFile,Flags,Format)
		While rs.Next() {
			Do list.%Push(..Get(ID, rs.Data("Name")))
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
	Set properties("AgentAddress") = pObj.AgentAddress
	Set properties("AgentPort") = pObj.AgentPort
	Set properties("AsyncMemberType") = pObj.AsyncMemberType
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("Comments") = pObj.Comments
	Set properties("ConnectsTo") = pObj.ConnectsTo
	Set properties("DejournalFilter") = pObj.DejournalFilter
	Set properties("ECPAddress") = pObj.ECPAddress
	Set properties("EncryptCommunication") = pObj.EncryptCommunication
	Set properties("Flags") = pObj.Flags
	Set properties("GUID") = pObj.GUID
	Set properties("ID") = pObj.ID
	Set properties("InstanceDirectory") = pObj.InstanceDirectory
	Set properties("MemberType") = pObj.MemberType
	Set properties("MirrorAddress") = pObj.MirrorAddress
	Set properties("MirrorSSPort") = pObj.MirrorSSPort
	Set properties("Name") = pObj.Name
	Set properties("SSLComputerName") = pObj.SSLComputerName
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"AgentAddress") properties("AgentAddress") = model.AgentAddress
	Set:$$$CanSetProperty(model,"AgentPort") properties("AgentPort") = model.AgentPort
	Set:$$$CanSetProperty(model,"AsyncMemberType") properties("AsyncMemberType") = model.AsyncMemberType
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"ConnectsTo") properties("ConnectsTo") = model.ConnectsTo
	Set:$$$CanSetProperty(model,"DejournalFilter") properties("DejournalFilter") = model.DejournalFilter
	Set:$$$CanSetProperty(model,"ECPAddress") properties("ECPAddress") = model.ECPAddress
	Set:$$$CanSetProperty(model,"EncryptCommunication") properties("EncryptCommunication") = model.EncryptCommunication
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"GUID") properties("GUID") = model.GUID
	Set:$$$CanSetProperty(model,"ID") properties("ID") = model.ID
	Set:$$$CanSetProperty(model,"InstanceDirectory") properties("InstanceDirectory") = model.InstanceDirectory
	Set:$$$CanSetProperty(model,"MemberType") properties("MemberType") = model.MemberType
	Set:$$$CanSetProperty(model,"MirrorAddress") properties("MirrorAddress") = model.MirrorAddress
	Set:$$$CanSetProperty(model,"MirrorSSPort") properties("MirrorSSPort") = model.MirrorSSPort
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"SSLComputerName") properties("SSLComputerName") = model.SSLComputerName
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("AgentAddress")) model.%Set("AgentAddress", properties("AgentAddress"), "string")
	Do:$Data(properties("AgentPort")) model.%Set("AgentPort", properties("AgentPort"), "number")
	Do:$Data(properties("AsyncMemberType")) model.%Set("AsyncMemberType", properties("AsyncMemberType"), "number")
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("ConnectsTo")) model.%Set("ConnectsTo", properties("ConnectsTo"), "string")
	Do:$Data(properties("DejournalFilter")) model.%Set("DejournalFilter", properties("DejournalFilter"), "string")
	Do:$Data(properties("ECPAddress")) model.%Set("ECPAddress", properties("ECPAddress"), "string")
	Do:$Data(properties("EncryptCommunication")) model.%Set("EncryptCommunication", properties("EncryptCommunication"), "number")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("GUID")) model.%Set("GUID", properties("GUID"), "string")
	Do:$Data(properties("ID")) model.%Set("ID", properties("ID"), "string")
	Do:$Data(properties("InstanceDirectory")) model.%Set("InstanceDirectory", properties("InstanceDirectory"), "string")
	Do:$Data(properties("MemberType")) model.%Set("MemberType", properties("MemberType"), "number")
	Do:$Data(properties("MirrorAddress")) model.%Set("MirrorAddress", properties("MirrorAddress"), "string")
	Do:$Data(properties("MirrorSSPort")) model.%Set("MirrorSSPort", properties("MirrorSSPort"), "number")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("SSLComputerName")) model.%Set("SSLComputerName", properties("SSLComputerName"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.MapMirrors).Modify(model.ID,model.Name,.properties)
}

}
