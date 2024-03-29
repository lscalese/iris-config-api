Include Api.Config.inc

Class Api.Config.Services.Common.Methods Extends Api.Config.Services.Common.MethodsObjectGenerator
{

Parameter SYSCLASS;

ClassMethod Exists(Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit $CLASSMETHOD(..#SYSCLASS, "Exists", Name)
}

ClassMethod Get(Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Name) ""
	$$$switchNSSys
	$$$ThrowOnError($CLASSMETHOD(..#SYSCLASS, "Get", Name,.properties))
	Set properties("Name") = Name
	Quit ..ToDynamic(.properties)
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit $CLASSMETHOD(..#SYSCLASS, "Create",model.Name,.properties)
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit $CLASSMETHOD(..#SYSCLASS, "Modify", model.Name,.properties)
}

ClassMethod Delete(Name As %String) As %Status
{
	$$$switchNSSys
	Quit $CLASSMETHOD(..#SYSCLASS, "Delete",Name)
}

ClassMethod List(Names As %String = "*") As %DynamicArray
{
	Set list = [], tmp=0
	Try{
		Do ..ExecQry(Names,.tmp)
	}Catch(ex) {
		
		Throw ex
	}
	
	Set k = ""
	For  {
		Set k = $order(tmp(k),1,v)
		Quit:k=""
		Do list.%Push(..Get(v))
	}
	Return list
}

ClassMethod ExecQry(Names, ByRef tmp)
{
	$$$switchNSSys
	Try{
		Set tStatement = ##class(%SQL.Statement).%New()
		Set sc = tStatement.%PrepareClassQuery(..#SYSCLASS,"List")
		If $$$ISERR(sc) $$$ThrowStatus(sc)
		Set tResult = tStatement.%Execute(Names)
		If (tResult.%SQLCODE'=0)&&(tResult.%SQLCODE'=100) $$$ThrowStatus($$$ERROR($$$SQLError, tResult.%SQLCODE, tResult.%Message)) 
		While tResult.%Next() {
			Set tmp($i(tmp))=tResult.%Get("Name")
		}
		Kill tResult,tStatement
	} Catch(ex) {
		Throw ex
	}

	Quit
}

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

}
