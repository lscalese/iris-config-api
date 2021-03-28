Include Api.Config.inc

Class Api.Config.Services.MirrorMember [ ProcedureBlock ]
{

Parameter ISSINGLE = 1;

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

ClassMethod Get() As %Library.DynamicObject
{
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.MirrorMember).Get(.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("AgentAddress") = pObj.AgentAddress
	Set properties("AsyncMemberGUID") = pObj.AsyncMemberGUID
	Set properties("AsyncMemberType") = pObj.AsyncMemberType
	Set properties("AsyncUseSystemPurgeInterval") = pObj.AsyncUseSystemPurgeInterval
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("Comments") = pObj.Comments
	Set properties("Flags") = pObj.Flags
	Set properties("JoinMirror") = pObj.JoinMirror
	Set properties("Name") = pObj.Name
	Set properties("SystemName") = pObj.SystemName
	Set properties("VirtualAddressInterface") = pObj.VirtualAddressInterface
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"AgentAddress") properties("AgentAddress") = model.AgentAddress
	Set:$$$CanSetProperty(model,"AsyncMemberGUID") properties("AsyncMemberGUID") = model.AsyncMemberGUID
	Set:$$$CanSetProperty(model,"AsyncMemberType") properties("AsyncMemberType") = model.AsyncMemberType
	Set:$$$CanSetProperty(model,"AsyncUseSystemPurgeInterval") properties("AsyncUseSystemPurgeInterval") = model.AsyncUseSystemPurgeInterval
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"JoinMirror") properties("JoinMirror") = model.JoinMirror
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"SystemName") properties("SystemName") = model.SystemName
	Set:$$$CanSetProperty(model,"VirtualAddressInterface") properties("VirtualAddressInterface") = model.VirtualAddressInterface
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("AgentAddress")) model.%Set("AgentAddress", properties("AgentAddress"), "string")
	Do:$Data(properties("AsyncMemberGUID")) model.%Set("AsyncMemberGUID", properties("AsyncMemberGUID"), "string")
	Do:$Data(properties("AsyncMemberType")) model.%Set("AsyncMemberType", properties("AsyncMemberType"), "number")
	Do:$Data(properties("AsyncUseSystemPurgeInterval")) model.%Set("AsyncUseSystemPurgeInterval", properties("AsyncUseSystemPurgeInterval"), "boolean")
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("JoinMirror")) model.%Set("JoinMirror", properties("JoinMirror"), "boolean")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("SystemName")) model.%Set("SystemName", properties("SystemName"), "string")
	Do:$Data(properties("VirtualAddressInterface")) model.%Set("VirtualAddressInterface", properties("VirtualAddressInterface"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.MirrorMember).Modify(.properties)
}

}
