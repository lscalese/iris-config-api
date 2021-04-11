Include Api.Config.inc

Class Api.Config.Services.SYS.Databases Extends Api.Config.Services.Common.MethodsObjectGenerator
{

Parameter SYSCLASS = "SYS.Database";

Parameter PNAME = "Directory";

Parameter PIDENTIFIER = "Directory";

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
        Set tStatement = ##class(%SQL.Statement).%New()
        Set sc = tStatement.%PrepareClassQuery(..#SYSCLASS,"CompactLocalList")
        If $$$ISERR(sc) $$$ThrowStatus(sc)
        Set tResult = tStatement.%Execute(mask)
        If (tResult.%SQLCODE'=0)&&(tResult.%SQLCODE'=100) $$$ThrowStatus($$$ERROR($$$SQLError, tResult.%SQLCODE, tResult.%Message)) 
		While tResult.%Next() {
            Do dbList.%Push(..Get(tResult.%Get("Directory")))
        }
		kill tStatement, tResult
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

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

}
