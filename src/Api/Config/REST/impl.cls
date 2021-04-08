Include Api.Config.inc

/// Config API.<br/>
/// Business logic class defined by OpenAPI in Api.Config.REST.spec<br/>
/// Updated Apr 5, 2021 18:38:05
Class Api.Config.REST.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 1;

/// Swagger 2.0 specification
ClassMethod GetSpecification() As %DynamicObject
{
    Do ..%SetStatusCode($$$HTTP200)
    Do ..%SetContentType("application/json")
    #dim XData As %Dictionary.CompiledXData = ##class(%Dictionary.CompiledXData).%OpenId("Api.Config.REST.spec||OpenAPI")
    Set swagger = {}.%FromJSON(XData.Data)
    Set swagger.host = %request.CgiEnvs("SERVER_NAME") _ ":" _ %request.CgiEnvs("SERVER_PORT")
    Set swagger.basePath = %request.Application
    Quit swagger
}

/// Get Cluster.
ClassMethod GetCluster() As %DynamicObject
{
	Quit ..DefaultGetImpl("Cluster")
}

/// Update Cluster.<br/>
/// The method arguments hold values for:<br/>
///     model, Cluster to update.<br/>
ClassMethod PutCluster(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set sc =##class(Api.Config.Services.Cluster).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	
	$$$ThrowOnError(##class(Api.Config.Services.Cluster).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get ConfigFile.
ClassMethod GetConfigFile() As %DynamicObject
{
	Set model = ##class(Api.Config.Services.ConfigFile).Get()
	Do ..%SetStatusCode($$$HTTP200)
	Do ..%SetContentType("application/json")
	Quit model
}

/// Update ConfigFile.<br/>
/// The method arguments hold values for:<br/>
///     model, ConfigFile to update.<br/>
ClassMethod PutConfigFile(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set sc =##class(Api.Config.Services.ConfigFile).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	
	$$$ThrowOnError(##class(Api.Config.Services.ConfigFile).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get Databases.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod GetDatabases(name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("Databases", name)
}

/// Update Databases.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
///     model, Databases to update.<br/>
ClassMethod PutDatabases(name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Name = name
	Set sc =##class(Api.Config.Services.Databases).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.Databases).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.Databases).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create Databases.<br/>
/// The method arguments hold values for:<br/>
///     model, Databases to create.<br/>
ClassMethod PostDatabases(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Databases", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"databases/"_dModel.Name)
	Quit resp
}

/// Delete Databases.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod DeleteDatabases(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("Databases", name)
}

/// Get List Of Databases.
ClassMethod GetListDatabases() As %DynamicObject
{
	Quit ..DefaultListOf("Databases","ListOfDatabases")
}

/// Get Debug.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod GetDebug(name As %String) As %DynamicObject
{
	If '##class(Api.Config.Services.Debug).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}

	Set model = ##class(Api.Config.Services.Debug).Get(name)
	Do ..%SetStatusCode($$$HTTP200)
	Do ..%SetContentType("application/json")
	Quit model
}

/// Update Debug.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
///     model, Debug to update.<br/>
ClassMethod PutDebug(name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Name = name
	Set sc =##class(Api.Config.Services.Debug).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.Debug).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.Debug).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create Debug.<br/>
/// The method arguments hold values for:<br/>
///     model, Debug to create.<br/>
ClassMethod PostDebug(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Debug", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"debug/"_dModel.Name)
	Quit resp
}

/// Delete Debug.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod DeleteDebug(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("Debug", name)
}

/// Get List Of Debug.
ClassMethod GetListDebug() As %DynamicObject
{
	Quit ..DefaultListOf("Debug","ListOfDebug")
}

/// Get DeviceSubTypes.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod GetDeviceSubTypes(name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("DeviceSubTypes", name)
}

/// Update DeviceSubTypes.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
///     model, DeviceSubTypes to update.<br/>
ClassMethod PutDeviceSubTypes(name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Name = name
	Set sc =##class(Api.Config.Services.DeviceSubTypes).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.DeviceSubTypes).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.DeviceSubTypes).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create DeviceSubTypes.<br/>
/// The method arguments hold values for:<br/>
///     model, DeviceSubTypes to create.<br/>
ClassMethod PostDeviceSubTypes(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("DeviceSubTypes", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"devicesubtypes/"_dModel.Name)
	Quit resp
}

/// Delete DeviceSubTypes.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod DeleteDeviceSubTypes(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("DeviceSubTypes", name)
}

/// Get List Of DeviceSubTypes.
ClassMethod GetListDeviceSubTypes() As %DynamicObject
{
	Quit ..DefaultListOf("DeviceSubTypes","ListOfDeviceSubTypes")
}

/// Get Devices.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod GetDevices(name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("Devices", name)
}

/// Update Devices.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
///     model, Devices to update.<br/>
ClassMethod PutDevices(name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Name = name
	Set sc =##class(Api.Config.Services.Devices).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.Devices).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.Devices).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get ECP.
ClassMethod GetECP() As %DynamicObject
{
	Quit ..DefaultGetImpl("ECP")
}

/// Create Devices.<br/>
/// The method arguments hold values for:<br/>
///     model, Devices to create.<br/>
ClassMethod PostDevices(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Devices", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"devices/"_dModel.Name)
	Quit resp
}

/// Delete Devices.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod DeleteDevices(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("Devices", name)
}

/// Update ECP.<br/>
/// The method arguments hold values for:<br/>
///     model, ECP to update.<br/>
ClassMethod PutECP(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set sc =##class(Api.Config.Services.ECP).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	
	$$$ThrowOnError(##class(Api.Config.Services.ECP).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get List Of Devices.
ClassMethod GetListDevices() As %DynamicObject
{
	Quit ..DefaultListOf("Devices","ListOfDevices")
}

/// Get ECPServers.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod GetECPServers(name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("ECPServers", name)
}

/// Update ECPServers.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
///     model, ECPServers to update.<br/>
ClassMethod PutECPServers(name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Name = name
	Set sc =##class(Api.Config.Services.ECPServers).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.ECPServers).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.ECPServers).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get IO.
ClassMethod GetIO() As %DynamicObject
{
	Quit ..DefaultGetImpl("IO")
}

/// Create ECPServers.<br/>
/// The method arguments hold values for:<br/>
///     model, ECPServers to create.<br/>
ClassMethod PostECPServers(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("ECPServers", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"ecpservers/"_dModel.Name)
	Quit resp
}

/// Delete ECPServers.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod DeleteECPServers(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("ECPServers", name)
}

/// Update IO.<br/>
/// The method arguments hold values for:<br/>
///     model, IO to update.<br/>
ClassMethod PutIO(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set sc =##class(Api.Config.Services.IO).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	
	$$$ThrowOnError(##class(Api.Config.Services.IO).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get Journal.
ClassMethod GetJournal() As %DynamicObject
{
	Quit ..DefaultGetImpl("Journal")
}

/// Get List Of ECPServers.
ClassMethod GetListECPServers() As %DynamicObject
{
	Quit ..DefaultListOf("ECPServers","ListOfECPServers")
}

/// Update Journal.<br/>
/// The method arguments hold values for:<br/>
///     model, Journal to update.<br/>
ClassMethod PutJournal(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set sc =##class(Api.Config.Services.Journal).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	
	$$$ThrowOnError(##class(Api.Config.Services.Journal).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get LicenseServers.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod GetLicenseServers(name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("LicenseServers", name)
}

/// Update LicenseServers.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
///     model, LicenseServers to update.<br/>
ClassMethod PutLicenseServers(name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Name = name
	Set sc =##class(Api.Config.Services.LicenseServers).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.LicenseServers).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.LicenseServers).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create LicenseServers.<br/>
/// The method arguments hold values for:<br/>
///     model, LicenseServers to create.<br/>
ClassMethod PostLicenseServers(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("LicenseServers", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"licenseservers/"_dModel.Name)
	Quit resp
}

/// Delete LicenseServers.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod DeleteLicenseServers(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("LicenseServers", name)
}

/// Get List Of LicenseServers.
ClassMethod GetListLicenseServers() As %DynamicObject
{
	Quit ..DefaultListOf("LicenseServers","ListOfLicenseServers")
}

/// Get MagTapes.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod GetMagTapes(name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("MagTapes", name)
}

/// Update MagTapes.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
///     model, MagTapes to update.<br/>
ClassMethod PutMagTapes(name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Name = name
	Set sc =##class(Api.Config.Services.MagTapes).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.MagTapes).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.MagTapes).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create MagTapes.<br/>
/// The method arguments hold values for:<br/>
///     model, MagTapes to create.<br/>
ClassMethod PostMagTapes(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("MagTapes", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"magtapes/"_dModel.Name)
	Quit resp
}

/// Delete MagTapes.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod DeleteMagTapes(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("MagTapes", name)
}

/// Get List Of MagTapes.
ClassMethod GetListMagTapes() As %DynamicObject
{
	Quit ..DefaultListOf("MagTapes","ListOfMagTapes")
}

/// Get MapGlobals.<br/>
/// The method arguments hold values for:<br/>
///     namespace, Namespace where the mapping is.<br><br/>
///     name, Name of the mapping.<br><br/>
ClassMethod GetMapGlobals(namespace As %String, name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("MapGlobals", namespace, name)
}

/// Update MapGlobals.<br/>
/// The method arguments hold values for:<br/>
///     namespace, Namespace where the mapping is.<br><br/>
///     name, Name of the mapping.<br><br/>
///     model, MapGlobals to update.<br/>
ClassMethod PutMapGlobals(namespace As %String, name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Name = name, dModel.Namespace = namespace
	Set sc =##class(Api.Config.Services.MapGlobals).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.MapGlobals).Exists(namespace,name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.MapGlobals).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create MapGlobals.<br/>
/// The method arguments hold values for:<br/>
///     namespace, Namespace where the mapping is.<br><br/>
///     model, MapGlobals to create.<br/>
ClassMethod PostMapGlobals(namespace As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Namespace = namespace
	Set resp = ..DefaultPostImpl("MapGlobals", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"mapglobals/"_namespace_"/"_dModel.Name)
	Quit resp
}

/// Delete MapGlobals.<br/>
/// The method arguments hold values for:<br/>
///     namespace, Namespace where the mapping is.<br><br/>
///     name, Name of the mapping.<br><br/>
ClassMethod DeleteMapGlobals(namespace As %String, name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("MapGlobals", namespace, name)
}

/// Get List Of MapGlobals.<br/>
/// The method arguments hold values for:<br/>
///     namespace, namespace.<br/>
ClassMethod GetListMapGlobals(namespace As %String) As %DynamicObject
{
	Set lst = ##class(Api.Config.Services.MapGlobals).List(namespace)
	Do ..%SetStatusCode($$$HTTP200)
	Do ..%SetContentType("application/json")
	Quit {"ListOfMapGlobals":(lst)}
}

/// Get MapMirrors.<br/>
/// The method arguments hold values for:<br/>
///     id, ID where the mapping is.<br><br/>
///     name, This is the name of this instance in the mirror. Mirror system names
/// must be unique (enforced by Enterprise Manager) across all of the mirrors which 
/// the EM manages, as an instance has a single mirror system name which 
/// may appear in multiple mirror sets (eg. a reporting member may connect
/// to multiple mirrors). For the most part the <property>GUID </property>
/// is used to identify a mirror member, the Name is used for display 
/// purposes. 
/// <br><br>
/// The name must not contain a colon (':') and is converted to uppercase before
/// saving.<br/>
ClassMethod GetMapMirrors(id As %String, name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("MapMirrors", id, name)
}

/// Update MapMirrors.<br/>
/// The method arguments hold values for:<br/>
///     id, ID where the mapping is.<br><br/>
///     name, This is the name of this instance in the mirror. Mirror system names
/// must be unique (enforced by Enterprise Manager) across all of the mirrors which 
/// the EM manages, as an instance has a single mirror system name which 
/// may appear in multiple mirror sets (eg. a reporting member may connect
/// to multiple mirrors). For the most part the <property>GUID </property>
/// is used to identify a mirror member, the Name is used for display 
/// purposes. 
/// <br><br>
/// The name must not contain a colon (':') and is converted to uppercase before
/// saving.<br/>
///     model, MapMirrors to update.<br/>
ClassMethod PutMapMirrors(id As %String, name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Id = id, dModel.Name = name
	Set sc =##class(Api.Config.Services.MapMirrors).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.MapMirrors).Exists(id,name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.MapMirrors).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create MapMirrors.<br/>
/// The method arguments hold values for:<br/>
///     id, ID where the mapping is.<br><br/>
///     model, MapMirrors to create.<br/>
ClassMethod PostMapMirrors(id As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Id = id
	Set resp = ..DefaultPostImpl("MapMirrors", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"mapmirrors/"_id_"/"_dModel.Name)
	Quit resp
}

/// Delete MapMirrors.<br/>
/// The method arguments hold values for:<br/>
///     id, ID where the mapping is.<br><br/>
///     name, This is the name of this instance in the mirror. Mirror system names
/// must be unique (enforced by Enterprise Manager) across all of the mirrors which 
/// the EM manages, as an instance has a single mirror system name which 
/// may appear in multiple mirror sets (eg. a reporting member may connect
/// to multiple mirrors). For the most part the <property>GUID </property>
/// is used to identify a mirror member, the Name is used for display 
/// purposes. 
/// <br><br>
/// The name must not contain a colon (':') and is converted to uppercase before
/// saving.<br/>
ClassMethod DeleteMapMirrors(id As %String, name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("MapMirrors", id, name)
}

/// Get List Of MapMirrors.<br/>
/// The method arguments hold values for:<br/>
///     id, ID where the mapping is.<br><br/>
ClassMethod GetListMapMirrors(id As %String) As %DynamicObject
{
	Set lst = ##class(Api.Config.Services.MapMirrors).List(id)
	Do ..%SetStatusCode($$$HTTP200)
	Do ..%SetContentType("application/json")
	Quit {"ListOfMapMirrors":(lst)}
}

/// Get MapPackages.<br/>
/// The method arguments hold values for:<br/>
///     namespace, Namespace where the mapping is.<br><br/>
///     name, Name of the mapping.<br><br/>
ClassMethod GetMapPackages(namespace As %String, name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("MapPackages", namespace, name)
}

/// Update MapPackages.<br/>
/// The method arguments hold values for:<br/>
///     namespace, Namespace where the mapping is.<br><br/>
///     name, Name of the mapping.<br><br/>
///     model, MapPackages to update.<br/>
ClassMethod PutMapPackages(namespace As %String, name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Namespace = namespace, dModel.Name = name
	Set sc =##class(Api.Config.Services.MapPackages).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.MapPackages).Exists(namespace,name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.MapPackages).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create MapPackages.<br/>
/// The method arguments hold values for:<br/>
///     namespace, Namespace where the mapping is.<br><br/>
///     model, MapPackages to create.<br/>
ClassMethod PostMapPackages(namespace As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Namespace = namespace
	Set resp = ..DefaultPostImpl("MapPackages", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"mappackages/"_namespace_"/"_dModel.Name)
	Quit resp
}

/// Delete MapPackages.<br/>
/// The method arguments hold values for:<br/>
///     namespace, Namespace where the mapping is.<br><br/>
///     name, Name of the mapping.<br><br/>
ClassMethod DeleteMapPackages(namespace As %String, name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("MapPackages", namespace, name)
}

/// Get List Of MapPackages.<br/>
/// The method arguments hold values for:<br/>
///     namespace, namespace.<br/>
ClassMethod GetListMapPackages(namespace As %String) As %DynamicObject
{
	Set lst = ##class(Api.Config.Services.MapPackages).List(namespace)
	Do ..%SetStatusCode($$$HTTP200)
	Do ..%SetContentType("application/json")
	Quit {"ListOfMapPackages":(lst)}
}

/// Get MapRoutines.<br/>
/// The method arguments hold values for:<br/>
///     namespace, Namespace where the mapping is.<br><br/>
///     name, Name of the mapping.<br><br/>
ClassMethod GetMapRoutines(namespace As %String, name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("MapRoutines", namespace, name)
}

/// Update MapRoutines.<br/>
/// The method arguments hold values for:<br/>
///     namespace, Namespace where the mapping is.<br><br/>
///     name, Name of the mapping.<br><br/>
///     model, MapRoutines to update.<br/>
ClassMethod PutMapRoutines(namespace As %String, name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Namespace = namespace, dModel.Name = name
	Set sc =##class(Api.Config.Services.MapRoutines).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.MapRoutines).Exists(namespace,name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.MapRoutines).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create MapRoutines.<br/>
/// The method arguments hold values for:<br/>
///     namespace, Namespace where the mapping is.<br><br/>
///     model, MapRoutines to create.<br/>
ClassMethod PostMapRoutines(namespace As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Namespace = namespace
	Set resp = ..DefaultPostImpl("MapRoutines", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"maproutines/"_namespace_"/"_dModel.Name)
	Quit resp
}

/// Delete MapRoutines.<br/>
/// The method arguments hold values for:<br/>
///     namespace, Namespace where the mapping is.<br><br/>
///     name, Name of the mapping.<br><br/>
ClassMethod DeleteMapRoutines(namespace As %String, name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("MapRoutines", namespace, name)
}

/// Get List Of MapRoutines.<br/>
/// The method arguments hold values for:<br/>
///     namespace, namespace.<br/>
ClassMethod GetListMapRoutines(namespace As %String) As %DynamicObject
{
	Set lst = ##class(Api.Config.Services.MapRoutines).List(namespace)
	Do ..%SetStatusCode($$$HTTP200)
	Do ..%SetContentType("application/json")
	Quit {"ListOfMapRoutines":(lst)}
}

/// Get MapShadows.<br/>
/// The method arguments hold values for:<br/>
///     id, ID where the mapping is.<br><br/>
///     name, Name of the mapping.<br><br/>
ClassMethod GetMapShadows(id As %String, name As %String) As %DynamicObject
{
	If '##class(Api.Config.Services.MapShadows).Exists(id,name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}

	Set model = ##class(Api.Config.Services.MapShadows).Get(id,name)
	Do ..%SetStatusCode($$$HTTP200)
	Do ..%SetContentType("application/json")
	Quit model
}

/// Update MapShadows.<br/>
/// The method arguments hold values for:<br/>
///     id, ID where the mapping is.<br><br/>
///     name, Name of the mapping.<br><br/>
///     model, MapShadows to update.<br/>
ClassMethod PutMapShadows(id As %String, name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Id = id, dModel.Name = name
	Set sc =##class(Api.Config.Services.MapShadows).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.MapShadows).Exists(id,name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.MapShadows).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get MirrorMember.
ClassMethod GetMirrorMember() As %DynamicObject
{
	Quit ..DefaultGetImpl("MirrorMember")
}

/// Create MapShadows.<br/>
/// The method arguments hold values for:<br/>
///     id, ID where the mapping is.<br><br/>
///     model, MapShadows to create.<br/>
ClassMethod PostMapShadows(id As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Id = id
	Set resp = ..DefaultPostImpl("MapShadows", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"mapshadows/"_id_"/"_dModel.Name)
	Quit resp
}

/// Delete MapShadows.<br/>
/// The method arguments hold values for:<br/>
///     id, ID where the mapping is.<br><br/>
///     name, Name of the mapping.<br><br/>
ClassMethod DeleteMapShadows(id As %String, name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("MapShadows", id, name)
}

/// Update MirrorMember.<br/>
/// The method arguments hold values for:<br/>
///     model, MirrorMember to update.<br/>
ClassMethod PutMirrorMember(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set sc =##class(Api.Config.Services.MirrorMember).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	
	$$$ThrowOnError(##class(Api.Config.Services.MirrorMember).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get List Of MapShadows.<br/>
/// The method arguments hold values for:<br/>
///     id, ID where the mapping is.<br><br/>
ClassMethod GetListMapShadows(id As %String) As %DynamicObject
{
	Set lst = ##class(Api.Config.Services.MapShadows).List(id)
	Do ..%SetStatusCode($$$HTTP200)
	Do ..%SetContentType("application/json")
	Quit {"ListOfMapShadows":(lst)}
}

/// Get Mirrors.<br/>
/// The method arguments hold values for:<br/>
///     name, Mirror names are uppercase (alphanumeric)
/// Name of the mirror, restricted to 15 uppercase alphanumeric characters. 
/// Must be unique across the mirrors managed by the EMS<br/>
ClassMethod GetMirrors(name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("Mirrors",name)
}

/// Update Mirrors.<br/>
/// The method arguments hold values for:<br/>
///     name, Mirror names are uppercase (alphanumeric)
/// Name of the mirror, restricted to 15 uppercase alphanumeric characters. 
/// Must be unique across the mirrors managed by the EMS<br/>
///     model, Mirrors to update.<br/>
ClassMethod PutMirrors(name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Name = name
	Set sc =##class(Api.Config.Services.Mirrors).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.Mirrors).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.Mirrors).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get Miscellaneous.
ClassMethod GetMiscellaneous() As %DynamicObject
{
	Quit ..DefaultGetImpl("Miscellaneous")
}

/// Create Mirrors.<br/>
/// The method arguments hold values for:<br/>
///     model, Mirrors to create.<br/>
ClassMethod PostMirrors(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Mirrors", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"mirrors/"_dModel.Name)
	Quit resp
}

/// Delete Mirrors.<br/>
/// The method arguments hold values for:<br/>
///     name, Mirror names are uppercase (alphanumeric)
/// Name of the mirror, restricted to 15 uppercase alphanumeric characters. 
/// Must be unique across the mirrors managed by the EMS<br/>
ClassMethod DeleteMirrors(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("Mirrors", name)
}

/// Update Miscellaneous.<br/>
/// The method arguments hold values for:<br/>
///     model, Miscellaneous to update.<br/>
ClassMethod PutMiscellaneous(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set sc =##class(Api.Config.Services.Miscellaneous).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	
	$$$ThrowOnError(##class(Api.Config.Services.Miscellaneous).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get List Of Mirrors.
ClassMethod GetListMirrors() As %DynamicObject
{
	Quit ..DefaultListOf("Mirrors","ListOfMirrors")
}

/// Get Monitor.
ClassMethod GetMonitor() As %DynamicObject
{
	Quit ..DefaultGetImpl("Monitor")
}

/// Update Monitor.<br/>
/// The method arguments hold values for:<br/>
///     model, Monitor to update.<br/>
ClassMethod PutMonitor(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set sc =##class(Api.Config.Services.Monitor).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	
	$$$ThrowOnError(##class(Api.Config.Services.Monitor).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get Namespaces.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod GetNamespaces(name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("Namespaces", name)
}

/// Update Namespaces.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
///     model, Namespaces to update.<br/>
ClassMethod PutNamespaces(name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model), dModel.Name = name
	Set resp = ..DefaultPutImpl("Namespaces", dModel)
	Quit resp
}

/// Get SQL.
ClassMethod GetSQL() As %DynamicObject
{
	Quit ..DefaultGetImpl("SQL")
}

/// Create Namespaces.<br/>
/// The method arguments hold values for:<br/>
///     model, Namespaces to create.<br/>
ClassMethod PostNamespaces(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model), resp = ..DefaultPostImpl("Namespaces", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"namespaces/"_dModel.Name)
	Quit resp
}

/// Delete Namespaces.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod DeleteNamespaces(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("Namespaces", name)
}

/// Update SQL.<br/>
/// The method arguments hold values for:<br/>
///     model, SQL to update.<br/>
ClassMethod PutSQL(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set sc =##class(Api.Config.Services.SQL).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	
	$$$ThrowOnError(##class(Api.Config.Services.SQL).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get List Of Namespaces.
ClassMethod GetListNamespaces() As %DynamicObject
{
	Quit ..DefaultListOf("Namespaces","ListOfNamespaces")
}

/// Get Shadows.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod GetShadows(name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("Shadows",name)
}

/// Update Shadows.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
///     model, Shadows to update.<br/>
ClassMethod PutShadows(name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Name = name
	Set sc =##class(Api.Config.Services.Shadows).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.Shadows).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.Shadows).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create Shadows.<br/>
/// The method arguments hold values for:<br/>
///     model, Shadows to create.<br/>
ClassMethod PostShadows(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Shadows", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"shadows/"_dModel.Name)
	Quit resp
}

/// Delete Shadows.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod DeleteShadows(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("Shadows", name)
}

/// Get List Of Shadows.
ClassMethod GetListShadows() As %DynamicObject
{
	Quit ..DefaultListOf("Shadows","ListOfShadows")
}

/// Get SqlSysDatatypes.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod GetSqlSysDatatypes(name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("SqlSysDatatypes",name)
}

/// Update SqlSysDatatypes.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
///     model, SqlSysDatatypes to update.<br/>
ClassMethod PutSqlSysDatatypes(name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Name = name
	Set sc =##class(Api.Config.Services.SqlSysDatatypes).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.SqlSysDatatypes).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.SqlSysDatatypes).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create SqlSysDatatypes.<br/>
/// The method arguments hold values for:<br/>
///     model, SqlSysDatatypes to create.<br/>
ClassMethod PostSqlSysDatatypes(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("SqlSysDatatypes", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"sqlsysdatatypes/"_dModel.Name)
	Quit resp
}

/// Delete SqlSysDatatypes.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod DeleteSqlSysDatatypes(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("SqlSysDatatypes", name)
}

/// Get List Of SqlSysDatatypes.
ClassMethod GetListSqlSysDatatypes() As %DynamicObject
{
	Quit ..DefaultListOf("SqlSysDatatypes","ListOfSqlSysDatatypes")
}

/// Get SqlUserDatatypes.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod GetSqlUserDatatypes(name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("SqlUserDatatypes",name)
}

/// Update SqlUserDatatypes.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
///     model, SqlUserDatatypes to update.<br/>
ClassMethod PutSqlUserDatatypes(name As %String, model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set dModel.Name = name
	Set sc =##class(Api.Config.Services.SqlUserDatatypes).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	If '##class(Api.Config.Services.SqlUserDatatypes).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.SqlUserDatatypes).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get Startup.
ClassMethod GetStartup() As %DynamicObject
{
	Quit ..DefaultGetImpl("Startup")
}

/// Create SqlUserDatatypes.<br/>
/// The method arguments hold values for:<br/>
///     model, SqlUserDatatypes to create.<br/>
ClassMethod PostSqlUserDatatypes(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("SqlUserDatatypes", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"sqluserdatatypes/"_dModel.Name)
	Quit resp
}

/// Delete SqlUserDatatypes.<br/>
/// The method arguments hold values for:<br/>
///     name, Name of the object instance.<br><br/>
ClassMethod DeleteSqlUserDatatypes(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("SqlUserDatatypes", name)
}

/// Update Startup.<br/>
/// The method arguments hold values for:<br/>
///     model, Startup to update.<br/>
ClassMethod PutStartup(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set sc =##class(Api.Config.Services.Startup).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	
	$$$ThrowOnError(##class(Api.Config.Services.Startup).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get List Of SqlUserDatatypes.
ClassMethod GetListSqlUserDatatypes() As %DynamicObject
{
	Quit ..DefaultListOf("SqlUserDatatypes","ListOfSqlUserDatatypes")
}

/// Get Telnet.
ClassMethod GetTelnet() As %DynamicObject
{
	Quit ..DefaultGetImpl("Telnet")
}

/// Update Telnet.<br/>
/// The method arguments hold values for:<br/>
///     model, Telnet to update.<br/>
ClassMethod PutTelnet(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set sc =##class(Api.Config.Services.Telnet).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	
	$$$ThrowOnError(##class(Api.Config.Services.Telnet).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get config.
ClassMethod Getconfig() As %DynamicObject
{
	Quit ..DefaultGetImpl("config")
}

/// Update config.<br/>
/// The method arguments hold values for:<br/>
///     model, config to update.<br/>
ClassMethod Putconfig(model As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.model)
	Set sc =##class(Api.Config.Services.config).CheckModel(dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	
	$$$ThrowOnError(##class(Api.Config.Services.config).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get list of databases directory.
ClassMethod GetListOfDirectory() As %DynamicObject
{
    Quit ..DefaultListOf("SYS.Databases","ListOfDirectory")
}

/// Get database directory details.<br/>
/// The method arguments hold values for:<br/>
///     directory, Database directory ex: /usr/irissys/mgr/user/ don't forget to escape -> %2Fusr%2Firissys%2Fmgr%2Fuser%2F.<br/>
ClassMethod GetDirectory(directory As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("SYS.Databases",directory)
}

/// Create a new database directory.<br/>
/// The method arguments hold values for:<br/>
///     directory, Database directory to create.<br/>
ClassMethod PostDirectory(directory As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.directory)
	Set resp = ..DefaultPostImpl("SYS.Databases", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"sys/databases/"_##class(%CSP.Page).EscapeURL(dModel.Directory))
	Quit resp
}

/// Update an existing database directory.<br/>
/// The method arguments hold values for:<br/>
///     directory, Database directory ex: /usr/irissys/mgr/user/ don't forget to escape -> %2Fusr%2Firissys%2Fmgr%2Fuser%2F.<br/>
///     DirectoryModel, Database to update.<br/>
ClassMethod PutDirectory(directory As %String, DirectoryModel As %Stream.Object) As %DynamicObject
{
	Set dModel = {}.%FromJSON(.DirectoryModel)
	Set dModel.Directory = directory
	If '##class(Api.Config.Services.SYS.Databases).Exists(dModel.Directory) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError(##class(Api.Config.Services.SYS.Databases).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Delete database directory.<br/>
/// The method arguments hold values for:<br/>
///     directory, Database directory ex: /usr/irissys/mgr/user/ don't forget to escape -> %2Fusr%2Firissys%2Fmgr%2Fuser%2F.<br/>
ClassMethod DeleteDirectory(directory As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("SYS.Databases",  ##class(%CSP.Page).UnescapeURL(directory))
}

/// Mount database.<br/>
/// The method arguments hold values for:<br/>
///     directory<br/>
ClassMethod PutDirectoryMounted(directory As %String) As %DynamicObject
{
    Set directory = ##class(%CSP.Page).UnescapeURL(directory)

	If '##class(Api.Config.Services.SYS.Databases).Exists(directory) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}

	$$$ThrowOnError(##class(Api.Config.Services.SYS.Databases).Mount(directory))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Dismount database.<br/>
/// The method arguments hold values for:<br/>
///     directory<br/>
ClassMethod DeleteDirectoryMounted(directory As %String) As %DynamicObject
{
    Set directory = ##class(%CSP.Page).UnescapeURL(directory)

	If '##class(Api.Config.Services.SYS.Databases).Exists(directory) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}

	$$$ThrowOnError(##class(Api.Config.Services.SYS.Databases).Dismount(directory))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Get Web application.<br/>
/// The method arguments hold values for:<br/>
///     name, Web application url ex : /api/config don't forget to escape -> %2Fapi%2Fconfig<br/>
ClassMethod GetWebApp(name As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.Applications",name)
}

/// Update Web application.<br/>
/// The method arguments hold values for:<br/>
///     name, Web application url ex : /api/config don't forget to escape -> %2Fapi%2Fconfig<br/>
///     model<br/>
ClassMethod PutWebApp(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(model)
	Set name = ##class(%CSP.Page).UnescapeURL(name)
	If '##class(Api.Config.Services.Security.Applications).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}

	$$$ThrowOnError(##class(Api.Config.Services.Security.Applications).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create a new web applications.<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PostWebApp(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Security.Applications", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"security/applications/"_##class(%CSP.Page).EscapeURL(dModel.Name))
	Quit resp
}

/// Get list of existing web applications.
ClassMethod GetListOfWebApps() As %DynamicObject
{
    Quit ..DefaultListOf("Security.Applications","ListOfWebApps")
}

/// Delete Web application.<br/>
/// The method arguments hold values for:<br/>
///     name, Web application url ex : /api/config don't forget to escape -> %2Fapi%2Fconfig<br/>
ClassMethod DeleteWebApp(name As %String) As %DynamicObject
{
	Quit ..DefaultDelImpl("Security.Applications",  name)
}

/// Load configuration.<br/>
/// The method arguments hold values for:<br/>
///     model, configuration in json format.<br/>
ClassMethod LoadConfiguration(model As %Stream.Object) As %Stream.Object
{
    Set dModel = {}.%FromJSON(model)
	Do ##class(IORedirect.Redirect).ToStream()
	Try {
		Set tSC = ##class(Api.Config.Services.Loader).Load(dModel)
	}
	Catch ex {
		Set tSC=ex.AsStatus()
	}
	
	Do ##class(IORedirect.Redirect).RestoreIO()
	Set stream = ##class(IORedirect.Redirect).Get()
	
	If $$$ISERR(tSC) {
		Do ..%SetStatusCode(500)
		Do stream.WriteLine($SYSTEM.Status.GetOneErrorText(tSC))
	}
	Do stream.Rewind()
	Quit stream
}

/// WARNING Delete all namespaces, databases, webapps,... defined in configuration object.<br/>
/// The method arguments hold values for:<br/>
///     model, configuration in json format.<br/>
ClassMethod DeleteConfiguration(model As %Stream.Object) As %Stream.Object
{
	Set dModel = {}.%FromJSON(model)
	Do ##class(IORedirect.Redirect).ToStream()
	
	Try {
		Set tSC = ##class(Api.Config.Services.Loader).Delete(dModel)
	}
	Catch ex {
		Set tSC=ex.AsStatus()
	}
	
	Do ##class(IORedirect.Redirect).RestoreIO()
	Set stream = ##class(IORedirect.Redirect).Get()
	
	If $$$ISERR(tSC) {
		Do ..%SetStatusCode(500)
		Do stream.WriteLine($SYSTEM.Status.GetOneErrorText(tSC))
	}
	Do stream.Rewind()
	Quit stream
}

/// Get list of services.
ClassMethod GetListOfServices() As %DynamicObject
{
    Quit ..DefaultListOf("Security.Services","ListOfServices")
}

/// Get service detail by name<br/>
/// The method arguments hold values for:<br/>
///     name<br/>
ClassMethod GetService(name As %String) As %DynamicObject
{
	Quit ..DefaultGetImpl("Security.Services",name)
}

/// Update service.  Set Enable property to 1/0 to activate/disable.<br/>
/// The method arguments hold values for:<br/>
///     name<br/>
///     model<br/>
ClassMethod PutService(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(model)
	Set name = ##class(%CSP.Page).UnescapeURL(name)
	If '##class(Api.Config.Services.Security.Services).Exists(name) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}

	$$$ThrowOnError(##class(Api.Config.Services.Security.Services).Update(dModel))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

/// Create an export instance on the server following your filter criteria.  You can download the created export with GET /export/{id}.  See the location response header.<br/>
/// The method arguments hold values for:<br/>
///     filter, params filter to export.<br/>
///     OnlyNotDefaultValue, export only not default value parameters.<br/>
ClassMethod PostExport(filter As %Stream.Object, OnlyNotDefaultValue As %Integer) As %DynamicObject
{
    Set dModel = {}.%FromJSON(filter)
	Do ..%SetStatusCode($$$HTTP201)
	Set export = ##class(Api.Config.Services.Loader).export(dModel,''OnlyNotDefaultValue)
	Set record = ##class(Api.Config.TempStream).%New()
	Set record.name = "export-config"
	Do export.%ToJSON(record.charStream)
	Do record.%Save()
	Do ..%SetStatusCode($$$HTTP201)
	Do ..%SetHeader("Location", %request.Application_"export/"_record.%Id())
	Quit ""
}

/// Get an existing configuration export.<br/>
/// The method arguments hold values for:<br/>
///     id, export id to retrieve.<br/>
ClassMethod GetExport(id As %String) As %DynamicObject
{
    If '##class(Api.Config.TempStream).%ExistsId(id) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	Do ..%SetStatusCode($$$HTTP200)
	Set record = ##class(Api.Config.TempStream).%OpenId(id)
	Set response = {}.%FromJSON(record.charStream)
	Quit response
}

/// Create a new user.<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PostUsers(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Security.Users", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"security/users/"_dModel.Name)
	Quit resp
}

/// Get list of users.
ClassMethod GetListOfUsers() As %DynamicObject
{
    Quit ..DefaultListOf("Security.Users")
}

/// Get user detail.<br/>
/// The method arguments hold values for:<br/>
///     name, user name<br/>
ClassMethod GetUser(name As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.Users", name)
}

/// Update user.<br/>
/// The method arguments hold values for:<br/>
///     name, username.<br/>
///     model<br/>
ClassMethod PutUsers(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model), dModel.Name = name
	Set resp = ..DefaultPutImpl("Security.Users", dModel)
	Quit resp
}

/// Delete a user.<br/>
/// The method arguments hold values for:<br/>
///     name, username.<br/>
ClassMethod DeleteUsers(name As %String) As %DynamicObject
{
    Quit ..DefaultDelImpl("Security.Users", name)
}

/// Create a new role.<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PostRoles(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Security.Roles", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"/security/roles/"_dModel.Name)
	Quit resp
}

/// Get list of roles.
ClassMethod GetListOfRoles() As %DynamicObject
{
    Quit ..DefaultListOf("Security.Roles")
}

/// Get role detail.<br/>
/// The method arguments hold values for:<br/>
///     name, role name<br/>
ClassMethod GetRoles(name As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.Roles", name)
}

/// Update role.<br/>
/// The method arguments hold values for:<br/>
///     name, role name.<br/>
///     model<br/>
ClassMethod PutRoles(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model), dModel.Name = name
	Set resp = ..DefaultPutImpl("Security.Roles", dModel)
	Quit resp
}

/// Delete a role.<br/>
/// The method arguments hold values for:<br/>
///     name, role name.<br/>
ClassMethod DeleteRoles(name As %String) As %DynamicObject
{
    Quit ..DefaultDelImpl("Security.Roles", name)
}

/// Create a new resource.<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PostResources(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Security.Resources", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"/security/resources/"_dModel.Name)
	Quit resp
}

/// Get list of resources.
ClassMethod GetListOfResources() As %DynamicObject
{
    Quit ..DefaultListOf("Security.Resources")
}

/// Get resource detail.<br/>
/// The method arguments hold values for:<br/>
///     name, resource name<br/>
ClassMethod GetResources(name As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.Resources", name)
}

/// Update resource.<br/>
/// The method arguments hold values for:<br/>
///     name, resource name.<br/>
///     model<br/>
ClassMethod PutResources(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model), dModel.Name = name
	Set resp = ..DefaultPutImpl("Security.Resources", dModel)
	Quit resp
}

/// Delete a resource.<br/>
/// The method arguments hold values for:<br/>
///     name, resource name.<br/>
ClassMethod DeleteResources(name As %String) As %DynamicObject
{
    Quit ..DefaultDelImpl("Security.Resources", name)
}

/// Create a new sslconfig.<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PostSSLConfigs(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Security.SSLConfigs", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"/security/sslconfigs/"_dModel.Name)
	Quit resp
}

/// Get list of sslconfigs.
ClassMethod GetListOfSSLConfigs() As %DynamicObject
{
    Quit ..DefaultListOf("Security.SSLConfigs")
}

/// Get sslconfig detail.<br/>
/// The method arguments hold values for:<br/>
///     name, sslconfig name<br/>
ClassMethod GetSSLConfigs(name As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.SSConfigs", name)
}

/// Update sslconfig.<br/>
/// The method arguments hold values for:<br/>
///     name, sslconfig name.<br/>
///     model<br/>
ClassMethod PutSSLConfigs(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model), dModel.Name = name
	Set resp = ..DefaultPutImpl("Security.SSLConfigs", dModel)
	Quit resp
}

/// Delete a sslconfig.<br/>
/// The method arguments hold values for:<br/>
///     name, sslconfig name.<br/>
ClassMethod DeleteSSLConfigs(name As %String) As %DynamicObject
{
    Quit ..DefaultDelImpl("Security.SSLConfigs", name)
}

/// Get list of SQLAdminPrivilegeSet.
ClassMethod GetListOfSQLAdminPrivilegeSet() As %DynamicObject
{
    Quit ..DefaultListOf("Security.SQLAdminPrivilegeSet")
}

/// Set SQLAdminPrivilegeSet.<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PutSQLAdminPrivilegeSet(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPutImpl("Security.SQLAdminPrivilegeSet", dModel, , $$$NO)
	Quit resp
}

/// Get SQLAdminPrivilegeSet detail.<br/>
/// The method arguments hold values for:<br/>
///     namespace, namespace<br/>
///     grantee, grantee<br/>
ClassMethod GetSQLAdminPrivilegeSet(namespace As %String, grantee As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Security.SQLAdminPrivilegeSet", namespace, grantee)
}

/// Delete SQLAdminPrivilegeSet.<br/>
/// The method arguments hold values for:<br/>
///     namespace, namespace<br/>
///     grantee, grantee<br/>
ClassMethod DeleteSQLAdminPrivilegeSet(namespace As %String, grantee As %String) As %DynamicObject
{
    Quit ..DefaultDelImpl("Security.SQLAdminPrivilegeSet", namespace, grantee)
}

/// Get list of privilege for namespace and grantee.<br/>
/// The method arguments hold values for:<br/>
///     namespace<br/>
///     grantee<br/>
ClassMethod GetListOfSQLPrivileges(namespace As %String, grantee As %String) As %DynamicObject
{
    Set lst = ##class(Api.Config.Services.Security.SQLPrivileges).List(namespace,grantee)
	Do ..%SetStatusCode($$$HTTP200)
	Do ..%SetContentType("application/json")
	Quit {"ListOfNamespaces":(lst)}
}

/// Delete privileges for namespace and grantee.<br/>
/// The method arguments hold values for:<br/>
///     namespace<br/>
///     grantee<br/>
ClassMethod DeleteSQLPrivileges(namespace As %String, grantee As %String) As %DynamicObject
{
    Quit ..DefaultDelImpl("Security.SQLPrivileges", namespace, grantee)
}

/// Set SQL Privileges<br/>
/// The method arguments hold values for:<br/>
///     SQLPrivilege<br/>
ClassMethod PutSQLPrivileges(SQLPrivilege As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.SQLPrivilege)
	Set resp = ..DefaultPutImpl("Security.SQLPrivileges", dModel, , $$$NO)
	Quit resp
}

/// Create a new sqlconnection.<br/>
/// The method arguments hold values for:<br/>
///     model<br/>
ClassMethod PostSQLConnection(model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model)
	Set resp = ..DefaultPostImpl("Library.SQLConnection", dModel, .created)
	Do:created ..%SetHeader("Location", %request.Application_"library/sqlconnection/"_dModel.Name)
	Quit resp
}

/// Get list of existing SQLConnections.
ClassMethod GetListOfSQLConnection() As %DynamicObject
{
    Quit ..DefaultListOf("Library.SQLConnection")
}

/// Get SQLConnection detail.<br/>
/// The method arguments hold values for:<br/>
///     name, SQLConnection name<br/>
ClassMethod GetSQLConnection(name As %String) As %DynamicObject
{
    Quit ..DefaultGetImpl("Library.SQLConnection", name)
}

/// Update SQLConnection.<br/>
/// The method arguments hold values for:<br/>
///     name, SQLConnection name.<br/>
///     model<br/>
ClassMethod PutSQLConnection(name As %String, model As %Stream.Object) As %DynamicObject
{
    Set dModel = {}.%FromJSON(.model), dModel.Name = name
	Set resp = ..DefaultPutImpl("Library.SQLConnection", dModel)
	Quit resp
}

/// Delete SQLConnection.<br/>
/// The method arguments hold values for:<br/>
///     name, SQLConnection name.<br/>
ClassMethod DeleteSQLConnection(name As %String) As %DynamicObject
{
    Quit ..DefaultDelImpl("Security.SQLConnection", name)
}

ClassMethod DefaultGetImpl(class As %String, ids...) As %DynamicObject [ Private ]
{
	Set class = "Api.Config.Services." _ class

	If '$d(ids) {
		Do ..%SetStatusCode($$$HTTP200)
		Quit $CLASSMETHOD(class, "Get")
	}

	Set id1 = ##class(%CSP.Page).UnescapeURL(ids(1))

	If ids = 1 {
		
		If '$CLASSMETHOD(class, "Exists", id1) {
			Do ..%SetStatusCode($$$HTTP404)
			Quit ""
		}
		
		Quit $CLASSMETHOD(class, "Get", id1)
	}

	Set id2 = ##class(%CSP.Page).UnescapeURL(ids(2))

	If '$CLASSMETHOD(class, "Exists", id1, id2) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}

	Do ..%SetStatusCode($$$HTTP200)
	Quit $CLASSMETHOD(class, "Get", id1, id2)
}

ClassMethod DefaultDelImpl(class As %String, ids...) As %DynamicObject [ Private ]
{
	Set class = "Api.Config.Services." _ class
	Set id1 = ##class(%CSP.Page).UnescapeURL(ids(1))

	If ids = 1 {
		
		If '$CLASSMETHOD(class, "Exists", id1) {
			Do ..%SetStatusCode($$$HTTP404)
			Quit ""
		}
		
		$$$ThrowOnError($CLASSMETHOD(class, "Delete", id1))
		Do ..%SetStatusCode($$$HTTP204)
		Quit ""
	}

	Set id2 = ##class(%CSP.Page).UnescapeURL(ids(2))

	If '$CLASSMETHOD(class, "Exists", id1, id2) {
		Do ..%SetStatusCode($$$HTTP404)
		Quit ""
	}
	
	$$$ThrowOnError($CLASSMETHOD(class, "Delete", id1, id2))
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

ClassMethod DefaultPostImpl(class As %String, dModel As %DynamicObject, Output created As %Boolean) As %DynamicObject [ Private ]
{
	Set class = "Api.Config.Services." _ class
	Set created = $$$NO, sc = $CLASSMETHOD(class, "CheckModel", dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}
	
	Set ids = $PARAMETER(class, "PIDENTIFIER")
	Set id1 = $Piece(ids,",",1)
	Set:id1="" id1="Name"
	Set id2 = $Piece(ids,",",2)

	If id2 = "" {
		If $CLASSMETHOD(class, "Exists", dModel.%Get(id1)) {
			Do ..%SetStatusCode($$$HTTP409)
			Quit ""
		}
	} Else {
		If $CLASSMETHOD(class, "Exists", dModel.%Get(id1), dModel.%Get(id2)) {
			Do ..%SetStatusCode($$$HTTP409)
			Quit ""
		}
	}
	
	$$$ThrowOnError($CLASSMETHOD(class, "Create", dModel))
	Set created = $$$YES
	Do ..%SetStatusCode($$$HTTP201)
	Quit ""
}

ClassMethod DefaultPutImpl(class As %String, dModel As %DynamicObject, Output updated As %Boolean, existsTest As %Boolean = {$$$YES}) As %DynamicObject [ Private ]
{
	Set class = "Api.Config.Services." _ class
	Set updated = $$$NO, sc = $CLASSMETHOD(class, "CheckModel", dModel)
	If $$$ISERR(sc) {
		Do ..%SetStatusCode($$$HTTP400)
		Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)
		Quit jsonSC
	}

	If existsTest {
		Set ids = $PARAMETER(class, "PIDENTIFIER")
		Set id1 = $Piece(ids,",",1)
		Set:id1="" id1="Name"
		Set id2 = $Piece(ids,",",2)
		s ^lsc=id1
		If id2 = "" {
			If '$CLASSMETHOD(class, "Exists", dModel.%Get(id1)) {
				Do ..%SetStatusCode($$$HTTP404)
				Quit ""
			}
		} Else {
			If '$CLASSMETHOD(class, "Exists", dModel.%Get(id1), dModel.%Get(id2)) {
				Do ..%SetStatusCode($$$HTTP404)
				Quit ""
			}
		}
	}
	
	$$$ThrowOnError($CLASSMETHOD(class, "Update", dModel))
	Set updated = $$$YES
	Do ..%SetStatusCode($$$HTTP204)
	Quit ""
}

ClassMethod DefaultListOf(class As %String, propertyList As %String = "list") As %DynamicObject
{
	Set class = "Api.Config.Services." _ class, obj = {}
	Set lst = $CLASSMETHOD(class, "List")
	Do ..%SetStatusCode($$$HTTP200), ..%SetContentType("application/json"), obj.%Set(propertyList,lst)
	Quit obj
}

}
