Class Api.Config.Services.SYS.MirrorFailOver Extends Api.Config.Services.Common.MethodsObjectGenerator
{

/// Description
ClassMethod JoinMirrorAsFailoverMember(config As %DynamicObject, localInfo As %DynamicObject, SSLConfig As %DynamicObject) As %Status
{
    Do:$ISOBJECT($Get(localInfo)) ##class(Api.Config.Services.SYS.MirrorMaster).ToArray(localInfo, .pLocalInfo)
    Do:$ISOBJECT($Get(SSLConfig)) ##class(Api.Config.Services.SYS.MirrorMaster).ToArray(SSLConfig,.SSLInfo)
    
    $$$switchNSSys

    Set sc = ##class(SYS.Mirror).JoinMirrorAsFailoverMember(config.Name,config.SystemName,config.InstanceName,config.AgentAddress,config.AgentPort,.pLocalInfo, .SSLInfo)
    Return:$$$ISERR(sc) sc

    Do ##Class(Config.Mirrors).Get(config.Name,.Properties)
    $$$restoreNS

    If +Properties("UseSSL") {
        Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log("   = This member must be approved on primary instance, check (while max 120 sec.)  ")
        Set end = $zh+120
        While $zh < end {
            Hang 2
            Set memberStatus = $SYSTEM.Mirror.GetStatus()
            Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log("     - Current status "_memberStatus)
            Quit:"backupconnectedsynchronizing"[$$$LOWER(memberStatus)
        }
    }

    Return sc
}

ClassMethod JoinMirrorAsAsyncMember(config As %DynamicObject, localInfo As %DynamicObject, SSLConfig As %DynamicObject) As %Status
{
    Do:$ISOBJECT($Get(localInfo)) ##class(Api.Config.Services.SYS.MirrorMaster).ToArray(localInfo, .pLocalInfo)
    Do:$ISOBJECT($Get(SSLConfig)) ##class(Api.Config.Services.SYS.MirrorMaster).ToArray(SSLConfig, .SSLInfo)
    Set type = $CASE($$$LOWER(config.AsyncMemberType),"disasterrecovery":0,"dr":0,"readonlyreporting":1,"roreporting":1,"ro":1,"readwritereporting":2,"rwreporting":2,"rw":2,:0)
    
    $$$switchNSSys
    
    Set sc =  ##class(SYS.Mirror).JoinMirrorAsAsyncMember(config.Name,config.SystemName,config.InstanceName,config.AgentAddress,config.AgentPort,type, .pLocalInfo, .SSLInfo)
    Return:$$$ISERR(sc) sc

    Do ##Class(Config.Mirrors).Get(config.Name,.Properties)
    $$$restoreNS

    If +Properties("UseSSL") {
        Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log("   = This member must be approved on primary instance, check (while max 120 sec.)  ")
        Set end = $zh+120
        While $zh < end {
            Hang 2
            Set memberStatus = $SYSTEM.Mirror.GetStatus()
            Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log("     - Current status "_memberStatus)
            Quit:"backupconnectedsynchronizing"[$$$LOWER(memberStatus)
        }
    }
    
    Return sc
}

ClassMethod ActivateMirroredDBs(DBList As %DynamicArray) As %Status
{
    Set sc = $$$OK
    Set iter = DBList.%GetIterator()

    While iter.%GetNext(.key , .value ) {
        Hang 3
        $$$switchNSSys
        
        Set sc2 = ##class(SYS.Mirror).ActivateMirroredDatabase(value.Directory)
        Set:$$$ISERR(sc2) sc = $$$ADDSC(sc,sc2)
        $$$restoreNS
        Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log($$$FormatText("   + Activate mirrored database %1 : %2",value.Directory, $SYSTEM.Status.GetOneErrorText(sc2)))
        
        Set sfn = +$zu(49, value.Directory)
        $$$switchNSSys
        set sc3 = ##class(SYS.Mirror).CatchupDB($lb(sfn))
        $$$restoreNS
        Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log($$$FormatText("   + Catch up database %1 (sfn's %2) : %3",value.Directory, sfn, $SYSTEM.Status.GetOneErrorText(sc3)))
    
    }

    Return sc
}

/// Description
ClassMethod Create(model As %DynamicObject) As %Status
{
    If 'model.Config.AsyncMember {
        Set sc = ..JoinMirrorAsFailoverMember(model.Config, model.LocalInfo, model.SSLInfo)
    } Else {
        Set sc = ..JoinMirrorAsAsyncMember(model.Config, model.LocalInfo, model.SSLInfo)
    }
    Return:$$$ISERR(sc) sc
    Return ..ActivateMirroredDBs(model.Databases)
}

/// Description
ClassMethod Update() As %Status
{
    Return $$$ERROR($$$NotImplemented)
}

ClassMethod Exists(Name As %String) As %Boolean
{
    Quit $$$NO
}

}
