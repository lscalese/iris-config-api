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
    Set lst = [], sc = $$$OK, ns = $NAMESPACE
    Set:model.Grantor="" model.Grantor = "_SYSTEM"
    Set:model.Namespace="" model.Namespace = $NAMESPACE
    Set:model.Grantable="" model.Grantable = 0

    New $NAMESPACE
    If $EXTRACT(model.SQLObject , *)= "*" {
        Set arg = $EXTRACT(model.SQLObject, 3, *-1)
        Set sql = "SELECT SqlQualifiedNameQ from %Dictionary.CompiledClass WHERE SqlQualifiedNameQ %STARTSWITH(?) and ClassType = 'persistent'"
        Set tStatement = ##class(%SQL.Statement).%New()
        Set sc = tStatement.%Prepare(sql)
        If $$$ISERR(sc) $$$ThrowStatus(sc)
        Set tResult = tStatement.%Execute(arg)
        If (tResult.%SQLCODE'=0)&&(tResult.%SQLCODE'=100) $$$ThrowStatus($$$ERROR($$$SQLError, tResult.%SQLCODE, tResult.%Message)) 
        While tResult.%Next() {
            Set tObj = tResult.%Get("SqlQualifiedNameQ")
            Set copyModel = {}.%FromJSON(model.%ToJSON())
            If model.%IsDefined("PrivList"), model.PrivList'="" {
                For i=1:1:$LENGTH(model.PrivList) {

                    CONTINUE:"adirsu"'[$$$LOWER($Extract(model.PrivList,i))

                    Set copyModel = {}.%FromJSON(model.%ToJSON())
                    Set copyModel.Privilege = $$$LOWER($Extract(model.PrivList,i))
                    Set copyModel.SQLObject = $e(model.SQLObject,1,2)_tResult.%Get("SqlQualifiedNameQ")
                    Do lst.%Push(copyModel)
                }
            } Else {
                Set copyModel = {}.%FromJSON(model.%ToJSON())
                Set copyModel.SQLObject = $e(model.SQLObject,1,2)_tResult.%Get("SqlQualifiedNameQ")
                Do lst.%Push(model)
            }
        }
    } ElseIf model.%IsDefined("PrivList") && (model.PrivList'="") {
        For i=1:1:$LENGTH(model.PrivList) {
            CONTINUE:"adirsu"'[$$$LOWER($Extract(model.PrivList,i))
            Set copyModel = {}.%FromJSON(model.%ToJSON())
            Set copyModel.Privilege = $$$LOWER($Extract(model.PrivList,i))
            Do lst.%Push(copyModel)
        }
    } Else {
        Do lst.%Push(model)
    }

    Set iter = lst.%GetIterator()
    Set $NAMESPACE="%SYS"
    While iter.%GetNext(.key,.value) {
        
        Set namespace = value.Namespace, sqlobject=value.SQLObject, privilege=value.Privilege, grantee = value.Grantee
        &SQL(DELETE Security.SQLPrivileges WHERE Namespace=:namespace AND SQLObject=:sqlobject AND Privilege=:privilege and Grantee=:grantee)
            
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

ClassMethod List(Namespace As %String, Grantee As %String) As %DynamicArray
{
	Set list = [], tmp=0
	Try{
		Do ..ExecQry($$$LOWER(Namespace),$$$LOWER(Grantee),.tmp)
	}Catch(ex) {
		
		Throw ex
	}
	
	Set k = ""
	For  {
		Set k = $order(tmp(k),1,v)
		Quit:k=""
		Do list.%Push(v)
	}
	Return list
}

ClassMethod ExecQry(Namespace, Grantee, ByRef tmp)
{
    $$$switchNSSys
	Try{
		Set rs=##class(%Library.ResultSet).%New(..#SYSCLASS_":List")
		Do rs.Execute()
		While rs.Next() {
            Set tNS = $$$LOWER(rs.Data("Namespace")), tGrantee = $$$LOWER(rs.Data("Grantee"))
            
            If Namespace '= "*" && (tNS '= Namespace) {
                CONTINUE
            }
            If Grantee '= "*" && (tGrantee '= Grantee) {
                CONTINUE
            }
            
			Set tmp($i(tmp))= {
                "Grantable" : (rs.Data("Grantable")),
                "Grantee" : (rs.Data("Grantee")),
                "Grantor" : (rs.Data("Grantor")),
                "Namespace" : (rs.Data("Namespace")),
                "Privilege" : (rs.Data("Privilege")),
                "SQLObject" : (rs.Data("SQLObject"))
            }
		}
		Do rs.Close()
	}Catch(ex) {
		Throw ex
	}
	Kill rs
	Quit
}

}
