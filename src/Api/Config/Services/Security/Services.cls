Include Api.Config.inc

/// Description
Class Api.Config.Services.Security.Services
{

Parameter UPDATEONLY = 1;

ClassMethod Exists(Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Security.Services).Exists(Name)
}

ClassMethod Get(Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Security.Services).Get(Name,.properties))
	Set properties("Name") = Name
	Quit ..ToDynamic(.properties)
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Security.Services).Modify(model.Name,.properties)
}

ClassMethod List(Names As %String = "*", CPFFile As %String = "", Flags As %Integer = 0, Format As %Integer = 0) As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Security.Services:List")
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
	Set properties("AutheEnabled") = pObj.AutheEnabled
	Set properties("ClientSystems") = pObj.ClientSystems
	Set properties("Description") = pObj.Description
	Set properties("Enabled") = pObj.Enabled
	Set properties("Name") = pObj.Name
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"AutheEnabled") properties("AutheEnabled") = model.AutheEnabled
	Set:$$$CanSetProperty(model,"ClientSystems") properties("ClientSystems") = model.ClientSystems
	Set:$$$CanSetProperty(model,"Description") properties("Description") = model.Description
	Set:$$$CanSetProperty(model,"Enabled") properties("Enabled") = model.Enabled
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("AutheEnabled")) model.%Set("AutheEnabled", properties("AutheEnabled"), "string")
	Do:$Data(properties("ClientSystems")) model.%Set("ClientSystems", properties("ClientSystems"), "string")
	Do:$Data(properties("Description")) model.%Set("Description", properties("Description"), "string")
	Do:$Data(properties("Enabled")) model.%Set("Enabled", properties("Enabled"), "boolean")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Quit model
}

}
