/// Description
Class Api.Config.Developers.Utils [ System = 2 ]
{

/// Description
ClassMethod Show(model As %DynamicObject)
{
    Set str = ""
    Do ..FormatJSON(model,.str)
    Write !,str
}

ClassMethod FormatJSON(model As %DynamicObject, Output formatted)
{
    If '##class(%Dictionary.CompiledClass).%ExistsId("%JSON.Formatter") { ; hs 2018 compatibility ...
	Set formatted = model.%ToJSON()
	Quit
    }
    Set formatter=##class(%JSON.Formatter).%New()
    Set formatted = ""
    Do formatter.FormatToString(model, .formatted)
    Quit
}

/// zw ##class(Api.Config.Developers.Utils).buildXmlRelease()
ClassMethod buildXmlRelease(filename As %String = "/irisrun/repo/dist/config-api_with_dependencies.xml") As %Status
{

    Do:##class(%File).Exists(filename) ##class(%File).Delete(filename)
    Set items = ""
    Set items("Api.Config.inc.INC")=""
    Set items("IORedirect.INC")=""
    Set items("Api.Config.*.CLS")=""
    Set items("IORedirect.*.CLS")=""
    Quit $SYSTEM.OBJ.Export(.items,filename)
}

}
