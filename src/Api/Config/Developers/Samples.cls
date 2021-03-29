/// code samples
/// Description
Class Api.Config.Developers.Samples
{

/// zw ##class(Api.Config.Developers.Samples).advanced()
ClassMethod advanced() As %Status
{
    Set config = {
        "SYS.Databases":{
            "/usr/irissys/mgr/myappdata/":{
            "ExpansionSize":128
            },
            "/usr/irissys/mgr/myapparchive/":{
            },
            "/usr/irissys/mgr/myappcode/":{
            },
            "/usr/irissys/mgr/myapplog/":{
            }
        },
        "Databases":{
            "MYAPPDATA":{
            "Directory":"/usr/irissys/mgr/myappdata/"
            },
            "MYAPPCODE":{
            "Directory":"/usr/irissys/mgr/myappcode/"
            },
            "MYAPPARCHIVE":{
            "Directory":"/usr/irissys/mgr/myapparchive/"
            },
            "MYAPPLOG":{
            "Directory":"/usr/irissys/mgr/myapplog/"
            }
        },
        "Namespaces":{
            "MYAPP":{
            "Globals":"MYAPPDATA",
            "Routines":"MYAPPCODE"
            }
        },
        "Security.Applications":{
            "/csp/zrestapp":{
            "DispatchClas":"my.dispatch.class",
            "Namespace":"MYAPP",
            "Enabled":"1",
            "AuthEnabled":"64",
            "CookiePath":"/csp/zrestapp/"
            },
            "/csp/zwebapp":{
            "Path":"/usr/irissys/csp/",
            "Namespace":"MYAPP",
            "Enabled":"1",
            "AuthEnabled":"64",
            "CookiePath":"/csp/zwebapp/"
            }
        },
        "MapGlobals":{
            "MYAPP":[
            {
                "Name":"Archive.Data",
                "Database":"MYAPPARCHIVE"
            },
            {
                "Name":"App.Log",
                "Database":"MYAPPLOG"
            }
            ]
        },
        "MapPackages":{
            "MYAPP":[
            {
                "Namespace":"MYAPP",
                "Name":"PackageName",
                "Database":"USER"
            }
            ]
        },
        "MapRoutines":{
            "MYAPP":[
            {
                "Namespace":"MYAPP",
                "Name":"RoutineName",
                "Database":"USER"
            }
            ]
        },
        "Journal":{
            "FreezeOnError":1
        },
        "Security.Services":{
            "%Service_Mirror":{
            "Enabled":0
            }
        },
        "SQL":{
            "LockThreshold":2500
        },
        "config":{
            "locksiz":33554432
        },
        "Startup":{
            "SystemMode":"DEVELOPMENT"
        }
    }
    Set sc = ##class(Api.Config.Services.Loader).Load(config)
    Quit sc
}

/// zw ##class(Api.Config.Developers.Samples).export()
ClassMethod export() As %Status
{
    Set filter = {
        "Namespaces": {   
            "MYAPP":""    /* Namespace to export */
        },
        "MapGlobals":{
            "MYAPP":""    /* Export all globals mapping for namespace MYAPP */
        },
        "MapPackages":{ 
            "MYAPP":""    /* Export all packages mapping for namespace MYAPP */
        },
        "MapRoutines":{
            "MYAPP":""    /* Export all routines mapping for namespace MYAPP */
        },
        "Security.Applications":{
            "/csp/zrestapp":"",   /* Export Web applications parameters /csp/zrestapp */
            "/csp/zwebapp":""     /* Export Web applications parameters /csp/zwebapp */
        },
        "Journal":"",  /* Export all journal setting.  *There is a trick to export only non default parameters(see below) */
        "config":""   /* Export config parameters */
    }
    Set OnlyNotDefaultValue = 1
    Set config = ##class(Api.Config.Services.Loader).export(filter,OnlyNotDefaultValue)
    Quit config
}

}
