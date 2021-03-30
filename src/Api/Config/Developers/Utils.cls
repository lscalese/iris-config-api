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

}
