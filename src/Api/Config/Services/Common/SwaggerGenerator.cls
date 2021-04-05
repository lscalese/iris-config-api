/// Description
Class Api.Config.Services.Common.SwaggerGenerator
{

ClassMethod GetSwaggerDefinition() As %DynamicObject [ CodeMode = objectgenerator, ForceGenerate ]
{
    Set className = $Get(%parameter("SYSCLASS"))
    Quit:className="" 1

    #define GETTYPE(%type) $case(%type,"%Boolean":"boolean","Security.Datatype.BooleanYN":"boolean","%Float":"number","%Integer":"number",:"string")
    #define GETSWAGGERTYPE(%type) $case(%type,"%Boolean":"boolean","Security.Datatype.BooleanYN":"boolean","%Float":"number","%Integer":"integer",:"string")

    Set swaggerDef = {
        "type" : "object",
        "properties" : {},
        "required" : []
    }

    Set template = {}, key=""
    Set swaggerDef.example = template
    New $NAMESPACE
    Set ns = $NAMESPACE, $NAMESPACE = "%SYS"
    
    Set obj = $CLASSMETHOD(className, "%New")
    
    #dim class As %Dictionary.CompiledClass = ##class(%Dictionary.CompiledClass).%OpenId(className)

    For  {
        Set property = class.Properties.GetNext(.key)
        Quit:key="" 
        
        Set $NAMESPACE = ns, skip = ##class(Api.Config.Developers.Helper).skipProperty(property), $NAMESPACE = "%SYS"
        Continue:skip
        Set jsonType = $$$GETTYPE($Replace(property.Type, "Library.",""))
        Set swaggerType = $$$GETSWAGGERTYPE($Replace(property.Type, "Library.",""))
    
        Set dflt = $PROPERTY(obj,property.Name)
        Set:$ISOBJECT(dflt) dflt=""
        ;If dflt=""&&property.Required {
            Do:property.Required swaggerDef.required.%Push(property.Name)
            Do template.%Set(property.Name, dflt, jsonType)
        ;}

        Set $NAMESPACE = ns, description = ##class(Api.Config.Developers.Helper).getPropertyDescription(property.Name, className), $NAMESPACE = "%SYS"

        Do swaggerDef.properties.%Set(property.Name, {
            "type" : (swaggerType),
            "default" : (dflt),
            "description" : (description)
        })
    
    }
    
    

    Set $NAMESPACE = ns

    Set defObj = {}
    Set pName = $tr(className,"%.")
    Do defObj.%Set(pName,swaggerDef)

    If '$Get(%parameter("ISSINGLE"),0) {
        Do defObj.%Set("ListOf"_pName,{
            "type":"object",
            "properties":{
                "list" : {
                    "type":"array",
                    "items": {
                        "$ref": ("#/definitions/" _ pName)
                    }
                }
            }
        })
    }
    Do ##class(Api.Config.Developers.Utils).FormatJSON(defObj,.formatted)
    
    Do %code.WriteLine($char(9) _ "Quit "_$Piece(formatted,$$$NL,1))
    For i=2:1:$l(formatted,$$$NL) {
        Do %code.WriteLine($char(9) _ $Piece(formatted,$$$NL,i))
    }
    
    Quit 1
}

}
