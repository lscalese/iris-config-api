/// Description
Class UnitTests.Api.Config.Services.Loader Extends %UnitTest.TestCase
{

Method TestVars() As %Status
{
    Set sc = $$$OK
    Do $$$LogMessage("Test Defaults section - vars evaluation.")
    Set config = ..getConfig()
    Set processedConfig = ##class(Api.Config.Services.Loader).processConfig(config)
    Set installDir = ##class(%File).GetDirectory($zu(86))
    Set mgrdir = $SYSTEM.Util.ManagerDirectory()
    Set cspdir = ##class(%File).NormalizeDirectory("csp", installDir)
    
    Set expected = $SYSTEM.Util.ManagerDirectory()_"myappdata/"
    Do $$$AssertEquals(processedConfig.Databases.MYAPPDATA.Directory,expected, "Check directory of MYAPPDATA must be "_expected _" was "_processedConfig.Databases.MYAPPDATA.Directory)
    
    Set expected = cspdir_"zwebapp/"
    Do $$$AssertEquals(processedConfig."Security.Applications"."/csp/zwebapp".Path,expected, "Check csp app path must be" _expected _" was "_processedConfig."Security.Applications"."/csp/zwebapp".Path)

    Quit sc
}

Method Test01Load() As %Status
{
    Set sc = $$$OK
    Do $$$LogMessage("Test Load from %Dynamic Object.")
    Set config = ..getConfig()
    Set sc = ##class(Api.Config.Services.Loader).Load(config)
    Do $$$AssertStatusOK(sc)

    Do $$$LogMessage("Test Load from Stream.")
    #dim xData As %Dictionary.CompiledXData = ##class(%Dictionary.CompiledXData).%OpenId($CLASSNAME()_"||config")
    Set sc = ##class(Api.Config.Services.Loader).Load(xData.Data)
    Do $$$AssertStatusOK(sc)

    Set fileName = ##class(%File).NormalizeDirectory("")_"tempconfig.json"
    Set file = ##class(%Stream.FileCharacter).%New()
    Do file.LinkToFile(fileName)
    Do file.CopyFromAndSave(xData.Data)
    Do file.%Close()
    kill file 

    Do $$$LogMessage("Test Load from file.")
    Try {
        Set sc = ##class(Api.Config.Services.Loader).Load(fileName)
    }
    Catch ex {
        Set sc=ex.AsStatus()
    }
    
    Do $$$AssertStatusOK(sc)


    Do ##class(%File).Delete(fileName)
    Quit sc
}

Method Test02Export() As %Status
{
    Do $$$LogMessage("Test Export configuration.")
    Set sc = $$$OK
    Set filter = {
        "Namespaces": {   
            "%SYS":""    /* Namespace to export */
        },
        "Journal":"",  /* Export all journal setting.  *There is a trick to export only non default parameters(see below) */
        "config":""   /* Export config parameters */
    }

    Set OnlyNotDefaultValue = 0
    Set config = ##class(Api.Config.Services.Loader).export(filter,OnlyNotDefaultValue)
    Do ##class(Api.Config.Developers.Utils).Show(config)

    Do $$$AssertStatusEquals($isobject(config.Namespaces."%SYS"),1,"Check if Namspace %SYS has been exported")
    Do $$$AssertStatusEquals($isobject(config.Journal),1,"Check if Journal settings has been exported")
    Do $$$AssertStatusEquals($isobject(config.config),1,"Check if config system settings has been exported")
    
    Quit sc
}

ClassMethod getConfig() As %DynamicObject
{
    #dim xData As %Dictionary.CompiledXData = ##class(%Dictionary.CompiledXData).%OpenId($CLASSNAME()_"||config")
    Quit {}.%FromJSON(xData.Data)
}

/// Configuration TEST Document
XData config [ MimeType = application/json ]
{
{
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
            "Path": "${WEBAPPDIR}zwebapp/",
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
}

}
