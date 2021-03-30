/// Description
Class Api.Config.Services.Loader
{

ClassMethod test()
{
    ;d ##class(Api.Config.Services.Loader).test()
    Set cfg = {
        "Defaults":{
            "DBDIR" : "${MGRDIR}",
            "WEBAPPDIR" : "${CSPDIR}"
        },
        "SYS.Databases":{
            "${DBDIR}myappdata/" : {
                "ExpansionSize":128
            },
            "${DBDIR}myappcode/": {}
        },
        "Databases":{
            "MYAPPDATA" : {
                "Directory" : "${DBDIR}myappdata/"
            },
            "MYAPPCODE" : {
                "Directory" : "${DBDIR}myappcode/"
            }
        },
        "Namespaces":{
            "MYAPP": {
                "Globals":"MYAPPDATA",
                "Routines":"MYAPPCODE"
            }
        },
        "Security.Applications": {
            "/csp/zrestapp": {
                "DispatchClas" : "my.dispatch.class",
                "Namespace" : "MYAPP",
                "Enabled" : "1",
                "AuthEnabled": "64",
                "CookiePath" : "/csp/zrestapp/"
            }
        },
         "MapGlobals":{
            "MYAPP": [{
                "Name" : "Archive.Data",
                "Database" : "MYAPPARCHIVE"
            },{
                "Name" : "App.Log",
                "Database" : "MYAPPLOG"
            }]
        }
    }

    Set cfg2 = {
        "Defaults":{
            "DBDIR" : "${MGRDIR}",
            "WEBAPPDIR" : "${CSPDIR}",
            "DBDATA" : "${DBDIR}myappdata/",
            "DBARCHIVE" : "${DBDIR}myapparchive/",
            "DBCODE" : "${DBDIR}myappcode/",
            "DBLOG" : "${DBDIR}myapplog/"
        },
        "SYS.Databases":{
            "${DBDATA}" : {"ExpansionSize":128},
            "${DBARCHIVE}" : {},
            "${DBCODE}" : {},
            "${DBLOG}" : {}
        },
        "Databases":{
            "MYAPPDATA" : {
                "Directory" : "${DBDATA}"
            },
            "MYAPPCODE" : {
                "Directory" : "${DBCODE}"
            },
            "MYAPPARCHIVE" : {
                "Directory" : "${DBARCHIVE}"
            },
            "MYAPPLOG" : {
                "Directory" : "${DBLOG}"
            }
        },
        "Namespaces":{
            "MYAPP": {
                "Globals":"MYAPPDATA",
                "Routines":"MYAPPCODE"
            }
        },
        "Security.Applications": {
            "/csp/zrestapp": {
                "DispatchClas" : "my.dispatch.class",
                "Namespace" : "MYAPP",
                "Enabled" : "1",
                "AuthEnabled": "64",
                "CookiePath" : "/csp/zrestapp/"
            },
            "/csp/zwebapp": {
                "Path": "${WEBAPPDIR}",
                "Namespace" : "MYAPP",
                "Enabled" : "1",
                "AuthEnabled": "64",
                "CookiePath" : "/csp/zwebapp/"
            }
        },
        "MapGlobals":{
            "MYAPP": [{
                "Name" : "Archive.Data",
                "Database" : "MYAPPARCHIVE"
            },{
                "Name" : "App.Log",
                "Database" : "MYAPPLOG"
            }]
        },
        "MapPackages": {
            "MYAPP": [{
                "Namespace" : "MYAPP",
                "Name" : "PackageName",
                "Database" : "USER"
            }]
        },
        "MapRoutines": {
            "MYAPP": [{
                "Namespace" : "MYAPP",
                "Name" : "RoutineName",
                "Database" : "USER"
            }]
        },
        "Journal": {
            "FreezeOnError":1
        },
        "Security.Services":{   
            "%Service_Mirror": {
                "Enabled" : 0
            }
        },
        "SQL": {
            "LockThreshold" : 2500
        },
        "config": {
            "locksiz" : 33554432
        },
        "Startup":{
            "SystemMode" : "DEVELOPMENT"
        }
    }
    zw ..Load(cfg2)
}

/// Model can be : 
/// * a %String with the path to the JSON Document.
/// * a stream contain JSON Document
/// * a %DynamicObject
ClassMethod Load(model As %DynamicObject, ByRef params) As %Status
{
    Set params=""
    ;Set:'$d(params("IFEXISTS")) params("IFEXISTS")="Update"
    Set sc = ..commonLoad(model, "Create",.params)
    Return sc
}

/// Delete all namespaces, database, mapping, ... in configuration document.
/// Be careful...  (return an error on System mode LIVE.)
ClassMethod Delete(model As %DynamicObject) As %Status
{
    Set startup = ##class(Api.Config.Services.Startup).Get()
    If startup.SystemMode = "LIVE" {
        Quit $$$ERROR(5001, "Not allowed on LIVE system")
    }
    Set params = ""
    Quit ..commonLoad(model, "Delete", .params)
}

ClassMethod commonLoad(model As %DynamicObject, action As %String, ByRef params As %Binary) As %Status [ Private ]
{
    #def1arg    log(%arg)       Do ..log(%arg)
    #define     CFGCLASS(%cls)  "Api.Config.Services."_%cls    
    Set sc = $$$OK, sc2 = $$$OK

    If '$ISOBJECT(model) {  ; filename
        Do ..log("Load from file "_model_" ... ")
        If '##class(%File).Exists(model) {
            Do ..log("file not found.",0)
            Quit $$$ERROR(5001, "File not found.")
        }
        #dim file As %Stream.FileCharacter = ##class(%Stream.FileCharacter).%New()
        Do file.LinkToFile(model)
        Set model = {}.%FromJSON(file)
    } ElseIf model.%IsA("%Stream.Object") {
        Do ..log("Load from stream ... ")
        Set model = {}.%FromJSON(model)
    }

    
    ;If model.%IsA()
    
    $$$log("Start load configuration")
    
    Set processedConfig = ..processConfig(model)
    Set formatter=##class(%JSON.Formatter).%New()
    Set swaggerString = ""
    Do formatter.FormatToString(processedConfig, .swaggerString)
    $$$log(swaggerString)

    Set iter = processedConfig.%GetIterator()

    While iter.%GetNext(.key,.value) {
        $$$log(" * "_key)
        
        Set rAction = action
        Set isSingle = $PARAMETER($$$CFGCLASS(key),"ISSINGLE")=1
        Set isMap = $PARAMETER($$$CFGCLASS(key),"ISMAP")=1

        If isSingle { ; singleton params (only update allowed)
            
            Set:action="Create" rAction = "Update"

            $$$log("   + "_rAction _" "_key_" ... ")

            If action = "Delete" {
                $$$log("Not Allowed (skipping)",0)
                CONTINUE
            }
            
            Set sc2 = $CLASSMETHOD($$$CFGCLASS(key), rAction, value)
            Set sc = $$$ADDSC(sc,sc2)
            $$$log($SYSTEM.Status.GetOneErrorText(sc2),0)
            CONTINUE
        }

        Set iterLvl2 = value.%GetIterator()
        While iterLvl2.%GetNext(.keyLvl2,.valueLvl2) {
            Set rAction = action

            If $PARAMETER($$$CFGCLASS(key),"UPDATEONLY") {
                Set:rAction="Create" rAction = "Update"
                If rAction="Delete" {
                    $$$log("Not Allowed (skipping)",0)
                     CONTINUE
                }
               
            }
            

            If isMap {  ; identifier with 2 properties
                
                Set pIDS = $PARAMETER($$$CFGCLASS(key),"PIDENTIFIER")
                ;Set id1 = valueLvl2.%Get($PIECE(pIDS,",",1))
                Set id1 = keyLvl2
                
                Set iterLvl3 = valueLvl2.%GetIterator()
                While iterLvl3.%GetNext(.keyLvl3,.valueLvl3) {
                    Do valueLvl3.%Set($PIECE(pIDS,",",1),id1)
                    Set id2 = valueLvl3.%Get($PIECE(pIDS,",",2))

                    $$$log("   + "_rAction _" " _ id1 _ " " _ id2 _ " ... ")
                    Set exists = $CLASSMETHOD($$$CFGCLASS(key),"Exists",id1, id2)

                    If rAction="Delete" && 'exists {
                        $$$log("Does not exists (skipping)",0)
                        CONTINUE
                    }

                    If rAction="Create" && exists {
                        If $Get(params("IFEXISTS"))="Update" {
                            $$$log("Already exists (updating) ",0)
                            Set rAction = "Update"
                        } Else {
                            $$$log("Already exists (skipping)",0)
                            CONTINUE
                        }
                    }

                    If rAction = "Delete" {
                        Set sc2 = $CLASSMETHOD($$$CFGCLASS(key), rAction, id1, id2)
                    } Else {
                        Set sc2 = $CLASSMETHOD($$$CFGCLASS(key), rAction, valueLvl3)
                    }
                    $$$log($SYSTEM.Status.GetOneErrorText(sc2),0)
                   
                }
                CONTINUE
            }

            Do ..SetName(key,.valueLvl2,keyLvl2)
            $$$log("   + "_rAction _" "_keyLvl2_" ... ")
            
            Set exists = $CLASSMETHOD($$$CFGCLASS(key),"Exists",keyLvl2)

            If rAction="Delete" && 'exists {
                $$$log("Does not exists (skipping)",0)
                CONTINUE
            }

            If rAction="Create" && exists {
                If $Get(params("IFEXISTS"))="Update" {
                    Set rAction = "Update"
                     $$$log("Already exists (updating) ",0)
                } Else {
                    $$$log("Already exists (skipping)",0)
                    CONTINUE
                }
            }
            
            If rAction = "Delete" {
                Set sc2 = $CLASSMETHOD($$$CFGCLASS(key), rAction, keyLvl2)
            } Else {
                Set sc2 = $CLASSMETHOD($$$CFGCLASS(key), rAction, valueLvl2)
            }

            $$$log($SYSTEM.Status.GetOneErrorText(sc2),0)
        }
    }

    Return sc
}

ClassMethod SetName(key As %String, ByRef model As %DynamicObject, keyLvl2 As %String)
{
    Set nameProperty = $PARAMETER("Api.Config.Services."_key,"PNAME")
    If nameProperty="" {
        Set model.Name = keyLvl2
        Quit
    }
    Do model.%Set(nameProperty, keyLvl2)
    Quit
}

/// Description
ClassMethod log(msg As %String, newLine As %Boolean = {$$$YES}, dtOnNewLine As %Boolean = {$$$YES}) As %Status
{
    Set sc = $$$OK
    Write:newLine !
    Write:newLine&&dtOnNewLine $zdatetime($h,3,1), " "
    Write msg
    Return sc
}

/// OnlyNotDefaultValue : properties with the default value won't exported.  
/// toFile : if you want to export to a file, fill toFile argument with the filepath.  
ClassMethod export(filter As %DynamicObject = {{}}, OnlyNotDefaultValue As %Boolean = 1, toFile As %String = "") As %DynamicObject
{
    ; Do ##class(Api.Config.Services.Loader).export()
    #define     CFGCLASS(%cls)  "Api.Config.Services."_%cls

    #dim export As %DynamicObject = {}

    #dim processedFilter As %DynamicObject = ..processConfig(filter)
    
    Set iter = processedFilter.%GetIterator()

    While iter.%GetNext(.key,.value) {
        
        Set isSingle = $PARAMETER($$$CFGCLASS(key),"ISSINGLE")=1
        Set isMap = $PARAMETER($$$CFGCLASS(key),"ISMAP")=1

        If isSingle { ; 

            Set params = $CLASSMETHOD($$$CFGCLASS(key),"Get")
            Do:OnlyNotDefaultValue ..removeDefaultValue(key,.params)
            Do ..ApplyFilter(value,.params)
            Do export.%Set(key, params)
            CONTINUE

        }

        Set tmpObj = {}
        Do export.%Set(key,tmpObj)

        If isMap {
            Set lvl2keyProp = $PIECE($PARAMETER($$$CFGCLASS(key),"PIDENTIFIER"),",",1)
            Set name = $PIECE($PARAMETER($$$CFGCLASS(key),"PIDENTIFIER"),",",2)
            CONTINUE:'$ISOBJECT(value)
            
            Set iterList = value.%GetIterator(), lst = []
            While iterList.%GetNext(.keylist,.vl) {
                Set lst = $CLASSMETHOD($$$CFGCLASS(key),"List",keylist) 
                Do tmpObj.%Set(keylist, lst)
            }

            CONTINUE
        }

        
        Set lst = [], lvl2keyProp = $PARAMETER($$$CFGCLASS(key),"PNAME")
        Set:lvl2keyProp="" lvl2keyProp="Name"
        
        If $ISOBJECT(value) {

            Set iterList = value.%GetIterator()
            While iterList.%GetNext(.keylist,.vl) {
                
                If $CLASSMETHOD($$$CFGCLASS(key),"Exists",keylist) {
                    Do lst.%Push($CLASSMETHOD($$$CFGCLASS(key),"Get",keylist))
                }
                
            }

        } Else {
            Set lst = $CLASSMETHOD($$$CFGCLASS(key),"List")
        }

        Set iterList = lst.%GetIterator()
        While iterList.%GetNext(.keylist,.vl) {
            Do tmpObj.%Set($Property(vl,lvl2keyProp), vl)
            Do:OnlyNotDefaultValue ..removeDefaultValue(key,.vl)
        }
    }

    Set formatter=##class(%JSON.Formatter).%New()
    Set exportStr = ""
    Do formatter.FormatToString(export, .exportStr)
    
    If toFile '= "" {
        Do ..toFile(export, toFile)
    }

    Quit export
}

ClassMethod ApplyFilter(filter As %DynamicObject, ByRef model As %DynamicObject) As %Status [ Private ]
{
    
    if '$ISOBJECT(filter) {
        Quit $$$OK
    }

    Set iter = model.%GetIterator()

    While iter.%GetNext(.key,.value) {
        Do:'filter.%IsDefined(key) model.%Remove(key)
    }

    Quit $$$OK
}

ClassMethod removeDefaultValue(key As %String, model As %DynamicObject) As %Status
{
    Set sc = $$$OK
    If key [ "." {
        Set className = key
    } Else {
        Set className = "Config."_key
    }

    New $NAMESPACE
    Set ns = $NAMESPACE, $NAMESPACE = "%SYS"
    Set obj = $CLASSMETHOD(className,"%New")
    Try {
        Set iter = model.%GetIterator()
        While iter.%GetNext(.property,.value) {
            If ##class(%Dictionary.CompiledProperty).%ExistsId(className_"||"_property) {
                
                If $PROPERTY(obj,property)=$PROPERTY(model,property) {
                    Do model.%Remove(property)
                }
            }
        }
    } Catch(ex) {
        Set sc = ex.AsStatus()
    }
    Set $NAMESPACE = ns

    Quit sc
}

ClassMethod processConfig(config As %DynamicObject) As %DynamicObject
{
    Set:'$ISOBJECT(config.Defaults) config.Defaults = {}
	
	Set processedConfig = config.%ToJSON()
	
	Set installDir = ##class(%File).GetDirectory($zu(86))
	
	Set replaceString("${MGRDIR}") = $SYSTEM.Util.ManagerDirectory()
	Set replaceString("${CSPDIR}") = ##class(%File).NormalizeDirectory("csp", installDir)
	
	#dim iter As %Iterator.Object = config.Defaults.%GetIterator()
	
	While iter.%GetNext(.property, .value) {
		Set replaceString( "${"_property_"}" ) = value
	}
	
	Do {
		Set i = $Increment(i), var = ""
		
		For  {
			Set var = $Order(replaceString(var), 1, value)
			Quit:var=""
			Set processedConfig = $Replace(processedConfig, var, $zconvert(value,"O","JS"))
		}
		
	} While (i < 3)	
	
    Set model = {}.%FromJSON(processedConfig)
    Do model.%Remove("Defaults")
    Quit model
}

ClassMethod toFile(object As %DynamicObject, filename As %String) As %Status
{
    Set dir = ##class(%File).GetDirectory(filename)
    
    If '##class(%File).DirectoryExists(dir) {
        Set created = ##class(%File).CreateDirectoryChain(dir)
        Quit:'created $$$ERROR(5001, "Fail to create directory chain")
    }

    Set configString = object.%ToJSON()
    Set formatter=##class(%JSON.Formatter).%New()
    Do formatter.FormatToString(object, .configString)

    #dim file As %Stream.FileCharacter = ##class(%Stream.FileCharacter).%New()
    $$$QuitOnError(file.LinkToFile(filename))
    Do file.Write(configString)
    Quit file.%Save()
}

}
