Include Api.Config.inc

Class Api.Config.Services.Common.MethodsObjectGenerator
{

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary) [ CodeMode = objectgenerator, ForceGenerate ]
{
	Quit:$get(%parameter("SYSCLASS"))="" 1

	New $NAMESPACE
    Set ns = $NAMESPACE, $NAMESPACE = "%SYS", key = ""

	#dim class As %Dictionary.CompiledClass = ##class(%Dictionary.CompiledClass).%OpenId(%parameter("SYSCLASS"))

    For  {
        Set property = class.Properties.GetNext(.key)
        Quit:key="" 
		Set $NAMESPACE = ns, canContinue = ##class(Api.Config.Developers.Helper).skipProperty(property), $NAMESPACE = "%SYS"
		CONTINUE:canContinue
        Do %code.WriteLine($CHAR(9)_$$$FormatText("Set properties(""%1"") = pObj.%1",property.Name))
    }
	Set $NAMESPACE = ns
	Quit 1
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary) [ CodeMode = objectgenerator, ForceGenerate ]
{
	;Quit:$lf($lfs(%parameter("NOTIN"),","),%class.Name)>0 1
    Quit:$get(%parameter("SYSCLASS"))="" 1

	New $NAMESPACE
    Set ns = $NAMESPACE, $NAMESPACE = "%SYS", key = ""
    
    
    #dim class As %Dictionary.CompiledClass = ##class(%Dictionary.CompiledClass).%OpenId(%parameter("SYSCLASS"))

    For  {
        Set property = class.Properties.GetNext(.key)
        Quit:key="" 
        Set $NAMESPACE = ns, canContinue = ##class(Api.Config.Developers.Helper).skipProperty(property), $NAMESPACE = "%SYS"
		CONTINUE:canContinue
        Set line = $CHAR(9) _ $$$FormatText("Set:$$$CanSetProperty(model,""%1"") properties(""%1"") = model.%1", property.Name)
        Do %code.WriteLine(line)
    }

    Set $NAMESPACE = ns
	
	Quit 1
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject [ CodeMode = objectgenerator, ForceGenerate ]
{
	Quit:$get(%parameter("SYSCLASS"))="" 1

	#define GETTYPE(%type) $case(%type,"%Boolean":"boolean","Security.Datatype.BooleanYN":"boolean","%Float":"number","%Integer":"number",:"string")
    #define GETSWAGGERTYPE(%type) $case(%type,"%Boolean":"boolean","Security.Datatype.BooleanYN":"boolean","%Float":"number","%Integer":"integer",:"string")

	New $NAMESPACE
    Set ns = $NAMESPACE, $NAMESPACE = "%SYS", key = ""
    
    
    #dim class As %Dictionary.CompiledClass = ##class(%Dictionary.CompiledClass).%OpenId(%parameter("SYSCLASS"))
	Do %code.WriteLine($CHAR(9) _ "Set model = {}")
    For  {
        Set property = class.Properties.GetNext(.key)
        Quit:key="" 
        Set $NAMESPACE = ns, canContinue = ##class(Api.Config.Developers.Helper).skipProperty(property), $NAMESPACE = "%SYS"
		CONTINUE:canContinue
        Set jsonType = $$$GETTYPE($Replace(property.Type, "Library.",""))
        Do %code.WriteLine($CHAR(9) _ $$$FormatText("Do:$Data(properties(""%1"")) model.%Set(""%1"", properties(""%1""), ""%2"")", property.Name, jsonType))
    }
    Do %code.WriteLine($CHAR(9) _ "Quit model")
}

}
