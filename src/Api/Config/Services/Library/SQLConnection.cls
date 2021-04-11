/// Description
Class Api.Config.Services.Library.SQLConnection Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "%Library.SQLConnection";

ClassMethod Exists(Name As %String) As %Boolean
{
	$$$switchNSSys
    Quit ##class(%Library.SQLConnection).NameIndexExists(Name)
}

ClassMethod Get(Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Name) ""
	$$$switchNSSys
	Set obj = ##class(%Library.SQLConnection).NameIndexOpen(Name)
    Do ..ObjectToArray(obj,.properties)
    Quit ..ToDynamic(.properties)
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Quit ..Update(model)
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	$$$switchNSSys
    Set obj = ##class(%Library.SQLConnection).NameIndexOpen(model.Name)
    Set:'$ISOBJECT(obj) obj = ##class(%Library.SQLConnection).%New()
	Set:(model.%IsDefined("DSN")&&($Ascii(model.%Get("DSN"))'=0)) obj.DSN = model.DSN
	Set:(model.%IsDefined("Name")&&($Ascii(model.%Get("Name"))'=0)) obj.Name = model.Name
	Set:(model.%IsDefined("OnConnectStatement")&&($Ascii(model.%Get("OnConnectStatement"))'=0)) obj.OnConnectStatement = model.OnConnectStatement
	Set:(model.%IsDefined("ReverseOJ")&&($Ascii(model.%Get("ReverseOJ"))'=0)) obj.ReverseOJ = model.ReverseOJ
	Set:(model.%IsDefined("URL")&&($Ascii(model.%Get("URL"))'=0)) obj.URL = model.URL
	Set:(model.%IsDefined("Usr")&&($Ascii(model.%Get("Usr"))'=0)) obj.Usr = model.Usr
	Set:(model.%IsDefined("bUnicodeStream")&&($Ascii(model.%Get("bUnicodeStream"))'=0)) obj.bUnicodeStream = model.bUnicodeStream
	Set:(model.%IsDefined("bindTSasString")&&($Ascii(model.%Get("bindTSasString"))'=0)) obj.bindTSasString = model.bindTSasString
	Set:(model.%IsDefined("classpath")&&($Ascii(model.%Get("classpath"))'=0)) obj.classpath = model.classpath
	Set:(model.%IsDefined("driver")&&($Ascii(model.%Get("driver"))'=0)) obj.driver = model.driver
	Set:(model.%IsDefined("isJDBC")&&($Ascii(model.%Get("isJDBC"))'=0)) obj.isJDBC = model.isJDBC
	Set:(model.%IsDefined("needlongdatalen")&&($Ascii(model.%Get("needlongdatalen"))'=0)) obj.needlongdatalen = model.needlongdatalen
	Set:(model.%IsDefined("noconcat")&&($Ascii(model.%Get("noconcat"))'=0)) obj.noconcat = model.noconcat
	Set:(model.%IsDefined("nodefq")&&($Ascii(model.%Get("nodefq"))'=0)) obj.nodefq = model.nodefq
	Set:(model.%IsDefined("nofnconv")&&($Ascii(model.%Get("nofnconv"))'=0)) obj.nofnconv = model.nofnconv
	Set:(model.%IsDefined("nvl")&&($Ascii(model.%Get("nvl"))'=0)) obj.nvl = model.nvl
	Set:(model.%IsDefined("properties")&&($Ascii(model.%Get("properties"))'=0)) obj.properties = model.properties
	Set:(model.%IsDefined("pwd")&&($Ascii(model.%Get("pwd"))'=0)) obj.pwd = model.pwd
	Set:(model.%IsDefined("useCAST")&&($Ascii(model.%Get("useCAST"))'=0)) obj.useCAST = model.useCAST
	Set:(model.%IsDefined("useCASTCHAR")&&($Ascii(model.%Get("useCASTCHAR"))'=0)) obj.useCASTCHAR = model.useCASTCHAR
	Set:(model.%IsDefined("useCOALESCE")&&($Ascii(model.%Get("useCOALESCE"))'=0)) obj.useCOALESCE = model.useCOALESCE
	Set:(model.%IsDefined("xadriver")&&($Ascii(model.%Get("xadriver"))'=0)) obj.xadriver = model.xadriver
    Quit obj.%Save()
}

ClassMethod Delete(Name As %String) As %Status
{
	$$$switchNSSys
    Quit ##class(%Library.SQLConnection).NameIndexDelete(Name)
}

ClassMethod ExecQry(Names, ByRef tmp)
{
	$$$switchNSSys
	Try{
		Set tStatement = ##class(%SQL.Statement).%New()
		Set sc = tStatement.%PrepareClassQuery(..#SYSCLASS,"ByName")
		If $$$ISERR(sc) $$$ThrowStatus(sc)
		Set tResult = tStatement.%Execute(Names)
		If (tResult.%SQLCODE'=0)&&(tResult.%SQLCODE'=100) $$$ThrowStatus($$$ERROR($$$SQLError, tResult.%SQLCODE, tResult.%Message)) 
		While tResult.%Next() {
			Set tmp($i(tmp))=tResult.%Get("Connection_Name")
		}
		Kill tResult,tStatement
	} Catch(ex) {
		Throw ex
	}

	Quit
}

}
