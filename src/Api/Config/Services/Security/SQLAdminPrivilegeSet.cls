/// Description
Class Api.Config.Services.Security.SQLAdminPrivilegeSet Extends Api.Config.Services.Common.MethodsObjectGenerator
{

Parameter SYSCLASS = "Security.SQLAdminPrivilegeSet";

Parameter ISMAP = 1;

Parameter PIDENTIFIER = "Namespace,Grantee";

ClassMethod Exists(Namespace As %String, Grantee As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Security.SQLAdminPrivilegeSet).IDKeyExists(Namespace, Grantee)
}

ClassMethod Get(Namespace As %String, Grantee As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Namespace, Grantee) ""
	$$$switchNSSys
	Set obj = ##class(Security.SQLAdminPrivilegeSet).IDKeyOpen(Namespace, Grantee)
	Do ..ObjectToArray(.obj,.properties)
    Quit ..ToDynamic(.properties)
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Quit ..Update(model)
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	
    Set obj = ##class(Security.SQLAdminPrivilegeSet).IDKeyOpen(model.Namespace,model.Grantee)
    Set:'$ISOBJECT(obj) obj = ##class(Security.SQLAdminPrivilegeSet).%New()

    Set obj.Namespace = model.Namespace
    Set obj.Grantee = model.Grantee

    Set obj.AlterTable = model.AlterTable
	Set obj.AlterView = model.AlterView
	Set obj.CreateFunction = model.CreateFunction
	Set obj.CreateMethod = model.CreateMethod
	Set obj.CreateProcedure = model.CreateProcedure
	Set obj.CreateQuery = model.CreateQuery
	Set obj.CreateTable = model.CreateTable
	Set obj.CreateTrigger = model.CreateTrigger
	Set obj.CreateView = model.CreateView
	Set obj.DropFunction = model.DropFunction
	Set obj.DropMethod = model.DropMethod
	Set obj.DropProcedure = model.DropProcedure
	Set obj.DropQuery = model.DropQuery
	Set obj.DropTable = model.DropTable
	Set obj.DropTrigger = model.DropTrigger
	Set obj.DropView = model.DropView
	Set obj.NoCheck = model.NoCheck
	Set obj.NoIndex = model.NoIndex
	Set obj.NoLock = model.NoLock
	Set obj.NoTrigger = model.NoTrigger 
    Quit obj.%Save()
}

ClassMethod Delete(Namespace As %String, Grantee As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Security.SQLAdminPrivilegeSet).IDKeyDelete(Namespace, Grantee)
}

ClassMethod List(Namespace As %String = "*") As %DynamicArray
{
	Set list = [], tmp=0
	Try{
		Do ..ExecQry(.tmp)
	}Catch(ex) {
		
		Throw ex
	}
	
	Set k = ""
	For  {
		Set k = $order(tmp(k),1,v)
		Quit:k=""
		
		If Namespace = "*" {
			Do list.%Push(..Get($lg(v,1),$lg(v,2)))
			
		} ElseIf Namespace = $lg(v,1) {
			Do list.%Push(..Get($lg(v,1),$lg(v,2)))
		}


	}
	Return list
}

ClassMethod ExecQry(ByRef tmp)
{
	$$$switchNSSys
	Try{
		Set rs=##class(%Library.ResultSet).%New(..#SYSCLASS_":List")
		Do rs.Execute()
		While rs.Next() {
			Set tmp($i(tmp))=$lb(rs.Data("Namespace"),rs.Data("Grantee"))
		}
		Do rs.Close()
	}Catch(ex) {
		Throw ex
	}
	Kill rs
	Quit
}

/*ClassMethod ExecQry(ByRef tmp)
{
	$$$switchNSSys
	Try{
		Set tStatement = ##class(%SQL.Statement).%New()
		Set sc = tStatement.%PrepareClassQuery(..#SYSCLASS,"List")
		If $$$ISERR(sc) $$$ThrowStatus(sc)
		Set tResult = tStatement.%Execute()
		If (tResult.%SQLCODE'=0)&&(tResult.%SQLCODE'=100) $$$ThrowStatus($$$ERROR($$$SQLError, tResult.%SQLCODE, tResult.%Message)) 
		While tResult.%Next() {
			Set tmp($i(tmp))=$lb(tResult.%Get("Namespace"),tResult.%Get("Grantee"))
		}
		Kill tResult,tStatement
	} Catch(ex) {
		Throw ex
	}

	Quit
}*/
}
