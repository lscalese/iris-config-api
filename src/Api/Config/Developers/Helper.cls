/// dev helper
/// zw ##class(Api.Config.Developers.Helper).GenCommonMethod("","")
/// zw ##class(Api.Config.Developers.Helper).GenObjectToArray("","")
/// zw ##class(Api.Config.Developers.Helper).GenToDynamic("","")
/// do ##class(Api.Config.Developers.Helper).ShowSwaggerDef("")
Class Api.Config.Developers.Helper [ System = 2 ]
{

/// Description
ClassMethod GenCommonMethod(className As %String, outClassName As %String) As %Status
{
    Set sc = $$$OK
    Do ..GenToDynamic(className, outClassName)
    Do ..GenToArray(className, outClassName)
    Do ..GenObjectToArray(className, outClassName)
    Do ..ShowSwaggerDef(className)
    Return sc
}

ClassMethod GenToArray(className As %String, outClassName As %String) As %Status
{
        #define GETTYPE(%type) $case(%type,"%Boolean":"boolean","Security.Datatype.BooleanYN":"boolean","%Float":"number","%Integer":"number",:"string")
    #define GETSWAGGERTYPE(%type) $case(%type,"%Boolean":"boolean","Security.Datatype.BooleanYN":"boolean","%Float":"number","%Integer":"integer",:"string")

    Write !," * Generate method ToArray to "_outClassName _ " "
    Set sc = $$$OK, key=""
    
    ;Set outClass = ##class(%Dictionary.ClassDefinition).%OpenId(outClassName)
    Set methodName = "ToArray"
    
    Set method = ##class(%Dictionary.MethodDefinition).%OpenId(outClassName_"||"_methodName,,.sc)
    Set:'$ISOBJECT(method) method = ##class(%Dictionary.MethodDefinition).%New()
    Set method = ##class(%Dictionary.MethodDefinition).%New()
    Set method.Name = methodName
    Set method.ClassMethod = $$$YES
    Set method.FormalSpec = "model:%Library.DynamicObject,*properties:%Binary"
    Set method.ReturnType = ""
    Do method.parentSetObjectId(outClassName)

    New $NAMESPACE
    Set ns = $NAMESPACE, $NAMESPACE = "%SYS"
    
    
    #dim class As %Dictionary.CompiledClass = ##class(%Dictionary.CompiledClass).%OpenId(className)

    For  {
        Set property = class.Properties.GetNext(.key)
        Quit:key="" 
        Continue:..skipProperty(property)
        ; Set jsonType = $$$GETTYPE($Replace(property.Type, "Library.",""))
        ; Set swaggerType = $$$GETSWAGGERTYPE($Replace(property.Type, "Library.",""))
        Set line = $CHAR(9) _ $$$FormatText("Set:$$$CanSetProperty(model,""%1"") properties(""%1"") = model.%1", property.Name)
        Do method.Implementation.WriteLine(line)
    }
    Do method.Implementation.WriteLine($CHAR(9) _ "Quit")

    Set $NAMESPACE = ns
    Set sc = method.%Save()
    Write $SYSTEM.Status.GetOneErrorText(sc)
    Return sc
}

ClassMethod GenToDynamic(className As %String, outClassName As %String) As %Status
{
    #define GETTYPE(%type) $case(%type,"%Boolean":"boolean","Security.Datatype.BooleanYN":"boolean","%Float":"number","%Integer":"number",:"string")
    #define GETSWAGGERTYPE(%type) $case(%type,"%Boolean":"boolean","Security.Datatype.BooleanYN":"boolean","%Float":"number","%Integer":"integer",:"string")

    Write !," * Generate method ToDynamic to "_outClassName _ " "
    Set sc = $$$OK, key=""
    
    ;Set outClass = ##class(%Dictionary.ClassDefinition).%OpenId(outClassName)
    Set methodName = "ToDynamic"
    
    Set method = ##class(%Dictionary.MethodDefinition).%OpenId(outClassName_"||"_methodName,,.sc)
    Set:'$ISOBJECT(method) method = ##class(%Dictionary.MethodDefinition).%New()
    Set method.Name = "ToDynamic"
    Set method.ClassMethod = $$$YES
    Set method.FormalSpec = "&properties:%Binary" ; "pObj:"_className
    Set method.ReturnType = "%Library.DynamicObject"
    Do method.Implementation.WriteLine($CHAR(9) _ "Set model = {}")
    Do method.parentSetObjectId(outClassName)

    New $NAMESPACE
    Set ns = $NAMESPACE, $NAMESPACE = "%SYS"
    
    
    #dim class As %Dictionary.CompiledClass = ##class(%Dictionary.CompiledClass).%OpenId(className)

    For  {
        Set property = class.Properties.GetNext(.key)
        Quit:key="" 
        Continue:..skipProperty(property)
        Set jsonType = $$$GETTYPE($Replace(property.Type, "Library.",""))
        ; Set swaggerType = $$$GETSWAGGERTYPE($Replace(property.Type, "Library.",""))
        Do method.Implementation.WriteLine($CHAR(9) _ $$$FormatText("Do:$Data(properties(""%1"")) model.%Set(""%1"", properties(""%1""), ""%2"")", property.Name, jsonType))
    }
    Do method.Implementation.WriteLine($CHAR(9) _ "Quit model")

    Set $NAMESPACE = ns
    Set sc = method.%Save()
    Write $SYSTEM.Status.GetOneErrorText(sc)
    Return sc
}

/// Description
ClassMethod GenObjectToArray(className As %String, outClassName As %String) As %Status
{
    ; zw ##class(PackageName.ClassName).GenObjectToArray("","")
    Write !," * Generate method ObjectToArray to "_outClassName _ " "
    Set sc = $$$OK, key=""
    
    Set methodName = "ObjectToArray"
    
    Set method = ##class(%Dictionary.MethodDefinition).%OpenId(outClassName_"||"_methodName)
    Set:'$ISOBJECT(method) method = ##class(%Dictionary.MethodDefinition).%New()
    Set method.Name = methodName
    Set method.ClassMethod = $$$YES
    Set method.ReturnType = ""
    Set method.FormalSpec = "&pObj,*properties:%Binary"
    
    Do method.parentSetObjectId(outClassName)

    New $NAMESPACE
    Set ns = $NAMESPACE, $NAMESPACE = "%SYS"
    
    
    #dim class As %Dictionary.CompiledClass = ##class(%Dictionary.CompiledClass).%OpenId(className)

    For  {
        Set property = class.Properties.GetNext(.key)
        Quit:key="" 
        Continue:..skipProperty(property)
        Do method.Implementation.WriteLine($CHAR(9)_$$$FormatText("Set properties(""%1"") = pObj.%1",property.Name))
    }

    Set $NAMESPACE = ns
    Set sc = method.%Save()
    Write $SYSTEM.Status.GetOneErrorText(sc)
    Return sc
}

ClassMethod ShowSwaggerDef(className As %String) As %DynamicObject
{
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
        Continue:..skipProperty(property)
        Set jsonType = $$$GETTYPE($Replace(property.Type, "Library.",""))
        Set swaggerType = $$$GETSWAGGERTYPE($Replace(property.Type, "Library.",""))
    
        Set dflt = $PROPERTY(obj,property.Name)
        Set:$ISOBJECT(dflt) dflt=""
        If dflt=""&&property.Required {
            Do swaggerDef.required.%Push(property.Name)
            Do template.%Set(property.Name, dflt, jsonType)
        }

        Set description = ..getPropertyDescription(property.Name, className)

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

    Set isSingle = ''$PARAMETER("Api.Config.Services."_$tr(className,"%"),"ISSINGLE")
    If 'isSingle {
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

    w !,formatted
    Quit swaggerDef
}

ClassMethod getPropertyDescription(property As %String, class As %String) As %String
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"

    #dim cProp As %Dictionary.CompiledProperty = ##class(%Dictionary.CompiledProperty).%OpenId(class _ "||" _property,,.sc)
    Quit:$$$ISERR(sc) ""
    Quit cProp.Description
}

ClassMethod skipProperty(property As %Dictionary.CompiledProperty) As %Boolean
{
    Quit:property.Internal $$$YES
    Quit:$Get(parameters("excludePercent"), $$$YES)&&($EXTRACT(property.Name)="%") $$$YES
    Quit:$Get(parameters("excludePrivate"), $$$YES)&&property.Private $$$YES
    Quit $$$NO
}

ClassMethod MDListServices()
{
    ; d ##class(Api.Config.Developers.Helper).MDListServices()
    #define METHODEXISTS(%name)    $s(##class(%Dictionary.MethodDefinition).%ExistsId(key_"||"_%name):"yes",1:"no")
    Write !,"| Service classes 	| List 	| Get 	| Update    | Create    | Delete    | Exists    |"
    Write !,"|-	|-	|-	|-	|-	|-	|-	|"

    Set list = 1, get = 1, update = 1, create = 1, delete=1, exists=1 
    Set key = "Api.Config.Services"
    For  {
        Set key = $Order(^oddDEF(key))
        Quit:key=""||(key'["Api.Config.Services.")
        CONTINUE:key="Api.Config.Services.Loader"

        Set list = $$$METHODEXISTS("List"), 
                    get = $$$METHODEXISTS("Get"), 
                    update = $$$METHODEXISTS("Update"), 
                    create = $$$METHODEXISTS("Create"), 
                    delete = $$$METHODEXISTS("Delete"), 
                    exists = $$$METHODEXISTS("Exists")
        Write !, $$$FormatText("| %1 | %2 | %3 | %4 | %5 | %6 | %7 |",key,list,get,update,create,delete,exists)
    }
}

}
