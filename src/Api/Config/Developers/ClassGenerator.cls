/// DON'T USE.  (class used for first code generation.)
/// Generator for 
/// - Swagger spec.
/// - REST Service implementation.
/// - Proxy class with Config package.
/// Classes in %SYS config package are pretty similar.
/// So, We can write easily an algorithm to generate needed classes.
Class Api.Config.Developers.ClassGenerator Extends %RegisteredObject
{

/// Configuration class
Property class As %Dictionary.CompiledClass;

Property generatedClassName As %String;

Property outClass As %Dictionary.ClassDefinition [ InitialExpression = {##class(%Dictionary.ClassDefinition).%New()} ];

Property parameters As %Binary [ MultiDimensional ];

Property temp As %Binary [ MultiDimensional, Private ];

Property swaggerSpec As %DynamicObject;

Property restApp As %String [ InitialExpression = "Api.Config.REST" ];

ClassMethod test()
{
    ;d ##class(Api.Config.Developers.ClassGenerator).test()
    tro
    TSTART
    
    Set swagger = {
        "swagger":"2.0",
        "host":"localhost:32773",
        "basePath":"/api/config",
        "schemes":[
            "http","https"
        ],
        "info":{
            "title":"IRIS Config API",
            "version":"0.0.1",
            "description":"Config API.",
            "contact":{
            "name":"Lorenzo Scalese",
            "email":"lorenzo.scalese@gmail.com",
            "url":"https://github.com/lscalese/Iris-Deploy-Utils-API/"
            },
            "license":{
            "name":"MIT",
            "url":"https://github.com/lscalese/Iris-Deploy-Utils-API/blob/master/LICENSE"
            }
        },
        "produces":[
            "application/json"
        ],
        "paths":{
            "/":{
                "get":{
                    "tags":[
                        "Developer"
                    ],
                    "operationId":"GetSpecification",
                    "description":"Swagger 2.0 specification",
                    "responses":{
                        "200":{
                            "description":"OK"
                        }
                    }
                }
            }
        },
        "definitions":{}
    }

    Set outPKG = "Api.Config.Services.", ptr = 0
    Set clsList = ..getConfigClassList() ;$LISTBUILD("Config.MapGlobals","Config.Journal")
    ;Set clsList = $LISTBUILD("Config.Databases")

    While $LISTNEXT(clsList, ptr, v) {
        Set gen = ..%New(v, outPKG _ $Piece(v,".",*), swagger)
        Set sc = gen.generate()

    }

    Set formatter=##class(%JSON.Formatter).%New()
    Set swaggerString = ""
    Do formatter.FormatToString(swagger, .swaggerString)
    ;w !,swaggerString
    
    Set file=##class(%File).%New($Get(parameters("outSwaggerFile"),"/irisrun/repo/GENERATOR.json"))
    Do file.Open("WSN")
    Do file.Write(swaggerString)
    Do file.SaveStream()


    Quit
}

ClassMethod getConfigClassList() As %List
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Set classes("Cluster")=""
    Set classes("ConfigFile")=""
    Set classes("Databases")=""
    Set classes("Debug")=""
    Set classes("DeviceSubTypes")=""
    Set classes("Devices")=""
    Set classes("ECP")=""
    Set classes("ECPServers")=""
    Set classes("IO")=""
    Set classes("Journal")=""
    Set classes("LicenseServers")=""
    Set classes("MagTapes")=""
    Set classes("MapGlobals")=""
    Set classes("MapMirrors")=""
    Set classes("MapPackages")=""
    Set classes("MapRoutines")=""
    Set classes("MapShadows")=""
    Set classes("MirrorMember")=""
    Set classes("Mirrors")=""
    Set classes("Miscellaneous")=""
    Set classes("Monitor")=""
    Set classes("Namespaces")=""
    Set classes("SQL")=""
    Set classes("Shadows")=""
    Set classes("SqlSysDatatypes")=""
    Set classes("SqlUserDatatypes")=""
    Set classes("Startup")=""
    Set classes("Telnet")=""
    Set classes("config")=""
    
    
    Set class = ""
    For  {
        Set class = $Order(classes(class))
        Quit:class=""
        Set $List(lst,*+1) = "Config."_class
        
    }
    Quit lst
}

Method %OnNew(configClassName As %String, generatedClassName As %String, swagger As %DynamicObject = {{}}, ByRef parameters As %Binary) As %Status
{
    Set sc = $$$OK, ns = $NAMESPACE 
    
    New $NAMESPACE 
    Set $NAMESPACE= "%SYS"
    
    Set ..class = ##class(%Dictionary.CompiledClass).%OpenId(configClassName,,.sc)
    Quit:$$$ISERR(sc) sc
    
    Set $NAMESPACE= ns
    Set ..swaggerSpec = swagger
    If '$$$defClassDefined(generatedClassName) {
        Set ..outClass = ##class(%Dictionary.ClassDefinition).%New()
        Set ..outClass.Name = generatedClassName
        Set ..outClass.IncludeCode = "Api.Config.inc"
        Set ..outClass.ProcedureBlock = $$$YES
    } Else {
        Set ..outClass = ##class(%Dictionary.ClassDefinition).%OpenId(generatedClassName)
    }
    
    If $Data(parameters) {
        Merge ..parameters = parameters
    }
    Quit sc
}

Method generate() As %Status
{
    Set sc = $$$OK, ns = $NAMESPACE, key = "", template = {}
    
    Set swaggerDef = {
        "type" : "object",
        "properties" : {},
        "required" : []
    }

    New $NAMESPACE 
    
    Do ..log("Start Generating Class "_..outClass.Name)

    #define GETTYPE(%type) $case(%type,"%Boolean":"boolean","Security.Datatype.BooleanYN":"boolean","%Float":"number","%Integer":"number",:"string")
    #define GETSWAGGERTYPE(%type) $case(%type,"%Boolean":"boolean","Security.Datatype.BooleanYN":"boolean","%Float":"number","%Integer":"integer",:"string")

    $$$QuitOnError(..ToDynamic())
    $$$QuitOnError(..ToArray())
    $$$QuitOnError(..Get())
    $$$QuitOnError(..Exists())
    $$$QuitOnError(..Create())
    $$$QuitOnError(..Update())
    $$$QuitOnError(..Delete())
    $$$QuitOnError(..CheckModel())
    $$$QuitOnError(..ObjectToArray())
    $$$QuitOnError(..List())

    For  {
        Set $NAMESPACE= "%SYS", property = ..class.Properties.GetNext(.key), $NAMESPACE= ns

        Quit:key=""
        Continue:..skipProperty(property)

        Set dflt = ""
        If property.InitialExpression '= "" {
            Set $NAMESPACE= "%SYS"
            Try { ; attempt to evaluate InitialExpression
                XECUTE ("(out) SET out="_ property.InitialExpression, .dflt)
            } Catch(ex) { 
                Do ..log("Evaluate initial expression failed for "_property.Name_" : "_property.InitialExpression)
            }
            Set $NAMESPACE= ns
        }
        
        Set jsonType = $$$GETTYPE($Replace(property.Type, "Library.",""))
        Set swaggerType = $$$GETSWAGGERTYPE($Replace(property.Type, "Library.",""))

        Do ToDynamic, ToArray, CheckModel, SwaggerDefinition, ObjectToArray

    }

    
    
    Do ..wlMethod($CHAR(9)_"Quit model", "ToDynamic")
    Do ..wlMethod($CHAR(9)_"Quit", "ToArray")
        
    Do ..wlMethod($CHAR(9)_"Quit sc", "CheckModel")
    Do ..wlMethod($CHAR(9)_"Quit", "ObjectToArray")

    Set clsKey = $Piece(..class.Name, ".", *)
    ;Set clsKey = $s($e(clsKey,*)="s":$e(clsKey,1,*-1),1:clsKey)
    
    Set swaggerDef.example = template
    
    Set:'$ISOBJECT(..swaggerSpec.definitions) ..swaggerSpec.definitions = {}
    Do:swaggerDef.required.%Size()=0 swaggerDef.%Remove("required")

    Do ..swaggerSpec.definitions.%Set(clsKey, swaggerDef)

    If ..configQueryExists("List") {
        Set listOf = {
            "type":"object",
            "properties": {}
        }
        Do listOf.properties.%Set(clsKey, {
            "type":"array",
            "items":{
                "$ref":("#/definitions/"_clsKey)
            }
        })
        Set lisOfPropertyName = "ListOf"_$$$UPPER($Extract(clsKey))_$Extract(clsKey,2,*)
        Set ..temp("RESTGEN","listof") = lisOfPropertyName
        Do ..swaggerSpec.definitions.%Set(lisOfPropertyName, listOf)
    }

    Do ..Path(clsKey)
    Set sc = ##class(%REST.API).CreateApplication(..restApp,..swaggerSpec)
    Do ..log("Update CSP REST application : "_$SYSTEM.Status.GetOneErrorText(sc))
    Do ..addRestImpl()
    Set sc = ..outClass.%Save()
    
    Quit sc

ToDynamic
    Set line = $CHAR(9) _ $$$FormatText("Do:$Data(properties(""%1"")) model.%Set(""%1"", properties(""%1""), ""%2"")", property.Name, jsonType)
    Do ..wlMethod(line, "ToDynamic")
    Quit 1 ; Quit 1 for the pleasure of SonarQube :p

ToArray
    If 'property.ReadOnly {
        Set line = $CHAR(9) _ $$$FormatText("Set:$$$CanSetProperty(model,""%1"") properties(""%1"") = model.%1", property.Name)
        Do ..wlMethod(line, "ToArray")
    }
    Quit 1

CheckModel
    If dflt=""&&property.Required {
        Set line = $CHAR(9) _ $$$FormatText("Set:model.%1="""" sc = $$$ADDSC(sc,$$$ERROR(5001, ""%1 property is mandatory.""))",property.Name)
        Do ..wlMethod(line,"CheckModel")
    }
    Quit 1

SwaggerDefinition
    If dflt=""&&property.Required {
        Do swaggerDef.required.%Push(property.Name)
        Do template.%Set(property.Name, dflt, jsonType)
    }

    Set description = ..getPropertyDescription(property.Name)

    Do swaggerDef.properties.%Set(property.Name, {
        "type" : (swaggerType),
        "default" : (dflt),
        "description" : (description)
    })

    Quit 1

ObjectToArray
    Set line = $CHAR(9)_$$$FormatText("Set properties(""%1"") = pObj.%1",property.Name)
    Do ..wlMethod(line, "ObjectToArray")
    Quit 1
}

Method wlMethod(line As %String, methodName As %String) As %Status [ Private ]
{
    Set method = $Get(..temp(methodName))
    Quit:'$ISOBJECT(method) $$$OK
    ;Do ..log(methodName _" "_line)
    Do method.Implementation.WriteLine(line)
    Quit $$$OK
}

Method Path(clsKey As %String) As %Status
{

    Set service = {}
    
    Set serviceKey = "/"_$$$LOWER(clsKey)_"/", serviceKeyLocation = "%request.Application_"""_serviceKey_""""

    If '..isCommonSingle() {
        Do ..GetFormalSpec("Get",.callString)
        Set lst = $LISTFROMSTRING(callString, ","), ptr = 0
        
        While $LISTNEXT(lst, ptr, param) {
            Set serviceKey = serviceKey _ $Select($Extract(serviceKey,*)'="/":"/",1:"") _ $Replace("{%1}","%1",$$$LOWER(param))
            Set serviceKeyLocation = serviceKeyLocation _ "_"_$$$LOWER(param) _"/"
            Set rmTrailing=1
        }
        Set:$Get(rmTrailing) serviceKeyLocation = $Extract(serviceKeyLocation,1,*-1)
    }

    Set ..temp("RESTGEN","location")=serviceKeyLocation

    Do service.%Set("get", ..SwaggerGet(clsKey,.operationId))
    Set ..temp("RESTMETHOD","RESTTemplateGET")=operationId
    Do service.%Set("put", ..SwaggerPut(clsKey,.operationId))
    Set ..temp("RESTMETHOD","RESTTemplatePUT")=operationId

    If '..isCommonSingle() {
        Do service.%Set("post", ..SwaggerPost(clsKey,.operationId))
        Set ..temp("RESTMETHOD","RESTTemplatePOST")=operationId
        Do service.%Set("delete", ..SwaggerDelete(clsKey,.operationId))
        Set ..temp("RESTMETHOD","RESTTemplateDELETE")=operationId
    }
    

    Do ..swaggerSpec.paths.%Set(serviceKey, service)

    ;If "/"_$$$LOWER(clsKey)_"/"'=serviceKey,..configQueryExists("List") {
    If '..isCommonSingle(),..configQueryExists("List") {
        If ..isCommonMapMethods() {
            Set serviceKey = "/"_$$$LOWER(clsKey)_"/{namespace}/" 
        } Else {
            Set serviceKey = "/"_$$$LOWER(clsKey)_"/"
        }
        Do ..swaggerSpec.paths.%Set(serviceKey, {"get":(..SwaggerGetList(clsKey,.operationId))})
        Set ..temp("RESTMETHOD","RESTTemplateGETList")=operationId
    }

    Quit $$$OK
}

Method addRestImpl(class As %String = {..restApp_".impl"}) As %Status
{
    Set sc = $$$OK
    Set cdef = ##class(%Dictionary.ClassDefinition).%OpenId(class)
    Set cdef.IncludeCode = "Api.Config.inc"
    Do cdef.%Save()

    #dim mdef As %Dictionary.MethodDefinition
    Set mTemplate = ""
    For  {
        Set mTemplate = $Order(..temp("RESTMETHOD",mTemplate),1,methodName)
        Quit:mTemplate=""
        
        Set mdef = ##class(%Dictionary.MethodDefinition).%OpenId(class _ "||" _ methodName)
        Set template=$METHOD(##this,mTemplate)
        Set buff = template.Read()
        Set replace = ""
        For  {
            Set replace = $Order(..temp("RESTGEN",replace),1,value)
            Quit:replace=""
            Set buff = $replace(buff, "{{"_replace_"}}", value)
        }
        w !,methodName
        Do mdef.Implementation.Clear()
        Do mdef.Implementation.Write(buff)
        Set sc2 = mdef.%Save()
        Do ..log("Add REST method implementation "_ methodName _ " "_$SYSTEM.Status.GetOneErrorText(sc2))
        Set:$$$ISERR(sc2) sc = $$$ADDSC(sc,sc2)
    }
    
    Quit sc
}

Method SwaggerDelete(clsKey As %String, Output operationId) As %DynamicObject
{

    Set verb = "delete"
    Set operationId =($$$UPPER($Extract(verb)) _ $Extract(verb, 2, *) _ clsKey)
    Set parameters = ..SwggerGetCommonParam()

    Set responses = {
        "204": {
            "description" : (clsKey _" deleted.")
            
        },
        "400" : {
            "description" : "Bad request, can occurs if mandatory parameters are missing or empty"
        },
        "404" : {
            "description" : (clsKey _ " not found.")
        }
    }

    Set desc = "Delete "_clsKey _ "."
    Set method = {
        "operationId" : (operationId),
        "description": (desc),
        "parameters" : (parameters),
        "responses" : (responses)
    }

    Quit method
}

Method SwaggerPut(clsKey As %String, Output operationId) As %DynamicObject
{
    Set verb = "put"
    Set parameters = ..SwggerGetCommonParam()
    Set operationId =($$$UPPER($Extract(verb)) _ $Extract(verb, 2, *) _ clsKey)
    Do parameters.%Push({
        "name": "model",
        "description" : (clsKey _ " to update."),
        "in": "body",
        "required":true,
        "schema": {
            "$ref": ("#/definitions/" _ clsKey)
        }
    })

    Set responses = {
        "204" : {
            "description": "Ressource updated."
        },
        "400" : {
            "description" : "Bad request, can occurs if mandatory parameters are missing or empty"
        },
        "404" : {
            "description" : (clsKey _ " to update not found.")
        }
    }

    Set desc = "Update "_clsKey _ "."
    Set method = {
        "operationId" : (operationId),
        "description": (desc),
        "parameters" : (parameters),
        "responses" : (responses)
    }

    Quit method
}

Method SwaggerPost(clsKey As %String, Output operationId) As %DynamicObject
{
    Set verb = "post"
    Set operationId =($$$UPPER($Extract(verb)) _ $Extract(verb, 2, *) _ clsKey)
    Set parameters = ..SwggerGetCommonParam()
    
    Do parameters.%Push({
        "name": "model",
        "description" : (clsKey _ " to create."),
        "in": "body",
        "required":true,
        "schema": {
            "$ref": ("#/definitions/" _ clsKey)
        }
    })

    
    Set responses = {
        "201": {
            "description" : (clsKey _" created."),
            "headers": {
                "Location": {
                    "type":"string",
                    "description":"Created ressource location."
                }
            }
        },
        "400" : {
            "description" : "Bad request, can occurs if mandatory parameters are missing or empty"
        },
        "409" : {
            "description" : ( clsKey _ " already exists.")
        }
    }

    Set desc = "Create "_clsKey _ "."
    Set method = {
        "operationId" : (operationId),
        "description": (desc),
        "parameters" : (parameters),
        "responses" : (responses)
    }
    
    Quit method
}

Method SwaggerGetList(clsKey, Output operationId) As %DynamicObject
{
    Set verb = "get"
    Set operationId =($$$UPPER($Extract(verb)) _ $Extract(verb, 2, *) _"List"_ clsKey)
    Set parameters = []

    Do:..isCommonMapMethods() parameters.%Push({
        "name": "namespace",
        "description" : "namespace.",
        "in": "path",
        "required":true,
        "type":"string"
    })
    
    Set responses = {
        "200": {
            "description" : "OK",
            "schema": {
                "$ref": ("#/definitions/ListOf" _ clsKey)
            }
        },
        "400" : {
            "description" : "Bad request, can occurs if mandatory parameters are missing or empty."
        }
    }
    Set desc = "Get List Of "_clsKey _ "."
    Set method = {
        "operationId" : (operationId),
        "description": (desc),
        "parameters" : (parameters),
        "responses" : (responses)
    }
    
    Quit method
}

Method SwaggerGet(clsKey As %String, Output operationId) As %DynamicObject
{
    Set verb = "get"
    Set operationId =($$$UPPER($Extract(verb)) _ $Extract(verb, 2, *) _ clsKey)
    Set parameters = ..SwggerGetCommonParam()

    Set responses = {
        "200": {
            "description" : "OK",
            "schema": {
                "$ref": ("#/definitions/" _ clsKey)
            }
        },
        "400" : {
            "description" : "Bad request, can occurs if mandatory parameters are missing or empty."
        },
        "404" : {
            "description" : (clsKey _ " not found.")
        }
    }
    Set desc = "Get "_clsKey _ "."
    Set method = {
        "operationId" : (operationId),
        "description": (desc),
        "parameters" : (parameters),
        "responses" : (responses)
    }
    
    Quit method
}

Method SwggerGetCommonParam() As %DynamicObject
{
    Set parameters = []
    ;
    ;w !,"..isCommonSingle() : ",..isCommonSingle(),!
    Set ..temp("RESTGEN","params")="", ..temp("RESTGEN","getlistparams")=""

    If '..isCommonSingle() {
        Do ..GetFormalSpec("Get",.callString)
        ;w !,"call string " ,callString,!
        Set lst = $LISTFROMSTRING(callString, ","), ptr = 0, params=""
        
        While $LISTNEXT(lst, ptr, param) {
            Set description = ..getPropertyDescription(param)
            Do parameters.%Push({
                "name" : ($$$LOWER(param)),
                "description" : (description),
                "in" : "path",
                "type" : "string",
                "required" : true
            })
            Set params = params_","_$$$LOWER(param)
            ;w !,"desc ",description
        }
    
        Set ..temp("RESTGEN","params")=$Extract(params,2,*)
    
    } 
    
    If ..isCommonMapMethods() {
        Set ..temp("RESTGEN","getlistparams") = $Piece(..temp("RESTGEN","params"),",",1)
    }

    Quit parameters
}

Method ToDynamic() As %Status [ Private ]
{
    Set sc = $$$OK

    Do ..log(" * Generate method ToDynamic : ")
    If '##class(%Dictionary.MethodDefinition).%ExistsId(..outClass.Name _ "||ToDynamic" ) {
        Set mToDynamic = ##class(%Dictionary.MethodDefinition).%New()
        Set mToDynamic.Name = "ToDynamic"
        Set mToDynamic.ClassMethod = $$$YES
        Set mToDynamic.FormalSpec = "&properties:%Binary" ; "pObj:"_className
        Set mToDynamic.ReturnType = "%Library.DynamicObject"
        Do mToDynamic.Implementation.WriteLine($CHAR(9) _ "Set model = {}")
        Do ..outClass.Methods.Insert(mToDynamic)
        Set ..temp("ToDynamic")=mToDynamic
        Do ..log( "Initialized.", 0)
    } Else {
        Do ..log( "Already exists (skipped).", 0)
    }

    Quit sc
}

Method ToArray() As %Status [ Private ]
{
    Set sc = $$$OK
    Do ..log(" * Generate method ToArray : ")
    If '##class(%Dictionary.MethodDefinition).%ExistsId(..outClass.Name _ "||ToArray") {
        Set mToArray = ##class(%Dictionary.MethodDefinition).%New()
        Set mToArray.Name = "ToArray"
        Set mToArray.ClassMethod = $$$YES
        Set mToArray.FormalSpec = "model:%Library.DynamicObject,*properties:%Binary"
        Set mToArray.ReturnType = ""
        Do ..outClass.Methods.Insert(mToArray)
        Set ..temp("ToArray")=mToArray
        Do ..log( "Initialized.", 0)
    } Else {
        Do ..log( "Already exists (skipped).", 0)
    }

    Quit sc
}

Method Get() As %Status [ Private ]
{
    Set sc = $$$OK
    Do ..log(" * Generate method Get : ")
    Set methodName = "Get"
    If '##class(%Dictionary.MethodDefinition).%ExistsId(..outClass.Name_"||"_methodName) {
        #dim method As %Dictionary.MethodDefinition = ##class(%Dictionary.MethodDefinition).%New()
        Set method.Name = methodName
        Set method.ClassMethod = $$$YES
        Set method.ReturnType = "%Library.DynamicObject"
        If ..isCommonSingle() {
            Set args = ""
        } Else {
            Set method.FormalSpec = ..GetFormalSpec(methodName, .callString)
            Do method.Implementation.WriteLine($CHAR(9) _ "Quit:'..Exists(" _ callString _ ") """"")
            Set args = $Select(callString'="":callString_",",1:"")
        }
        Do method.Implementation.WriteLine($CHAR(9) _ "$$$switchNSSys")
        
        Do method.Implementation.WriteLine($CHAR(9) _ $$$FormatText("$$$ThrowOnError(##class(%1).Get("_args_".properties))", ..class.Name))
        Do method.Implementation.WriteLine($CHAR(9) _ "Quit ..ToDynamic(.properties)")
        Do ..outClass.Methods.Insert(method)
        Set ..temp(methodName)=method
        Do ..log("Initialized.", 0)
    } Else {
        Do ..log("Already exists (skipped).", 0)
    }
    Set ..temp("RESTGEN","get") = $$$FormatText("##class(%1).%2", ..outClass.Name, methodName)
    Quit sc
}

Method Exists() As %Status [ Private ]
{
    Set sc = $$$OK, methodName = "Exists"
    Quit:'..configMethodExists(methodName) sc

    Quit:..isCommonSingle() sc

    Do ..log(" * Generate method Exists : ")
    
    If '##class(%Dictionary.MethodDefinition).%ExistsId(..outClass.Name _ "||"_methodName) {
        Set method = ##class(%Dictionary.MethodDefinition).%New()
        Set method.Name = methodName
        Set method.ClassMethod = $$$YES
        Set method.ReturnType = "%Boolean"
        Set method.FormalSpec = ..GetFormalSpec("Get", .callString) 
        Do method.Implementation.WriteLine($CHAR(9) _ "$$$switchNSSys")
        Do method.Implementation.WriteLine($CHAR(9) _ $$$FormatText("Quit ##class(%1).Exists("_callString_")", ..class.Name))
        Do ..outClass.Methods.Insert(method)
        Set ..temp(methodName)=method
        Do ..log("Initialized.", 0)
    } Else {
        Do ..log("Already exists (skipped).", 0)
    }
     Set ..temp("RESTGEN","exists") = $$$FormatText("##class(%1).%2", ..outClass.Name, methodName)
    Quit sc
}

Method Create() As %Status [ Private ]
{
    Set sc = $$$OK, methodName = "Create"
    Quit:'..configMethodExists(methodName) sc
    
    Set ns = $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Quit:$CLASSMETHOD(..class.Name,"%Extends","Config.CommonSingleMethods") sc
    Set $NAMESPACE = ns

    Do ..log(" * Generate method Create : ")

    If '##class(%Dictionary.MethodDefinition).%ExistsId(..outClass.Name _ "||" _ methodName) {
        Set method = ##class(%Dictionary.MethodDefinition).%New()
        Set method.Name = methodName
        Set method.ClassMethod = $$$YES
        Set method.ReturnType = "%Status"
        Set method.FormalSpec = "model:%Library.DynamicObject"
        Do ..GetFormalSpec("Get", .callString, "model.")
        Do method.Implementation.WriteLine($CHAR(9) _ "Do ..ToArray(model,.properties)")
        Do method.Implementation.WriteLine($CHAR(9) _ "$$$switchNSSys")
        Set args = $Select(callString'="":callString_",",1:"")
        Do method.Implementation.WriteLine($CHAR(9) _ $$$FormatText("Quit ##class(%1).Create("_args_".properties)", ..class.Name))
        Do ..outClass.Methods.Insert(method)
        Set ..temp(methodName)=method
        Do ..log("Initialized.", 0)

    } Else {
        Do ..log("Already exists (skipped).", 0)
    }
    Set ..temp("RESTGEN","create") = $$$FormatText("##class(%1).%2", ..outClass.Name, methodName)
    Quit sc
}

Method Update() As %Status [ Private ]
{
    Set sc = $$$OK, methodName = "Update"
    Quit:'..configMethodExists("Modify") sc
    Do ..log(" * Generate method Update : ")
    If '##class(%Dictionary.MethodDefinition).%ExistsId(..outClass.Name _ "||" _ methodName) {
        Set method = ##class(%Dictionary.MethodDefinition).%New()
        Set method.Name = methodName
        Set method.ClassMethod = $$$YES
        Set method.ReturnType = "%Status"
        Set method.FormalSpec = "model:%Library.DynamicObject"
        If '..isCommonSingle() {
            Do ..GetFormalSpec("Get", .callString, "model.") 
            Set args = $Select(callString'="":callString_",",1:"")
        } Else {
            Set args = ""
        }
        Do method.Implementation.WriteLine($CHAR(9) _ "Do ..ToArray(model,.properties)")
        Do method.Implementation.WriteLine($CHAR(9) _ "$$$switchNSSys")
       
        Do method.Implementation.WriteLine($CHAR(9) _ $$$FormatText("Quit ##class(%1).Modify("_args_".properties)", ..class.Name))
        Do ..outClass.Methods.Insert(method)
        Set ..temp(methodName)=method
        Do ..log("Initialized.", 0)
    } Else {
        Do ..log("Already exists (skipped).", 0)
    }
    Set ..temp("RESTGEN","update") = $$$FormatText("##class(%1).%2", ..outClass.Name, methodName)
    Quit sc
}

Method Delete() As %Status [ Private ]
{
    Set sc = $$$OK, methodName = "Delete"
    Quit:'..configMethodExists(methodName) sc
    Do ..log(" * Generate method Delete : ")
    If '##class(%Dictionary.MethodDefinition).%ExistsId(..outClass.Name _ "||" _ methodName) {
        Set method = ##class(%Dictionary.MethodDefinition).%New()
        Set method.Name = methodName
        Set method.ClassMethod = $$$YES
        Set method.ReturnType = "%Status"
        Set method.FormalSpec = ..GetFormalSpec("Get", .callString) 
        Do method.Implementation.WriteLine($CHAR(9) _ "$$$switchNSSys")
        Do method.Implementation.WriteLine($CHAR(9) _ $$$FormatText("Quit ##class(%1).Delete("_callString_")", ..class.Name))
        Do ..outClass.Methods.Insert(method)
        Set ..temp(methodName)=method
        Do ..log("Initialized.", 0)
    } Else {
        Do ..log("Already exists (skipped).", 0)
    }
    Set ..temp("RESTGEN","delete") = $$$FormatText("##class(%1).%2", ..outClass.Name, methodName)
    Quit sc
}

Method CheckModel() As %Status [ Private ]
{
    Set sc = $$$OK, methodName =  "CheckModel"
    Do ..log(" * Generate method CheckModel : ")
    If '##class(%Dictionary.MethodDefinition).%ExistsId(..outClass.Name _ "||" _methodName) {
        Set checkModelMethod = ##class(%Dictionary.MethodDefinition).%New()
        Set checkModelMethod.Name = methodName
        Set checkModelMethod.ClassMethod = $$$YES
        Set checkModelMethod.ReturnType = "%Status"
        Set checkModelMethod.FormalSpec = "model:%Library.DynamicObject"
        Do checkModelMethod.Implementation.WriteLine($CHAR(9)_"Set sc = $$$OK")
        Do ..outClass.Methods.Insert(checkModelMethod)
        Set ..temp(methodName)=checkModelMethod
        Do ..log("Initialized.", 0)
    } Else {
        Do ..log("Already exists (skipped).", 0)
    }
    Set ..temp("RESTGEN","checkmodel") = $$$FormatText("##class(%1).%2", ..outClass.Name, methodName)
    Quit sc
}

Method ObjectToArray() As %Status [ Private ]
{
    Set sc = $$$OK, methodName = "ObjectToArray"
    Do ..log(" * Generate method ObjectToArray : ")
    If '##class(%Dictionary.MethodDefinition).%ExistsId(..outClass.Name _ "||" _methodName) {
        Set mObjectToArray = ##class(%Dictionary.MethodDefinition).%New()
        Set mObjectToArray.Name = methodName
        Set mObjectToArray.ClassMethod = $$$YES
        Set mObjectToArray.ReturnType = ""
        Set mObjectToArray.FormalSpec = "&pObj,*properties:%Binary"
        Do ..outClass.Methods.Insert(mObjectToArray)
        Do ..outClass.Methods.Insert(mObjectToArray)
        Set ..temp(methodName)=mObjectToArray
        Do ..log("Initialized.", 0)
    } Else {
        Do ..log("Already exists (skipped).", 0)
    }
    Quit sc
}

Method List() As %Status [ Private ]
{
    Set sc = $$$OK, methodName = "List"
    Quit:'..configQueryExists(methodName) sc
    Set ns = $NAMESPACE
    New $NAMESPACE

    Do ..log(" * Generate method List : ")
    If '##class(%Dictionary.MethodDefinition).%ExistsId(..outClass.Name _ "||" _ methodName) {
        Set method = ##class(%Dictionary.MethodDefinition).%New()
        Set method.Name = methodName
        Set method.ClassMethod = $$$YES
        Set method.ReturnType = "%DynamicArray"
        Set method.FormalSpec = ..GetFormalSpecList(.callString)
        Do method.Implementation.WriteLine($CHAR(9) _ "$$$switchNSSys")
        Do method.Implementation.WriteLine($CHAR(9) _ "Set list = []")
        Do method.Implementation.WriteLine($CHAR(9) _ "Try{")
        Do method.Implementation.WriteLine($CHAR(9,9) _ "Set rs=##class(%Library.ResultSet).%New("""_..class.Name_":List"")")
        Do method.Implementation.WriteLine($CHAR(9,9) _ "Do rs.Execute("_callString_")")
        Do method.Implementation.WriteLine($CHAR(9,9) _ "While rs.Next() {")
        
        Set $NAMESPACE = "%SYS"
        Set paramsGet = ""
        If $CLASSMETHOD(..class.Name, "%Extends", "Config.CommonSingleMethods") {
            Set paramsGet = ""
        } ElseIf $CLASSMETHOD(..class.Name, "%Extends", "Config.CommonMapMethods") {
            Set paramsGet = "Namespace, rs.Data(""Name"")"
        } ElseIf $CLASSMETHOD(..class.Name, "%Extends", "Config.CommonMultipleMethods") {
            Set paramsGet = "rs.Data(""Name"")"
        }
        Set $NAMESPACE = ns

        Do method.Implementation.WriteLine($CHAR(9,9,9) _ "Do list.%Push(..Get("_paramsGet_"))")
        Do method.Implementation.WriteLine($CHAR(9,9) _ "}")
        Do method.Implementation.WriteLine($CHAR(9,9) _ "Do rs.Close()")
        Do method.Implementation.WriteLine($CHAR(9,9) _ "$$$restoreNS")
        Do method.Implementation.WriteLine($CHAR(9) _"}Catch(ex) {")
        Do method.Implementation.WriteLine($CHAR(9,9) _"$$$restoreNS")
        Do method.Implementation.WriteLine($CHAR(9,9)_"Throw ex")
        Do method.Implementation.WriteLine($CHAR(9) _"}")
        Do method.Implementation.WriteLine($CHAR(9) _"Return list")
       
        Do ..outClass.Methods.Insert(method)
        Set ..temp(methodName)=method
        Do ..log("Initialized.", 0)
    } Else {
        Do ..log("Already exists (skipped).", 0)
    }

    Set ..temp("RESTGEN","getlist") = $$$FormatText("##class(%1).%2", ..outClass.Name, methodName)

    Quit sc
}

Method GetFormalSpecList(Output callString As %String) As %String [ Private ]
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS", callString = ""

    Set query = ##class(%Dictionary.CompiledQuery).%OpenId(..class.Name _ "||List")
    
    Set tmpList = $LISTFROMSTRING(query.FormalSpec), ptr = 0
    
    While $LISTNEXT(tmpList, ptr, v) {
        Set $Piece(callString, ",", *+1)= $Piece(v, ":")
    }
    Set callString = $Extract(callString, 2, *)
    
    Quit query.FormalSpec
}

Method GetFormalSpec(methodName As %String, Output callString As %String, prefix As %String = "") As %String [ Private ]
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS", callString = ""

    #dim cm As %Dictionary.CompiledMethod = ##class(%Dictionary.CompiledMethod).%OpenId(..class.Name _ "||" _ methodName,,.sc)
    Quit:$$$ISERR(sc) sc
    Set formalSpec = $Piece(cm.FormalSpec, ",&Properties")
    Set tmpList = $LISTFROMSTRING(formalSpec), ptr = 0
    
    While $LISTNEXT(tmpList, ptr, v) {
        Set $Piece(callString, ",", *+1)= prefix _ $Piece(v, ":")
    }
    Set callString = $Extract(callString, 2, *)

    Quit formalSpec
}

Method configMethodExists(methodName As %String) As %Boolean
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Quit ##class(%Dictionary.CompiledMethod).%ExistsId(..class.Name _ "||" _ methodName)
}

Method configQueryExists(queryName As %String) As %Boolean
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Quit ##class(%Dictionary.CompiledQuery).%ExistsId(..class.Name _ "||" _ queryName)
}

/// write message to the current device if verbose is enabled
Method log(message As %String, newLine As %Boolean = 1, dateTime As %Boolean = 1)
{
    Quit:'..verbose()
    Write:newLine !, $zdt($h,3,1), " "
    Write message
    Quit
}

Method isCommonSingle() As %Boolean
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Quit $CLASSMETHOD(..class.Name,"%Extends","Config.CommonSingleMethods")
}

Method isCommonMapMethods() As %Boolean
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Quit $CLASSMETHOD(..class.Name,"%Extends","Config.CommonMapMethods")
}

Method isCommonMultipleMethods() As %Boolean
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Quit $CLASSMETHOD(..class.Name,"%Extends","Config.CommonMultipleMethods")
}

Method getPropertyDescription(property As %String) As %String
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"

    Set desc = ""

    #dim cProp As %Dictionary.CompiledProperty = ##class(%Dictionary.CompiledProperty).%OpenId(..class.Name _ "||" _property,,.sc)
    Quit:$$$ISERR(sc) ""
    Set desc = cProp.Description
    ;Set desc = $Replace(desc,"<br>","\n")
    ;Set desc = $Replace(desc,"<br/>","\n")
    
    Quit desc
}

Method verbose() As %Boolean [ CodeMode = expression, Private ]
{
$Get(..parameters("verbose"),1)
}

Method skipProperty(property As %Dictionary.CompiledProperty) As %Boolean
{
    Quit:property.Internal $$$YES
    Quit:$Get(parameters("excludePercent"), $$$YES)&&($EXTRACT(property.Name)="%") $$$YES
    Quit:$Get(parameters("excludePrivate"), $$$YES)&&property.Private $$$YES
    Quit $$$NO
}

Method RESTTemplateGET() As %Stream.GlobalCharacter
{
    Set stream = ##class(%Stream.GlobalCharacter).%New()

    If ..configMethodExists("Exists") {
        Do stream.WriteLine($c(9)_ "If '{{exists}}({{params}}) {")
        Do stream.WriteLine($c(9,9)_ "Do ..%SetStatusCode($$$HTTP404)")
        Do stream.WriteLine($c(9,9)_ "Quit """"")
        Do stream.WriteLine($c(9)_ "}")
        Do stream.WriteLine("")
    }

    Do stream.WriteLine($c(9)_"Set model = {{get}}({{params}})")
    Do stream.WriteLine($c(9)_"Do ..%SetStatusCode($$$HTTP200)")
    Do stream.WriteLine($c(9)_"Do ..%SetContentType(""application/json"")")
    Do stream.WriteLine($c(9)_"Quit model")
    
    Quit stream
}

Method RESTTemplatePUT() As %Stream.GlobalCharacter
{
    Set stream = ##class(%Stream.GlobalCharacter).%New()
    Do stream.WriteLine($c(9)_ "Set dModel = {}.%FromJSON(.model)")
    Do stream.WriteLine($c(9)_ "Set sc ={{checkmodel}}(dModel)")
    Do stream.WriteLine($c(9)_ "If $$$ISERR(sc) {")
    Do stream.WriteLine($c(9,9)_ "Do ..%SetStatusCode($$$HTTP400)")
    Do stream.WriteLine($c(9,9)_ "Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)")
    Do stream.WriteLine($c(9,9)_ "Quit jsonSC")
    Do stream.WriteLine($c(9)_ "}")
    Do stream.WriteLine($c(9)_ "")
    If ..configMethodExists("Exists") {
        Do stream.WriteLine($c(9)_ "If '{{exists}}({{params}}) {")
        Do stream.WriteLine($c(9,9)_ "Do ..%SetStatusCode($$$HTTP404)")
        Do stream.WriteLine($c(9)_ "}")
    }
    Do stream.WriteLine($c(9)_ "")
    Do stream.WriteLine($c(9)_ "$$$ThrowOnError({{update}}(dModel))")
    Do stream.WriteLine($c(9)_ "Do ..%SetStatusCode($$$HTTP204)")
    Do stream.WriteLine($c(9)_ "Quit """"")   
    Quit stream
}

Method RESTTemplatePOST() As %Stream.GlobalCharacter
{
    Set stream = ##class(%Stream.GlobalCharacter).%New()
    Do stream.WriteLine($c(9)_ "Set dModel = {}.%FromJSON(.model)")
    Do stream.WriteLine($c(9)_ "Set sc ={{checkmodel}}(dModel)")
    Do stream.WriteLine($c(9)_ "If $$$ISERR(sc) {")
    Do stream.WriteLine($c(9,9)_ "Do ..%SetStatusCode($$$HTTP400)")
    Do stream.WriteLine($c(9,9)_ "Do ##class(%CSP.REST).StatusToJSON(sc,.jsonSC)")
    Do stream.WriteLine($c(9,9)_ "Quit jsonSC")
    Do stream.WriteLine($c(9)_ "}")
    Do stream.WriteLine($c(9)_ "")
    Do stream.WriteLine($c(9)_ "If {{exists}}({{params}}) {")
    Do stream.WriteLine($c(9,9)_ "Do ..%SetStatusCode($$$HTTP409)")
    Do stream.WriteLine($c(9,9)_ "Quit """"")
    Do stream.WriteLine($c(9)_ "}")
    Do stream.WriteLine($c(9)_ "")
    Do stream.WriteLine($c(9)_ "$$$ThrowOnError({{create}}(dModel))")
    Do stream.WriteLine($c(9)_ "Do ..%SetStatusCode($$$HTTP201)")
    Do stream.WriteLine($c(9)_ "Do ..%SetHeader(""Location"", {{location}})")
    Do stream.WriteLine($c(9)_ "Quit """"")
    Quit stream
}

Method RESTTemplateDELETE() As %Stream.GlobalCharacter
{
    Set stream = ##class(%Stream.GlobalCharacter).%New()
    Do stream.WriteLine($c(9)_ "If '{{exists}}({{params}}) {")
    Do stream.WriteLine($c(9,9)_ "Do ..%SetStatusCode($$$HTTP404)")
    Do stream.WriteLine($c(9,9)_ "Quit """"")
    Do stream.WriteLine($c(9)_ "}")
    Do stream.WriteLine($c(9)_ "")
    Do stream.WriteLine($c(9)_ "$$$ThrowOnError({{delete}}({{params}}))")
    Do stream.WriteLine($c(9)_ "Do ..%SetStatusCode($$$HTTP204)")
    Do stream.WriteLine($c(9)_ "Quit """"")
    Quit stream
}

Method RESTTemplateGETList() As %Stream.GlobalCharacter
{
    Set stream = ##class(%Stream.GlobalCharacter).%New()
    Do stream.WriteLine($c(9)_ "Set lst = {{getlist}}({{getlistparams}})")
    Do stream.WriteLine($c(9)_ "Do ..%SetStatusCode($$$HTTP200)")
    Do stream.WriteLine($c(9)_ "Do ..%SetContentType(""application/json"")")
    Do stream.WriteLine($c(9)_ "Quit {""{{listof}}"":(lst)}")
    Quit stream
}

}
