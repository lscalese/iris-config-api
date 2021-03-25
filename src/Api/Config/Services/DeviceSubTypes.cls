Include Api.Config.inc

Class Api.Config.Services.DeviceSubTypes [ ProcedureBlock ]
{

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Set sc = $$$OK
	Set:model.Name="" sc = $$$ADDSC(sc,$$$ERROR(5001, "Name property is mandatory."))
	Quit sc
}

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.DeviceSubTypes).Create(model.Name,.properties)
}

ClassMethod Delete(Name As %String) As %Status
{
	$$$switchNSSys
	Quit ##class(Config.DeviceSubTypes).Delete(Name)
}

ClassMethod Exists(Name As %String) As %Boolean
{
	$$$switchNSSys
	Quit ##class(Config.DeviceSubTypes).Exists(Name)
}

ClassMethod Get(Name As %String) As %Library.DynamicObject
{
	Quit:'..Exists(Name) ""
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.DeviceSubTypes).Get(Name,.properties))
	Set properties("Name") = Name
	Quit ..ToDynamic(.properties)
}

ClassMethod List(Names As %String = "*", CPFFile As %String = "", Flags As %Integer = 0, Format As %Integer = 0) As %DynamicArray
{
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New("Config.DeviceSubTypes:List")
		Do rs.Execute(Names,CPFFile,Flags,Format)
		While rs.Next() {
			Do list.%Push(..Get(rs.Data("Name")))
		}
		Do rs.Close()
		$$$restoreNS
	}Catch(ex) {
		$$$restoreNS
		Throw ex
	}
	Return list
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("Backspace") = pObj.Backspace
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("Comments") = pObj.Comments
	Set properties("CursorControl") = pObj.CursorControl
	Set properties("EraseEOF") = pObj.EraseEOF
	Set properties("EraseEOL") = pObj.EraseEOL
	Set properties("Flags") = pObj.Flags
	Set properties("FormFeed") = pObj.FormFeed
	Set properties("Name") = pObj.Name
	Set properties("RightMargin") = pObj.RightMargin
	Set properties("ScreenLength") = pObj.ScreenLength
	Set properties("ZU22Backspace") = pObj.ZU22Backspace
	Set properties("ZU22FormFeed") = pObj.ZU22FormFeed
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"Backspace") properties("Backspace") = model.Backspace
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"CursorControl") properties("CursorControl") = model.CursorControl
	Set:$$$CanSetProperty(model,"EraseEOF") properties("EraseEOF") = model.EraseEOF
	Set:$$$CanSetProperty(model,"EraseEOL") properties("EraseEOL") = model.EraseEOL
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"FormFeed") properties("FormFeed") = model.FormFeed
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"RightMargin") properties("RightMargin") = model.RightMargin
	Set:$$$CanSetProperty(model,"ScreenLength") properties("ScreenLength") = model.ScreenLength
	Set:$$$CanSetProperty(model,"ZU22Backspace") properties("ZU22Backspace") = model.ZU22Backspace
	Set:$$$CanSetProperty(model,"ZU22FormFeed") properties("ZU22FormFeed") = model.ZU22FormFeed
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("Backspace")) model.%Set("Backspace", properties("Backspace"), "string")
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("CursorControl")) model.%Set("CursorControl", properties("CursorControl"), "string")
	Do:$Data(properties("EraseEOF")) model.%Set("EraseEOF", properties("EraseEOF"), "string")
	Do:$Data(properties("EraseEOL")) model.%Set("EraseEOL", properties("EraseEOL"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("FormFeed")) model.%Set("FormFeed", properties("FormFeed"), "string")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("RightMargin")) model.%Set("RightMargin", properties("RightMargin"), "number")
	Do:$Data(properties("ScreenLength")) model.%Set("ScreenLength", properties("ScreenLength"), "number")
	Do:$Data(properties("ZU22Backspace")) model.%Set("ZU22Backspace", properties("ZU22Backspace"), "string")
	Do:$Data(properties("ZU22FormFeed")) model.%Set("ZU22FormFeed", properties("ZU22FormFeed"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.DeviceSubTypes).Modify(model.Name,.properties)
}

}
