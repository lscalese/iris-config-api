Include Api.Config.inc

Class Api.Config.Services.SYS.Databases
{

Parameter PNAME = "Directory";

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	$$$switchNSSys
	Do:'##class(%File).DirectoryExists(model.Directory) ##class(%File).CreateDirectoryChain(model.Directory)
    Set db=##Class(SYS.Database).%New()
    Set lbProperties = $$$DBSysCreateProperties
    Do ..ToArray(model, .properties)
    Set key = ""
    For  {
        Set key = $Order(properties(key),1,value)
        Quit:key=""
        If ''$LISTFIND(lbProperties,key) {  ; can set this property on create.
            Set $Property(db, key) = value
        }
    }
	Quit db.%Save()
}

ClassMethod Delete(Directory As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(SYS.Database).DeleteDatabase(Directory)
}

ClassMethod Exists(Directory As %String) As %Boolean
{
    $$$switchNSSys
    Quit ##class(SYS.Database).%ExistsId(Directory)
}

ClassMethod Get(Directory As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Directory) ""
	$$$switchNSSys
    Set DBObj = ##class(SYS.Database).%OpenId(Directory,,.sc)
    If $$$ISERR(sc) $$$ThrowStatus(sc)
    Do ..ObjectToArray(DBObj, .properties)
	Quit ..ToDynamic(.properties)
}

ClassMethod List(mask As %String = "*") As %DynamicArray
{
    $$$switchNSSys
    Set dbList = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("SYS.Database:CompactLocalList")
		Do rs.Execute(mask)
		While rs.Next() {
			Do dbList.%Push(..Get(rs.Data("Directory")))
		}
		Do rs.Close()
		$$$restoreNS

	}Catch(ex) {
		$$$restoreNS
		Throw ex
	}
	Return dbList
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
    Set db=##Class(SYS.Database).%OpenId(model.Directory,,.sc)
    If $$$ISERR(sc) $$$ThrowStatus(sc)
    
    Set lbProperties = $$$DBSysUpdateProperties

    Set key = ""
    For  {
        Set key = $Order(properties(key),1,value)
        Quit:key=""
        If ''$LISTFIND(lbProperties,key) {  ; can set this property on update.
            Set $Property(db, key) = value
        }
    }
	Quit db.%Save()
}

ClassMethod Dismount(Directory As %String) As %Status
{
    $$$switchNSSys
    Set db = ##class(SYS.Database).%OpenId(Directory,,.sc)
    If $$$ISERR(sc) $$$ThrowStatus(sc)
    Quit:'db.Mounted $$$OK
    Quit db.Dismount()
}

ClassMethod Mount(Directory As %String, readOnly As %Boolean = {$$$NO}) As %Status
{
    $$$switchNSSys
    Set db = ##class(SYS.Database).%OpenId(Directory,,.sc)
    If $$$ISERR(sc) $$$ThrowStatus(sc)
    If db.Mounted && (db.ReadOnlyMounted'=readOnly) {
        $$$ThrowOnError(db.Dismount())
    }
    Quit db.Mount(+readOnly)
}

ClassMethod GetMountState(Directory As %String) As %DynamicObject
{
    $$$switchNSSys
    Set db = ##class(SYS.Database).%OpenId(Directory,,.sc)
    If $$$ISERR(sc) {
        $$$ThrowStatus(sc)
    }

    #dim mountState As %Library.DynamicObject = {}
    Do mountState.%Set("Directory", db.Directory, "string")
    Do mountState.%Set("Mounted", db.Mounted, "boolean")
    Do mountState.%Set("ReadOnlyMounted", db.ReadOnlyMounted, "boolean")
    
    Quit mountState
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary) [ Private ]
{
	Set properties("BlockFormat") = pObj.BlockFormat
	Set properties("BlockSize") = pObj.BlockSize
	Set properties("Blocks") = pObj.Blocks
	Set properties("BlocksPerMap") = pObj.BlocksPerMap
	Set properties("ClusterMountMode") = pObj.ClusterMountMode
	Set properties("ClusterMounted") = pObj.ClusterMounted
	Set properties("CompressionEngine") = pObj.CompressionEngine
	Set properties("CurrentMaps") = pObj.CurrentMaps
	Set properties("Directory") = pObj.Directory
	Set properties("DirectoryBlock") = pObj.DirectoryBlock
	Set properties("EncryptedDB") = pObj.EncryptedDB
	Set properties("EncryptionKeyID") = pObj.EncryptionKeyID
	Set properties("Expanding") = pObj.Expanding
	Set properties("ExpansionSize") = pObj.ExpansionSize
	Set properties("Full") = pObj.Full
	Set properties("GlobalJournalState") = pObj.GlobalJournalState
	Set properties("InActiveMirror") = pObj.InActiveMirror
	Set properties("LastExpansionTime") = pObj.LastExpansionTime
	Set properties("MaxSize") = pObj.MaxSize
	Set properties("MirrorActivationRequired") = pObj.MirrorActivationRequired
	Set properties("MirrorDBCatchup") = pObj.MirrorDBCatchup
	Set properties("MirrorDBCreatedNew") = pObj.MirrorDBCreatedNew
	Set properties("MirrorDBName") = pObj.MirrorDBName
	Set properties("MirrorDBPaused") = pObj.MirrorDBPaused
	Set properties("MirrorFailoverDB") = pObj.MirrorFailoverDB
	Set properties("MirrorNoWrite") = pObj.MirrorNoWrite
	Set properties("MirrorObsolete") = pObj.MirrorObsolete
	Set properties("MirrorSetName") = pObj.MirrorSetName
	Set properties("Mirrored") = pObj.Mirrored
	Set properties("Mounted") = pObj.Mounted
	Set properties("NewGlobalCollation") = pObj.NewGlobalCollation
	Set properties("NewGlobalGrowthBlock") = pObj.NewGlobalGrowthBlock
	Set properties("NewGlobalIsKeep") = pObj.NewGlobalIsKeep
	Set properties("NewGlobalPointerBlock") = pObj.NewGlobalPointerBlock
	Set properties("NumberOfConfigDB") = pObj.NumberOfConfigDB
	Set properties("ROReasonCode") = pObj.ROReasonCode
	Set properties("ROReasonText") = pObj.ROReasonText
	Set properties("ReCreate") = pObj.ReCreate
	Set properties("ReadOnly") = pObj.ReadOnly
	Set properties("ReadOnlyMounted") = pObj.ReadOnlyMounted
	Set properties("Reinitialize") = pObj.Reinitialize
	Set properties("RequestSize") = pObj.RequestSize
	Set properties("ResourceName") = pObj.ResourceName
	Set properties("RunCatchupDBOnCreate") = pObj.RunCatchupDBOnCreate
	Set properties("SFN") = pObj.SFN
	Set properties("Size") = pObj.Size
	Set properties("Skeleton") = pObj.Skeleton
	Set properties("SparseDB") = pObj.SparseDB
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary) [ Private ]
{
	Set:$$$CanSetProperty(model,"BlockFormat") properties("BlockFormat") = model.BlockFormat
	Set:$$$CanSetProperty(model,"BlockSize") properties("BlockSize") = model.BlockSize
	Set:$$$CanSetProperty(model,"ClusterMountMode") properties("ClusterMountMode") = model.ClusterMountMode
	Set:$$$CanSetProperty(model,"CompressionEngine") properties("CompressionEngine") = model.CompressionEngine
	Set:$$$CanSetProperty(model,"Directory") properties("Directory") = model.Directory
	Set:$$$CanSetProperty(model,"EncryptedDB") properties("EncryptedDB") = model.EncryptedDB
	Set:$$$CanSetProperty(model,"EncryptionKeyID") properties("EncryptionKeyID") = model.EncryptionKeyID
	Set:$$$CanSetProperty(model,"ExpansionSize") properties("ExpansionSize") = model.ExpansionSize
	Set:$$$CanSetProperty(model,"Full") properties("Full") = model.Full
	Set:$$$CanSetProperty(model,"GlobalJournalState") properties("GlobalJournalState") = model.GlobalJournalState
	Set:$$$CanSetProperty(model,"MaxSize") properties("MaxSize") = model.MaxSize
	Set:$$$CanSetProperty(model,"MirrorDBName") properties("MirrorDBName") = model.MirrorDBName
	Set:$$$CanSetProperty(model,"MirrorSetName") properties("MirrorSetName") = model.MirrorSetName
	Set:$$$CanSetProperty(model,"NewGlobalCollation") properties("NewGlobalCollation") = model.NewGlobalCollation
	Set:$$$CanSetProperty(model,"NewGlobalGrowthBlock") properties("NewGlobalGrowthBlock") = model.NewGlobalGrowthBlock
	Set:$$$CanSetProperty(model,"NewGlobalIsKeep") properties("NewGlobalIsKeep") = model.NewGlobalIsKeep
	Set:$$$CanSetProperty(model,"NewGlobalPointerBlock") properties("NewGlobalPointerBlock") = model.NewGlobalPointerBlock
	Set:$$$CanSetProperty(model,"ReCreate") properties("ReCreate") = model.ReCreate
	Set:$$$CanSetProperty(model,"ReadOnly") properties("ReadOnly") = model.ReadOnly
	Set:$$$CanSetProperty(model,"Reinitialize") properties("Reinitialize") = model.Reinitialize
	Set:$$$CanSetProperty(model,"RequestSize") properties("RequestSize") = model.RequestSize
	Set:$$$CanSetProperty(model,"ResourceName") properties("ResourceName") = model.ResourceName
	Set:$$$CanSetProperty(model,"RunCatchupDBOnCreate") properties("RunCatchupDBOnCreate") = model.RunCatchupDBOnCreate
	Set:$$$CanSetProperty(model,"Size") properties("Size") = model.Size
	Set:$$$CanSetProperty(model,"SparseDB") properties("SparseDB") = model.SparseDB
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject [ Private ]
{
	Set model = {}
	Do:$Data(properties("BlockFormat")) model.%Set("BlockFormat", properties("BlockFormat"), "number")
	Do:$Data(properties("BlockSize")) model.%Set("BlockSize", properties("BlockSize"), "number")
	Do:$Data(properties("Blocks")) model.%Set("Blocks", properties("Blocks"), "number")
	Do:$Data(properties("BlocksPerMap")) model.%Set("BlocksPerMap", properties("BlocksPerMap"), "number")
	Do:$Data(properties("ClusterMountMode")) model.%Set("ClusterMountMode", properties("ClusterMountMode"), "boolean")
	Do:$Data(properties("ClusterMounted")) model.%Set("ClusterMounted", properties("ClusterMounted"), "boolean")
	Do:$Data(properties("CompressionEngine")) model.%Set("CompressionEngine", properties("CompressionEngine"), "number")
	Do:$Data(properties("CurrentMaps")) model.%Set("CurrentMaps", properties("CurrentMaps"), "number")
	Do:$Data(properties("Directory")) model.%Set("Directory", properties("Directory"), "string")
	Do:$Data(properties("DirectoryBlock")) model.%Set("DirectoryBlock", properties("DirectoryBlock"), "number")
	Do:$Data(properties("EncryptedDB")) model.%Set("EncryptedDB", properties("EncryptedDB"), "boolean")
	Do:$Data(properties("EncryptionKeyID")) model.%Set("EncryptionKeyID", properties("EncryptionKeyID"), "string")
	Do:$Data(properties("Expanding")) model.%Set("Expanding", properties("Expanding"), "boolean")
	Do:$Data(properties("ExpansionSize")) model.%Set("ExpansionSize", properties("ExpansionSize"), "number")
	Do:$Data(properties("Full")) model.%Set("Full", properties("Full"), "boolean")
	Do:$Data(properties("GlobalJournalState")) model.%Set("GlobalJournalState", properties("GlobalJournalState"), "string")
	Do:$Data(properties("InActiveMirror")) model.%Set("InActiveMirror", properties("InActiveMirror"), "boolean")
	Do:$Data(properties("LastExpansionTime")) model.%Set("LastExpansionTime", properties("LastExpansionTime"), "string")
	Do:$Data(properties("MaxSize")) model.%Set("MaxSize", properties("MaxSize"), "number")
	Do:$Data(properties("MirrorActivationRequired")) model.%Set("MirrorActivationRequired", properties("MirrorActivationRequired"), "boolean")
	Do:$Data(properties("MirrorDBCatchup")) model.%Set("MirrorDBCatchup", properties("MirrorDBCatchup"), "boolean")
	Do:$Data(properties("MirrorDBCreatedNew")) model.%Set("MirrorDBCreatedNew", properties("MirrorDBCreatedNew"), "boolean")
	Do:$Data(properties("MirrorDBName")) model.%Set("MirrorDBName", properties("MirrorDBName"), "string")
	Do:$Data(properties("MirrorDBPaused")) model.%Set("MirrorDBPaused", properties("MirrorDBPaused"), "boolean")
	Do:$Data(properties("MirrorFailoverDB")) model.%Set("MirrorFailoverDB", properties("MirrorFailoverDB"), "boolean")
	Do:$Data(properties("MirrorNoWrite")) model.%Set("MirrorNoWrite", properties("MirrorNoWrite"), "boolean")
	Do:$Data(properties("MirrorObsolete")) model.%Set("MirrorObsolete", properties("MirrorObsolete"), "boolean")
	Do:$Data(properties("MirrorSetName")) model.%Set("MirrorSetName", properties("MirrorSetName"), "string")
	Do:$Data(properties("Mirrored")) model.%Set("Mirrored", properties("Mirrored"), "boolean")
	Do:$Data(properties("Mounted")) model.%Set("Mounted", properties("Mounted"), "boolean")
	Do:$Data(properties("NewGlobalCollation")) model.%Set("NewGlobalCollation", properties("NewGlobalCollation"), "string")
	Do:$Data(properties("NewGlobalGrowthBlock")) model.%Set("NewGlobalGrowthBlock", properties("NewGlobalGrowthBlock"), "number")
	Do:$Data(properties("NewGlobalIsKeep")) model.%Set("NewGlobalIsKeep", properties("NewGlobalIsKeep"), "boolean")
	Do:$Data(properties("NewGlobalPointerBlock")) model.%Set("NewGlobalPointerBlock", properties("NewGlobalPointerBlock"), "number")
	Do:$Data(properties("NumberOfConfigDB")) model.%Set("NumberOfConfigDB", properties("NumberOfConfigDB"), "number")
	Do:$Data(properties("ROReasonCode")) model.%Set("ROReasonCode", properties("ROReasonCode"), "number")
	Do:$Data(properties("ROReasonText")) model.%Set("ROReasonText", properties("ROReasonText"), "string")
	Do:$Data(properties("ReCreate")) model.%Set("ReCreate", properties("ReCreate"), "boolean")
	Do:$Data(properties("ReadOnly")) model.%Set("ReadOnly", properties("ReadOnly"), "boolean")
	Do:$Data(properties("ReadOnlyMounted")) model.%Set("ReadOnlyMounted", properties("ReadOnlyMounted"), "boolean")
	Do:$Data(properties("Reinitialize")) model.%Set("Reinitialize", properties("Reinitialize"), "boolean")
	Do:$Data(properties("RequestSize")) model.%Set("RequestSize", properties("RequestSize"), "number")
	Do:$Data(properties("ResourceName")) model.%Set("ResourceName", properties("ResourceName"), "string")
	Do:$Data(properties("RunCatchupDBOnCreate")) model.%Set("RunCatchupDBOnCreate", properties("RunCatchupDBOnCreate"), "boolean")
	Do:$Data(properties("SFN")) model.%Set("SFN", properties("SFN"), "number")
	Do:$Data(properties("Size")) model.%Set("Size", properties("Size"), "number")
	Do:$Data(properties("Skeleton")) model.%Set("Skeleton", properties("Skeleton"), "boolean")
	Do:$Data(properties("SparseDB")) model.%Set("SparseDB", properties("SparseDB"), "boolean")
	Quit model
}

}
