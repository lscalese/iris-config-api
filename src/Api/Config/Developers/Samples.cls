/// code samples
/// Description
Class Api.Config.Developers.Samples
{

ClassMethod firstStep() As %Status
{
    /// zw ##class(Api.Config.Developers.Samples).firstStep()
    Set config = {
        "Security.Roles":{
            "MyAppRoleRO" : {
                "Descripion" : "MyApp SQL Read Only Role",
                "Resources" : "%Service_SQL:U",
                "GrantedRoles" : "%SQL"
            },
            "MyAppRoleRW" : {
                "Descripion" : "MyApp SQL Read\\Write Role",
                "Resources" : "%Service_SQL:U",
                "GrantedRoles" : "%SQL"
            }
        },
        "Security.SQLPrivileges": [{
            "Grantable" : 0,
            "Grantee": "MyAppRoleRO",
            "Grantor" : "_SYSTEM",
            "Namespace" : "${namespace}",
            "PrivList" : "s",
            "SQLObject" : "1,Api_*"
        },{
            "Grantable" : 0,
            "Grantee": "MyAppRoleRW",
            "Grantor" : "_SYSTEM",
            "Namespace" : "${namespace}",
            "PrivList" : "siud",
            "SQLObject" : "1,Api_*"
        }],
        "Security.Users": {
            "SQLUserRW": {
                "Description":"SQLUser1",
                "Password" : "$$test$$",
                "ChangePassword" : 1,
                "AccountNeverExpires": 1,
                "Roles":"MyAppRoleRW",
                "Namespace" : "${namespace}"
            },
            "SQLUserRO": {
                "Description":"SQLUserRO",
                "Password" : "$$test$$",
                "ChangePassword" : 0,
                "AccountNeverExpires": 1,
                "Roles":"MyAppRoleRO",
                "Namespace" : "${namespace}"
            }
        },
        "Security.SSLConfigs": {
            "SSLDefault":{}
        },
        "Library.SQLConnection": {
            "SQLConnection1" : {},
            "SQLConnection2" : {}
        },
        "Security.SQLAdminPrivilegeSet" : {
            "${namespace}": [{
                "CreateTable" : 1,
                "Grantee" : "SQLUserRW"
            }]
        }
    }
    Set sc = ##class(Api.Config.Services.Loader).Load(config)
    Quit sc
}

ClassMethod firstAppEnvironment() As %Status
{
    /// zw ##class(Api.Config.Developers.Samples).firstAppEnvironment()
    Set config = {
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
        }
    }
    Set sc = ##class(Api.Config.Services.Loader).Load(config)
    Quit sc
}

/// zw ##class(Api.Config.Developers.Samples).advanced()
ClassMethod advanced() As %Status
{
    Set config = {
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
    Set sc = ##class(Api.Config.Services.Loader).Load(config)
    Quit sc
}

/// zw ##class(Api.Config.Developers.Samples).TestExport()
/// d ##class(Api.Config.Developers.Utils).Show(##class(Api.Config.Developers.Samples).TestExport())
ClassMethod TestExport() As %Status
{
    Set filter = {
        "Namespaces": {   
            "${namespace}":""    /* Namespace to export */
        },
        "MapGlobals":{
            "${namespace}":""    /* Export all globals mapping for namespace MYAPP */
        },
        "MapPackages":{ 
            "${namespace}":""    /* Export all packages mapping for namespace MYAPP */
        },
        "MapRoutines":{
            "${namespace}":""    /* Export all routines mapping for namespace MYAPP */
        },
        "Security.Applications":{
            "/csp/zrestapp":"",   /* Export Web applications parameters /csp/zrestapp */
            "/csp/zwebapp":""     /* Export Web applications parameters /csp/zwebapp */
        },
        "Journal":"",  /* Export all journal setting.  *There is a trick to export only non default parameters(see below) */
        "config":"",   /* Export config parameters */
        "Library.SQLConnection":"",
        "Security.Users":"",
        "Security.SQLAdminPrivilegeSet":{
            "${namespace}":""
        },
        "Security.SQLPrivileges":""
    }
    Set OnlyNotDefaultValue = 1
    Set config = ##class(Api.Config.Services.Loader).export(filter,OnlyNotDefaultValue)
    Quit config
}

}
