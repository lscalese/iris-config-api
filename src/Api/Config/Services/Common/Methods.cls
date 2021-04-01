Include Api.Config.inc

Class Api.Config.Services.Common.Methods
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
	$$$switchNSSys
	Set list = []
	Try{
		Set rs=##class(%Library.ResultSet).%New(..#SYSCLASS_":List")
		Do rs.Execute(Names)
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

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary) [ CodeMode = objectgenerator, ForceGenerate ]
{
	Quit:%class.Name="Api.Config.Services.Common.Methods" 1

	New $NAMESPACE
    Set ns = $NAMESPACE, $NAMESPACE = "%SYS", key = ""

	#dim class As %Dictionary.CompiledClass = ##class(%Dictionary.CompiledClass).%OpenId(%parameter("SYSCLASS"))

    For  {
        Set property = class.Properties.GetNext(.key)
        Quit:key="" 
		Set $NAMESPACE = ns, continue = ##class(Api.Config.Developers.Helper).skipProperty(property), $NAMESPACE = "%SYS"
		CONTINUE:continue
        Do %code.WriteLine($CHAR(9)_$$$FormatText("Set properties(""%1"") = pObj.%1",property.Name))
    }
	Set $NAMESPACE = ns
	Quit 1
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary) [ CodeMode = objectgenerator, ForceGenerate ]
{
	Quit:%class.Name="Api.Config.Services.Common.Methods" 1

	New $NAMESPACE
    Set ns = $NAMESPACE, $NAMESPACE = "%SYS", key = ""
    
    
    #dim class As %Dictionary.CompiledClass = ##class(%Dictionary.CompiledClass).%OpenId(%parameter("SYSCLASS"))

    For  {
        Set property = class.Properties.GetNext(.key)
        Quit:key="" 
        Set $NAMESPACE = ns, continue = ##class(Api.Config.Developers.Helper).skipProperty(property), $NAMESPACE = "%SYS"
		CONTINUE:continue
        Set line = $CHAR(9) _ $$$FormatText("Set:$$$CanSetProperty(model,""%1"") properties(""%1"") = model.%1", property.Name)
        Do %code.WriteLine(line)
    }

    Set $NAMESPACE = ns
	
	Quit 1
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject [ CodeMode = objectgenerator, ForceGenerate ]
{
	Quit:%class.Name="Api.Config.Services.Common.Methods" 1

	#define GETTYPE(%type) $case(%type,"%Boolean":"boolean","Security.Datatype.BooleanYN":"boolean","%Float":"number","%Integer":"number",:"string")
    #define GETSWAGGERTYPE(%type) $case(%type,"%Boolean":"boolean","Security.Datatype.BooleanYN":"boolean","%Float":"number","%Integer":"integer",:"string")

	New $NAMESPACE
    Set ns = $NAMESPACE, $NAMESPACE = "%SYS", key = ""
    
    
    #dim class As %Dictionary.CompiledClass = ##class(%Dictionary.CompiledClass).%OpenId(%parameter("SYSCLASS"))
	Do %code.WriteLine($CHAR(9) _ "Set model = {}")
    For  {
        Set property = class.Properties.GetNext(.key)
        Quit:key="" 
        Set $NAMESPACE = ns, continue = ##class(Api.Config.Developers.Helper).skipProperty(property), $NAMESPACE = "%SYS"
		CONTINUE:continue
        Set jsonType = $$$GETTYPE($Replace(property.Type, "Library.",""))
        Do %code.WriteLine($CHAR(9) _ $$$FormatText("Do:$Data(properties(""%1"")) model.%Set(""%1"", properties(""%1""), ""%2"")", property.Name, jsonType))
    }
    Do %code.WriteLine($CHAR(9) _ "Quit model")
}

}
