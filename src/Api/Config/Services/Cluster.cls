Include Api.Config.inc

Class Api.Config.Services.Cluster [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

ClassMethod Get() As %Library.DynamicObject
{
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.Cluster).Get(.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("CommIPAddress") = pObj.CommIPAddress
	Set properties("Comments") = pObj.Comments
	Set properties("Flags") = pObj.Flags
	Set properties("JoinCluster") = pObj.JoinCluster
	Set properties("Name") = pObj.Name
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"CommIPAddress") properties("CommIPAddress") = model.CommIPAddress
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"JoinCluster") properties("JoinCluster") = model.JoinCluster
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("CommIPAddress")) model.%Set("CommIPAddress", properties("CommIPAddress"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("JoinCluster")) model.%Set("JoinCluster", properties("JoinCluster"), "boolean")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Cluster).Modify(.properties)
}

}
