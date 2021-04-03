/// Description
Class Api.Config.Developers.Utils
{

/// Description
ClassMethod Show(model As %DynamicObject)
{
    Set formatter=##class(%JSON.Formatter).%New()
    Set str = ""
    Do formatter.FormatToString(model, .str)
    Write !,str
}

ClassMethod buildXmlRelease(filename As %String = "/irisrun/repo/dist/config-api_with_dependencies.xml") As %Status
{
    Do:##class(%File).Exists(filename) ##class(%File).Delete(filename)
    Set items = ""
    Set items("Api.Config.inc.INC")=""
    Set items("IORedirect.INC")=""
    Set items("Api.Config.*.CLS")=""
    Quit $SYSTEM.OBJ.Export(.items,filename)
}

}
