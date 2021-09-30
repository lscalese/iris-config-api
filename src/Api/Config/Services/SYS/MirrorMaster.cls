/// Description
Class Api.Config.Services.SYS.MirrorMaster Extends Api.Config.Services.Common.MethodsObjectGenerator
{

/// Description
ClassMethod Update(model As %Library.DynamicObject) As %Status
{
    Set sc = ##class(Api.Config.Services.Mirrors).Update(model)
    Return:$$$ISERR(sc) sc

    Return ..AddDBToMirror(model.DataBases)
}

ClassMethod CreateNewMirrorSet(model As %Library.DynamicObject, SSLConfig As %Library.DynamicObject = "") As %Status
{
    Set sc = $$$OK
    Hang 2 ; test waiting activation service mirror.
    Do ..ToArray(model,.properties)
    If $ISOBJECT($Get(SSLConfig)) {
        Do ..ToArray(SSLConfig,.SSLInfo)
    }
    $$$switchNSSys
    set sc = ##class(SYS.Mirror).CreateNewMirrorSet(model.Name, model.SystemName, .properties, .SSLInfo)
    
    Return:$$$ISERR(sc) sc

    $$$restoreNS

    Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log("   = Wait became primary, checking while max 120 sec.  ")
    Set end = $zh+120
    While $zh < end {
        Hang 5
        Set memberStatus = $SYSTEM.Mirror.GetStatus()
        Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log("     - Current status "_memberStatus)
        Quit:"primary"[$$$LOWER(memberStatus)
    }
    
    Do ##class(Api.Config.Services.Loader).log($$$FormatText("   + Create MirrorSet %1 : %2", model.Name, $SYSTEM.Status.GetOneErrorText(sc)))
    Return sc
}

ClassMethod AddDBToMirror(DBList As %DynamicArray) As %Status
{
    Return:'$ISOBJECT(DBList) $$$OK
    Set sc = $$$OK
    Set iter = DBList.%GetIterator()
    
    While iter.%GetNext(.key , .value ) {
        Do ##class(Api.Config.Services.SYS.Databases).Mount(value.Directory)
        Hang 2
        $$$switchNSSys
        Set sc2 = ##class(SYS.Mirror).AddDatabase(value.Directory, value.MirrorDBName)
        Set:$$$ISERR(sc2) sc = $$$ADDSC(sc,sc2)
        Hang 2
        $$$restoreNS
        Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log($$$FormatText("   + Add Database %1 to mirror with DB MirrorName %2 : %3",value.Directory, value.MirrorDBName, $SYSTEM.Status.GetOneErrorText(sc2)))    
    }

    Return sc
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
    Set sc = ..CreateNewMirrorSet(model.Config, model.SSLInfo)
    Return:$$$ISERR(sc) sc
    Return ..AddDBToMirror(model.Databases)
}

ClassMethod Exists(Name As %String) As %Boolean
{
    Quit ##class(Api.Config.Services.Mirrors).Exists(Name)
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
    Set iter = model.%GetIterator()

    While iter.%GetNext(.key , .value ) {
        Set properties(key) = value
    }

    Return
}

ClassMethod AuthorizeNewMembers(members As %String = "backup,report", mirrorName As %String = "DEMO", timeInSecond As %Integer = 1800) As %Status
{
    ;Job ##class(Api.Config.Services.SYS.MirrorMaster).AuthorizeNewMembers()
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"

    Set sc = $$$OK, pProxy = { "Members":($zcvt(members,"u")),"MirrorName":($zcvt(mirrorName,"u"))}, end = $zh+timeInSecond
    While $zh < end {
        Do ##class(%CSP.UI.Portal.Mirror.EditFailover).AuthorizeNewMembers(pProxy)
        Hang 3
    }

    Return sc
}

}
