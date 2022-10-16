Class Api.Config.Services.Security.SQLHelper
{

ClassMethod AddByModelHelper(model As %DynamicObject) As %Status
{
    Set sc = $$$OK

    Set base = {"Namespace" : (model.Namespace)}
    Set:model.%IsDefined("Grantee") base.Grantee = model.Grantee
    Set:model.%IsDefined("Grantor") base.Grantor = model.Grantor
    Set:model.%IsDefined("Grantable") base.Grantable = model.Grantable
    

    TSTART

    For property = "Table", "View", "SQLProc" {
        If model.%IsDefined(property) {
            Set sc = $$$ADDSC(sc, ..AlimSQLObject(model.Namespace, model.%Get(property), property, .sqlObject))
            
            If $Data(sqlObject) {
                Set base.Privileges = model.%Get(property).Privileges

                Set key = ""
                For  {
                    Set key = $Order(sqlObject(key), 1, value)
                    Quit:key=""
                    Set base.SQLObject = value
                    Set sc = $$$ADDSC(sc, ..AddToSQLPrivileges(base))
                }
            }
            Kill sqlObject
        }
    }
        
    If $$$ISERR(sc) {
        TROLLBACK
    } Else {
        TCOMMIT
    }
    Quit sc
}

ClassMethod AlimSQLObject(namespace As %String, model As %DynamicObject, type As %String, ByRef sqlObject As %Binary) As %String
{
    New $Namespace
    Set oldNs = $Namespace
    Set $Namespace = namespace

    Set information("Table") = "INFORMATION_SCHEMA.TABLES"
    Set information("Table","fSchema") = "TABLE_SCHEMA"
    Set information("Table","fName") = "TABLE_NAME"
    Set information("Table", "objType") = 1

    Set information("View") = "INFORMATION_SCHEMA.VIEWS"
    Set information("View","fSchema") = "TABLE_NAME"
    Set information("View","fName") = "TABLE_SCHEMA"
    Set information("View", "objType") = 3
    
    Set information("SQLProc") = "INFORMATION_SCHEMA.ROUTINES"
    Set information("SQLProc","fSchema") = "ROUTINE_NAME"
    Set information("SQLProc","fName") = "ROUTINE_SCHEMA"
    Set information("SQLProc", "objType") = 9
    
    
    Set sc = $$$OK
    
    If model.%IsDefined("Names") {
        set iter = model.Names.%GetIterator()
        while iter.%GetNext(.key, .value) {
            Set $List(schemasLb, *+1) = value
            Set sqlObject($Increment(sqlObject)) = information(type, "objType") _ "," _  value
        }
        Kill iter, key, value

    }
    
    If model.%IsDefined("Schemas") {
        Set schemasLb = ""
        set iter = model.Schemas.%GetIterator()
        while iter.%GetNext(.key, .value) {
            Set $List(schemasLb, *+1) = value
        }
        Kill iter, key, value

        Set tStatement = ##class(%SQL.Statement).%New()
        
        Set sql = "SELECT "_ information(type, "fSchema") _ "," _ information(type, "fName") _" FROM " _ information(type) _" WHERE " _ information(type, "fSchema") _ " %INLIST ?"
        Set sc = tStatement.%Prepare(sql)
        If $$$ISERR(sc) $$$ThrowStatus(sc)
    
        
        Set tResult = tStatement.%Execute(schemasLb)
        If (tResult.%SQLCODE'=0)&&(tResult.%SQLCODE'=100) $$$ThrowStatus($$$ERROR($$$SQLError, tResult.%SQLCODE, tResult.%Message)) 
        While tResult.%Next() {
            Set sqlObject($Increment(sqlObject)) = information(type, "objType") _ "," _ tResult.%GetData(1) _ "." _ tResult.%GetData(2)
        }

        Kill tResult
    }
    Set $Namespace = oldNs

    Quit sc
}

ClassMethod AddToSQLPrivileges(model As %DynamicObject) As %Status
{
    Set sc = $$$OK

    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Set namespace = model.Namespace, sqlobject=model.SQLObject, grantee = model.Grantee


    Set privileges = ""
    If model.Privileges.%IsA("%DynamicArray") {
        Set iter = model.Privileges.%GetIterator()
        
        While iter.%GetNext(.key, .value) {
            Set privileges = privileges _ $$$LOWER($Extract(value,1))
        }

    } Else {
        Set privileges = $$$LOWER(model.Privileges)
    }
    
    For i=1:1:$Length(privileges) {
        Set privilege = $Extract(privileges, i)
    
        &SQL(DELETE Security.SQLPrivileges WHERE Namespace=:namespace AND SQLObject=:sqlobject AND Privilege=:privilege and Grantee=:grantee)
        If (SQLCODE'=0)&&(SQLCODE'=100) $$$ThrowStatus($$$ERROR($$$SQLError, SQLCODE)) 
        
        Set sp = ##class(Security.SQLPrivileges).%New()
        Set:model.%IsDefined("Grantable") sp.Grantable = model.Grantable
        Set sp.Grantee = model.Grantee
        Set sp.Grantor = model.Grantor
        Set sp.Namespace = model.Namespace
        Set sp.Privilege = privilege
        Set sp.SQLObject = model.SQLObject
        Set sc2 = sp.%Save()
        Set:$$$ISERR(sc2) sc = $$$ADDSC(sc,sc2)
    }

    Quit sc
}

}
