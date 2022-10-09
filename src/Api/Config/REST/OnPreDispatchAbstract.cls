/// Create a subclass of this class to implement the OnPreDispatch of Api.Config.Rest.Main
Class Api.Config.REST.OnPreDispatchAbstract [ Abstract ]
{

ClassMethod OnPreDispatch(pUrl As %String, pMethod As %String, ByRef pContinue As %Boolean) As %Status [ Abstract ]
{
    Quit $$$ERROR($$$NotImplemented)
}

ClassMethod GetSubClass() As %String
{
    #dim rs As %SQL.StatementResult = ##class(%Dictionary.ClassDefinitionQuery).SubclassOfFunc($CLASSNAME())

    Return $Select(rs.%Next():rs.%GetData(1), 1: "")
}

}
