/// Description
Class Api.Config.Services.Security.SQLPrivileges Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Security.SQLPrivileges";

ClassMethod Exists(Namespace, SQLObject, Privilege, Grantee, Grantor) As %Boolean
{
    ;w ##class(Api.Config.Services.Security.SQLPrivileges).Exists("USER","1,Api_Config.TempStream","s","test1","_SYSTEM")
	$$$switchNSSys
	Quit ##class(Security.SQLPrivileges).IDKeyExists(Namespace, SQLObject, Privilege, Grantee, Grantor)
}

ClassMethod Get(Namespace, SQLObject, Privilege, Grantee, Grantor) As %DynamicObject
{
    ;zw ##class(Api.Config.Services.Security.SQLPrivileges).Get("USER","1,Api_Config.TempStream","s","test1","_SYSTEM")
    Quit:'..Exists(Namespace, SQLObject, Privilege, Grantee, Grantor) ""
    $$$switchNSSys
    Set obj = ##class(Security.SQLPrivileges).IDKeyOpen(Namespace, SQLObject, Privilege, Grantee, Grantor)
    Do ..ObjectToArray(.obj,.properties)
    Quit ..ToDynamic(.properties)
}

ClassMethod Update(model As %DynamicObject) As %Status
{
    New $NAMESPACE
    Set lst = [], sc = $$$OK, ns = $NAMESPACE
    If model.%IsDefined("PrivList"), model.PrivList'="" {
        For i=1:1:$LENGTH(model.PrivList) {
            Set copyModel = {}.%FromJSON(model.%ToJSON())
            Set copyModel.Privilege = $Extract(model.PrivList,i)
            Do lst.%Push(copyModel)
        }
    } Else {
        Do lst.%Push(model)
    }

    Set iter = lst.%GetIterator()
    Set $NAMESPACE="%SYS"
    While iter.%GetNext(.key,.value) {
        
        Set namespace = value.Namespace, sqlobject=value.SQLObject, privilege=value.Privilege
        
        &SQL(DELETE Security.SQLPrivileges WHERE Namespace=:namespace AND SQLObject=:sqlobject AND Privilege=:privilege)
            
        Set sp = ##class(Security.SQLPrivileges).%New()
        Set:value.%IsDefined("Grantable") sp.Grantable = value.Grantable
        Set sp.Grantee = value.Grantee
        Set sp.Grantor = value.Grantor
        Set sp.Namespace = value.Namespace
        Set sp.Privilege = value.Privilege
        Set sp.SQLObject = value.SQLObject
        Set sc2 = sp.%Save()
        Set:$$$ISERR(sc2) sc = $$$ADDSC(sc,sc2)
        
    }
    Set $NAMESPACE=ns

    Quit sc
}

ClassMethod Create(model As %DynamicObject) As %Status
{
    Quit ..Update(model)
}

ClassMethod Delete(Namespace, SQLObject, Privilege, Grantee, Grantor) As %Status
{
    ;zw ##class(Api.Config.Services.Security.SQLPrivileges).Get("USER","1,Api_Config.TempStream","s","test1","_SYSTEM")
    Quit:'..Exists(Namespace, SQLObject, Privilege, Grantee, Grantor) $$$OK
    $$$switchNSSys
    Set obj = ##class(Security.SQLPrivileges).IDKeyDelete(Namespace, SQLObject, Privilege, Grantee, Grantor)
    Do ..ObjectToArray(.obj,.properties)
    Quit ..ToDynamic(.properties)
}

}
