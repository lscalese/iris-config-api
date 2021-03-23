Include Api.Config.inc

Class Api.Config.Services.Databases [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Directory="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Directory property is mandatory."))
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Databases).Create(model.Name,.properties)
}

ClassMethod Delete(Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Config.Databases).Delete(Name)
}

ClassMethod Exists(Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Config.Databases).Exists(Name)
}

ClassMethod Get(Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.Databases).Get(Name,.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod List(Names As %String = "*", CPFFile As %String = "", Flags As %Integer = 0, Format As %Integer = 0) As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Config.Databases:List")
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
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("ClusterMountMode") = pObj.ClusterMountMode
	Set properties("Comments") = pObj.Comments
	Set properties("Directory") = pObj.Directory
	Set properties("Flags") = pObj.Flags
	Set properties("MountAtStartup") = pObj.MountAtStartup
	Set properties("MountRequired") = pObj.MountRequired
	Set properties("Name") = pObj.Name
	Set properties("Server") = pObj.Server
	Set properties("StreamLocation") = pObj.StreamLocation
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"ClusterMountMode") properties("ClusterMountMode") = model.ClusterMountMode
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"Directory") properties("Directory") = model.Directory
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"MountAtStartup") properties("MountAtStartup") = model.MountAtStartup
	Set:$$$CanSetProperty(model,"MountRequired") properties("MountRequired") = model.MountRequired
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"Server") properties("Server") = model.Server
	Set:$$$CanSetProperty(model,"StreamLocation") properties("StreamLocation") = model.StreamLocation
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("ClusterMountMode")) model.%Set("ClusterMountMode", properties("ClusterMountMode"), "boolean")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("Directory")) model.%Set("Directory", properties("Directory"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("MountAtStartup")) model.%Set("MountAtStartup", properties("MountAtStartup"), "boolean")
	Do:$Data(properties("MountRequired")) model.%Set("MountRequired", properties("MountRequired"), "boolean")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("Server")) model.%Set("Server", properties("Server"), "string")
	Do:$Data(properties("StreamLocation")) model.%Set("StreamLocation", properties("StreamLocation"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.Databases).Modify(model.Name,.properties)
}

}
