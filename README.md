# IRIS-Config-API

A library to ease IRIS configuration. 
Typically this library could be used in your application installer module. 
It allows you to prepare your environment before deploying your application code. 
 
Features :
 
* Create databases, namespaces, mappings, system settings, security settings, and more ... 
* Import configuration from JSON document. 
* Export configuration to JSON document. 
* RESTful application. 

Also, It could be combine with ZPM client (see this [article](https://community.intersystems.com/post/combine-config-api-zpm-client) and [repository](https://github.com/lscalese/objectscript-docker-template-with-config-api) )
 
## Table of contents
 
1. [Prerequisites](#Prerequisites)
2. [Installation Docker](#Installation-Docker)
3. [Installation ZPM](#Installation-ZPM)
4. [Installation by XML](#Installation-By-XML)
5. [Run Unit Tests](#Run-Unit-Tests)
6. [Basic example](#Basic-example)
7. [Advanced](#Advanced)
8. [Chain with ZPM](#Chain-With-ZPM)
9. [Service classes usage](#Service-classes-usage)
10. [Export configuration](#Export-configuration)
11. [REST application](#REST-application)
 
 
 
## Prerequisites
 
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.
 
## Installation Docker
 
Clone/git pull the repo into any local directory
 
```
$ git clone https://github.com/lscalese/iris-config-api.git
```
 
Open the terminal in this directory and run:
 
```
$ docker-compose build
```
 
3. Run the IRIS container with your project:
 
```
$ docker-compose up -d
```
 
## Installation ZPM
 
```
zpm "install config-api"
```
 
## Installation by XML
 
Download the latest version which includes dependencies on [release page](https://github.com/lscalese/iris-config-api/releases/). 
Import and compile. 
 
 
### Dependencies
 
A part of this development has been split into a separate library, more information on the project page [IO-Redirect](https://github.com/lscalese/IO-Redirect). 
 
 
## Run Unit Tests
 
It's highly recommended to perform unit tests on a clean and unused IRIS installation. 
Unit tests change system settings, create\update\remove databases, namespaces, ... 
Namespace "USER" must exist. 
 
Open IRIS terminal:
 
```
zpm "test config-api"
```
Or
 
```
Set ^UnitTestRoot = "/irisrun/repo/tests/"
Do ##class(%UnitTest.Manager).RunTest(,"/nodelete")
```
 
## How It works
 
Basically, developers write a configuration JSON document and load it with `##class(Api.Config.Services.Loader).Load()` method. 
 
Let's see a configuration document : 
 
```json
{
   "Defaults":{                    /* Declare your variables in the Defaults section. */
       "DBDIR" : "${MGRDIR}",      /* predefined variable with mgr directory path. */
       "WEBAPPDIR" : "${CSPDIR}"   /* predefined variable with csp directory path. */
   },
   "SYS.Databases":{               /* Service class name here SYS.Databases (related to Api.Config.Services.SYS.Databases.) */
       "${DBDIR}myappdata/" : {    /* Database directory to create, will be evaluated to /usr/irissys/mgr/myappdata/. */
           "ExpansionSize":128     /* Database properties (all properties defined in SYS.Databases are available) */
       },
       "${DBDIR}myappcode/": {}    /* Create /usr/irissys/mgr/myappcode/ database with default parameters. */
   },
   "Databases":{                               /* Service class name related to Api.Config.Services.Databases. */
       "MYAPPDATA" : {                         /* Create a database configuration named MYAPPDATA. */
           "Directory" : "${DBDIR}myappdata/"  /* Link /usr/irissys/mgr/myappdata/ to Database name MYAPPDATA. */
       },
       "MYAPPCODE" : {
           "Directory" : "${DBDIR}myappcode/"
       }
   },
   "Namespaces":{                  /* Service class name related to Api.Config.Services.Namespaces. */
       "MYAPP": {                  /* Create a Namespace MYAPP. */
           "Globals":"MYAPPDATA",  /* Set default database for globals. */
           "Routines":"MYAPPCODE"  /* Set default database for routines. */
       }
   },
   "Security.Applications": {                      /* Service class name related to Api.Config.Services.Security.Applications. */
       "/csp/zrestapp": {                          /* Create REST application /csp/zrestapp.  */
           "DispatchClass" : "my.dispatch.class",   /* Dispatch class. */
           "Namespace" : "MYAPP",                  /* Namespace... */
           "Enabled" : "1",
           "AuthEnabled": "64",
           "CookiePath" : "/csp/zrestapp/"
       }
   }
}
```
 
 
## Basic example
 
```ObjectScript
Set config = {"SYS.Databases":{"/usr/irissys/mgr/dbtestapi":{} } }
Set sc = ##class(Api.Config.Services.Loader).Load(config) /* config can be a %DynamicObject, a file name or a stream with the config JSON document. */
```
 
Output :
```
2021-03-27 22:45:25 Start load configuration
2021-03-27 22:45:25 {
 "SYS.Databases":{
   "/usr/irissys/mgr/dbtestapi":{
   }
 }
}
2021-03-27 22:45:25  * SYS.Databases
2021-03-27 22:45:25    + Create /usr/irissys/mgr/dbtestapi ... OK
```
 
The output is written on the current device. 
You can easily redirect to a stream, file, string, or a global using the`IORedirect.Redirect` class. 
More information about [IORedirect.Redirect here](https://github.com/lscalese/IO-Redirect). 
 
```ObjectScript
Do ##class(IORedirect.Redirect).ToFile(</path/to/logfile.log>)
Set config = {"SYS.Databases":{"/usr/irissys/mgr/dbtestapi":{} } }
Set sc = ##class(Api.Config.Services.Loader).Load(config)
Do ##class(IORedirect.Redirect).RestoreIO()
```
 
## Advanced
 
Now, let's try a configuration document a little bit more complex. 
In this example :
 
* variables usage.
* create databases
* create namespace,
* set globals\routines\packages mapping
* set system configuration (journal, locksiz,...)
 
```ObjectScript
Set config = {
   "Defaults":{
       "DBDIR" : "${MGRDIR}",
       "WEBAPPDIR" : "${CSPDIR}",
       "DBDATA" : "${DBDIR}myappdata/",
       "DBARCHIVE" : "${DBDIR}myapparchive/",
       "DBCODE" : "${DBDIR}myappcode/",
       "DBLOG" : "${DBDIR}myapplog/"
   },
   "SYS.Databases":{                           /* Service class Api.Config.Services.SYS.Databases */
       "${DBDATA}" : {"ExpansionSize":128},
       "${DBARCHIVE}" : {},
       "${DBCODE}" : {},
       "${DBLOG}" : {}
   },
   "Databases":{                               /* Service class Api.Config.Services.Database */
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
   "Namespaces":{                              /* Service class Api.Config.Services.Namespaces */
       "MYAPP": {
           "Globals":"MYAPPDATA",
           "Routines":"MYAPPCODE"
       }
   },
   "Security.Applications": {                  /* Service class Api.Config.Security.Applications */
       "/csp/zrestapp": {
           "DispatchClass" : "my.dispatch.class",
           "Namespace" : "MYAPP",
           "Enabled" : "1",
           "AutheEnabled": "64",
           "CookiePath" : "/csp/zrestapp/"
       },
       "/csp/zwebapp": {
           "Path": "${WEBAPPDIR}zwebapp/",
           "Namespace" : "MYAPP",
           "Enabled" : "1",
           "AutheEnabled": "64",
           "CookiePath" : "/csp/zwebapp/"
       }
   },
   "MapGlobals":{                              /* Service class Api.Config.MapGlobals */
       "MYAPP": [{
           "Name" : "Archive.Data",
           "Database" : "MYAPPARCHIVE"
       },{
           "Name" : "App.Log",
           "Database" : "MYAPPLOG"
       }]
   },
   "MapPackages": {                            /* Service class Api.Config.MapPackages */
       "MYAPP": [{
           "Namespace" : "MYAPP",
           "Name" : "PackageName",
           "Database" : "USER"
       }]
   },
   "MapRoutines": {                            /* Service class Api.Config.MapRoutines */
       "MYAPP": [{
           "Namespace" : "MYAPP",
           "Name" : "RoutineName",
           "Database" : "USER"
       }]
   },
   "Journal": {                                /* Service class Api.Config.Journal */
       "FreezeOnError":1
   },
   "Security.Services":{                       /* Service class Api.Config.Services */
       "%Service_Mirror": {
           "Enabled" : 0
       }
   },
   "SQL": {                                    /* Service class Api.Config.SQL */
       "LockThreshold" : 2500
   },
   "config": {                                 /* Service class Api.Config.config */
       "locksiz" : 33554432
   },
   "Startup":{                                 /* Service class Api.Config.Startup */
       "SystemMode" : "DEVELOPMENT"
   }
}
Set sc = ##class(Api.Config.Services.Loader).Load(config)
```
 
Take a look at the output, you can notice a dump of the configuration document with all variables evaluated and the status for each operation. 
 
<details>
 <summary>Output (click to expand): </summary>
 
```
2021-03-28 08:28:44 Start load configuration
2021-03-28 08:28:44 {
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
     "DispatchClass":"my.dispatch.class",
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
2021-03-28 08:28:44  * SYS.Databases
2021-03-28 08:28:44    + Create /usr/irissys/mgr/myappdata/ ... OK
2021-03-28 08:28:44    + Create /usr/irissys/mgr/myapparchive/ ... OK
2021-03-28 08:28:44    + Create /usr/irissys/mgr/myappcode/ ... OK
2021-03-28 08:28:44    + Create /usr/irissys/mgr/myapplog/ ... OK
2021-03-28 08:28:44  * Databases
2021-03-28 08:28:44    + Create MYAPPDATA ... OK
2021-03-28 08:28:44    + Create MYAPPCODE ... OK
2021-03-28 08:28:44    + Create MYAPPARCHIVE ... OK
2021-03-28 08:28:44    + Create MYAPPLOG ... OK
2021-03-28 08:28:44  * Namespaces
2021-03-28 08:28:44    + Create MYAPP ... OK
2021-03-28 08:28:44  * Security.Applications
2021-03-28 08:28:44    + Create /csp/zrestapp ... OK
2021-03-28 08:28:44    + Create /csp/zwebapp ... OK
2021-03-28 08:28:44  * MapGlobals
2021-03-28 08:28:44    + Create MYAPP Archive.Data ... OK
2021-03-28 08:28:44    + Create MYAPP App.Log ... OK
2021-03-28 08:28:45  * MapPackages
2021-03-28 08:28:45    + Create MYAPP PackageName ... OK
2021-03-28 08:28:45  * MapRoutines
2021-03-28 08:28:45    + Create MYAPP RoutineName ... OK
2021-03-28 08:28:45  * Journal
2021-03-28 08:28:45    + Update Journal ... OK
2021-03-28 08:28:45  * Security.Services
2021-03-28 08:28:45    + Update %Service_Mirror ... OK
2021-03-28 08:28:45  * SQL
2021-03-28 08:28:45    + Update SQL ... OK
2021-03-28 08:28:45  * config
2021-03-28 08:28:45    + Update config ... OK
2021-03-28 08:28:45  * Startup
2021-03-28 08:28:45    + Update Startup ... OK
```
</details>

## Chain With ZPM

** Experimental feature subject to modification or removal. **

In version 1.0.2, you can add a "ZPM" section to call directly zpm client command, ex : 

```json
{
    "Defaults":{
        "DBDATA" : "${MGRDIR}irisapp/",
        "APPNS" : "IRISAPP"
    },
    "SYS.Databases":{
        "${DBDATA}" : {}
    },
    "Databases":{
        "${APPNS}" : {
            "Directory" : "${DBDATA}"
        }
    },
    "Namespaces":{
        "${APPNS}": {
            "Globals":"${APPNS}"
        }
    },
    "ZPM":{
        "${APPNS}" : [{
            "load":"/opt/irisbuild/ -v"
        }]
    }
}
```

This configuration document create database and namespace nammed `IRISAPP` and execute `zpm "/opt/irisbuild/ -v"` on `IRISAPP` namespace.  
See a a fork of [intersystems-iris-dev-template](https://github.com/lscalese/intersystems-iris-dev-template) using Config-API to initialize application.  

## Service classes usage
 
For each service class there is a list of operations available depending on the type :
 
* List
* Get
* Update
* Create
* Delete
* Exists
 
For example `Api.Config.Services.Namespaces` allow all of the operations listed above, but `Api.Config.Services.Journal` allow only `Get` and `Update`. 
 
<details>
 <summary>See this table (click to expand): </summary>
 
| Service classes       | List  | Get   | Update    | Create    | Delete    | Exists    |
|-      |-      |-      |-      |-      |-      |-      |
| Api.Config.Services.Cluster | no | no | no | no | no | no |
| Api.Config.Services.ConfigFile | no | no | no | no | no | no |
| Api.Config.Services.Databases | no | no | no | no | no | no |
| Api.Config.Services.Debug | no | no | no | no | no | no |
| Api.Config.Services.DeviceSubTypes | no | no | no | no | no | no |
| Api.Config.Services.Devices | no | no | no | no | no | no |
| Api.Config.Services.ECP | no | no | no | no | no | no |
| Api.Config.Services.ECPServers | no | no | no | no | no | no |
| Api.Config.Services.IO | no | no | no | no | no | no |
| Api.Config.Services.Journal | no | no | no | no | no | no |
| Api.Config.Services.Library.SQLConnection | no | yes | yes | yes | yes | yes |
| Api.Config.Services.LicenseServers | no | no | no | no | no | no |
| Api.Config.Services.MagTapes | no | no | no | no | no | no |
| Api.Config.Services.MapGlobals | yes | yes | yes | yes | yes | yes |
| Api.Config.Services.MapMirrors | yes | yes | yes | yes | yes | yes |
| Api.Config.Services.MapPackages | yes | yes | yes | yes | yes | yes |
| Api.Config.Services.MapRoutines | yes | yes | yes | yes | yes | yes |
| Api.Config.Services.MapShadows | yes | yes | yes | yes | yes | yes |
| Api.Config.Services.MirrorMember | no | no | no | no | no | no |
| Api.Config.Services.Mirrors | no | no | no | no | no | no |
| Api.Config.Services.Miscellaneous | no | no | no | no | no | no |
| Api.Config.Services.Monitor | no | no | no | no | no | no |
| Api.Config.Services.Namespaces | no | no | no | no | no | no |
| Api.Config.Services.SQL | no | no | no | no | no | no |
| Api.Config.Services.SYS.Databases | yes | yes | yes | yes | yes | yes |
| Api.Config.Services.Security.Applications | no | no | no | no | no | no |
| Api.Config.Services.Security.LDAPConfigs | no | no | no | no | no | no |
| Api.Config.Services.Security.Resources | no | no | no | yes | no | no |
| Api.Config.Services.Security.Roles | no | no | no | yes | no | no |
| Api.Config.Services.Security.SQLAdminPrivilegeSet | yes | yes | yes | yes | yes | yes |
| Api.Config.Services.Security.SQLPrivileges | yes | yes | yes | yes | yes | yes |
| Api.Config.Services.Security.SSLConfigs | no | no | no | no | no | no |
| Api.Config.Services.Security.Services | yes | yes | yes | no | no | yes |
| Api.Config.Services.Security.Users | no | no | no | yes | no | no |
| Api.Config.Services.Shadows | no | no | no | no | no | no |
| Api.Config.Services.SqlSysDatatypes | no | no | no | no | no | no |
| Api.Config.Services.SqlUserDatatypes | no | no | no | no | no | no |
| Api.Config.Services.Startup | no | no | no | no | no | no |
| Api.Config.Services.Telnet | no | no | no | no | no | no |
| Api.Config.Services.config | no | no | no | no | no | no |
 
</details>
 
### Get
 
Get Journal setting: 
```
Set jrnSetting = ##class(Api.Config.Services.Journal).Get()
Do ##class(Api.Config.Developers.Utils).Show(jrnSetting)
```
 
Output:
```json
{
 "AlternateDirectory":"/usr/irissys/mgr/journal/",
 "BackupsBeforePurge":2,
 "CurrentDirectory":"/usr/irissys/mgr/journal/",
 "DaysBeforePurge":2,
 "FileSizeLimit":1024,
 "FreezeOnError":true,
 "JournalFilePrefix":"",
 "JournalcspSession":false
}
```
 
### Update
Update Journal setting, just the FileSizeLimit :
 
```
Set sc = ##class(Api.Config.Services.Journal).Update({"FileSizeLimit":256})
Write $SYSTEM.Status.GetOneErrorText(sc)
```
 
### List
Get the list of namespaces :
```
Set list = ##class(Api.Config.Services.Namespaces).List()
Do ##class(Api.Config.Developers.Utils).Show(list)
```
 
Output:
```json
[
 {
   "Globals":"IRISSYS",
   "Name":"%SYS",
   "Routines":"IRISSYS",
   "TempGlobals":"IRISTEMP"
 },
 {
   "Globals":"MYAPPDATA",
   "Name":"MYAPP",
   "Routines":"MYAPPCODE",
   "TempGlobals":"IRISTEMP"
 },
 {
   "Globals":"USER",
   "Name":"USER",
   "Routines":"USER",
   "TempGlobals":"IRISTEMP"
 }
]
```
 
### Exists
 
Check if a namespace exists :
```
Write ##class(Api.Config.Services.Namespaces).Exists("TESTAPI")
```
 
### Create
 Create a namespace: 
 
```
Set sc = ##class(Api.Config.Services.Namespaces).Create({"Globals":"USER","Routines":"USER","Name":"ZTESTAPI"})
Write $SYSTEM.Status.GetOneErrorText(sc)
```
 
### Delete
 
Delete a namespace: 
```
Set sc = ##class(Api.Config.Services.Namespaces).Delete("ZTESTAPI")
Write $SYSTEM.Status.GetOneErrorText(sc)
```
 
## Export configuration
 
This is an important feature to export existing configurations. It could be useful to generate a configuration document and create a script for a further install.  
 
Firstable, create a filter as follow and then call `export` method.: 
 
```ObjectScript
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
```
 
`Filter` has a structure pretty similar to a configuration document. 
`OnlyNotDefaultValue` allows export parameters has a value different from the "default value". 
It's very interesting to identify modified parameters and also to keep a configuration document clear with only relevant properties. 
 
Exported configuration :  
 
```json
{
 "Namespaces":{
   "MYAPP":{
     "Globals":"MYAPPDATA",
     "Name":"MYAPP",
     "Routines":"MYAPPCODE"
   }
 },
 "MapGlobals":{
   "MYAPP":[
     {
       "Collation":5,
       "Database":"MYAPPLOG",
       "LockDatabase":"MYAPPLOG",
       "Name":"App.Log",
       "Namespace":"MYAPP"
     },
     {
       "Collation":5,
       "Database":"MYAPPARCHIVE",
       "LockDatabase":"MYAPPARCHIVE",
       "Name":"Archive.Data",
       "Namespace":"MYAPP"
     }
   ]
 },
 "MapPackages":{
   "MYAPP":[
     {
       "Database":"USER",
       "Name":"PackageName",
       "Namespace":"MYAPP"
     }
   ]
 },
 "MapRoutines":{
   "MYAPP":[
     {
       "Database":"USER",
       "Name":"RoutineName",
       "Namespace":"MYAPP"
     }
   ]
 },
 "Security.Applications":{
   "/csp/zrestapp":{
     "CookiePath":"/csp/zrestapp/",
     "IsNameSpaceDefault":true,
     "MatchRoles":"",
     "Name":"/csp/zrestapp"
   },
   "/csp/zwebapp":{
     "CookiePath":"/csp/zwebapp/",
     "MatchRoles":"",
     "Name":"/csp/zwebapp",
     "Path":"/usr/irissys/csp/"
   }
 },
 "Journal":{
   "AlternateDirectory":"/usr/irissys/mgr/journal/",
   "CurrentDirectory":"/usr/irissys/mgr/journal/",
   "FreezeOnError":true
 },
 "config":{
   "locksiz":33554432
 }
}
```
 
# REST application
 
A REST API is also available allowing CRUD operation overall implemented config services, load configuration JSON document, create namespaces, databases, ...  
Configuration using a simple `curl` command line became possible. 
 
## Install WEB Application
 
Execute the following script to install web application /csp/config : 
 
```
Do ##class(Api.Config.Developers.Install).installRESTApp()
```
 
Note: If you use the docker template in this repository the web application /api/config is automatically installed.  
 
## REST operations
 
The [swagger file](https://github.com/lscalese/iris-config-api/blob/master/swagger.json) is available at `http://localhost:32773/api/config/`, load into your favorite software like :
 
* [swagger-ui modue](https://openexchange.intersystems.com/package/iris-web-swagger-ui)
* [swagger editor](https://editor.swagger.io)
* [Postman](https://www.postman.com/)
 
By default, the swagger specification's available at this location: `http://localhost:32773/api/config/` (adapt with your port number). 

Note: with this docker template, the [swagger-ui module](https://openexchange.intersystems.com/package/iris-web-swagger-ui) is automatically installed and available at `http://localhost:32773/swagger-ui/index.html`
 
![swagger-ui](https://github.com/lscalese/iris-config-api/blob/master/img/swagger-ui.png?raw=true)  


| Method        | Request       | Summary  |
|-      |-      |- |
| get | / | Swagger 2.0 specification |
| put | /loader | Load configuration. |
| delete | /loader | WARNING Delete all namespaces, databases, webapps,... defined in configuration object. |
| post | /export | Export a part of IRIS configuration. |
| get | /export/{id} | Get an existing configuration export. |
| get | /security/users | Get list of existing users. |
| post | /security/users | Create a new user. |
| get | /security/users/${name} | Get user detail. |
| put | /security/users/${name} | Update user. |
| delete | /security/users/${name} | Delete a user. |
| get | /security/roles | Get list of existing roles. |
| post | /security/roles | Create a new role. |
| get | /security/roles/${name} | Get role detail. |
| put | /security/roles/${name} | Update role. |
| delete | /security/roles/${name} | Delete a role. |
| get | /security/resources | Get list of existing resources. |
| post | /security/resources | Create a new resource. |
| get | /security/resources/${name} | Get resource detail. |
| put | /security/resources/${name} | Update resource. |
| delete | /security/resources/${name} | Delete a resource. |
| get | /security/sslconfigs | Get list of existing sslconfigs. |
| post | /security/sslconfigs | Create a new sslconfig. |
| get | /security/sslconfigs/${name} | Get sslconfig detail. |
| put | /security/sslconfigs/${name} | Update sslconfig. |
| delete | /security/sslconfigs/${name} | Delete a sslconfig. |
| get | /security/sqladminprivilegeset | Get list of SQLAdminPrivilegeSet. |
| put | /security/sqladminprivilegeset | Set SQLAdminPrivilegeSet. |
| get | /security/sqladminprivilegeset/{namespace}/{grantee} | Get SQLAdminPrivilegeSet detail. |
| delete | /security/sqladminprivilegeset/{namespace}/{grantee} | Delete SQLAdminPrivilegeSet. |
| get | /security/sqlprivileges/{namespace}/{grantee} | Get list of privilege for namespace and grantee. |
| delete | /security/sqlprivileges/{namespace}/{grantee} | Delete privileges for namespace and grantee. |
| put | /security/sqlprivileges | Set SQL Privileges. |
| get | /library/sqlconnection | Get list of existing SQLConnections. |
| post | /library/sqlconnection | Create a new sqlconnection. |
| get | /library/sqlconnection/${name} | Get SQLConnection detail. |
| put | /library/sqlconnection/${name} | Update SQLConnection. |
| delete | /library/sqlconnection/${name} | Delete SQLConnection. |
| get | /sys/databases | Get list of databases directory. |
| post | /sys/databases | Create a new database directory. |
| put | /sys/databases/{directory}/mounted | Mount database. |
| delete | /sys/databases/{directory}/mounted | Dismount database. |
| get | /sys/databases/{directory} | Get database directory details |
| put | /sys/databases/{directory} | Update details of an existing database directory. |
| delete | /sys/databases/{directory} |  |
| get | /databases/{name} |  |
| put | /databases/{name} |  |
| delete | /databases/{name} |  |
| get | /databases |  |
| post | /databases |  |
| get | /namespaces/{name} |  |
| put | /namespaces/{name} |  |
| delete | /namespaces/{name} |  |
| get | /namespaces |  |
| post | /namespaces |  |
| get | /security/applications | Get list of existing web applications. |
| post | /security/applications | Create a new web applications. |
| get | /security/applications/{name} | Get Web application. |
| put | /security/applications/{name} | Update Web application. |
| delete | /security/applications/{name} | Delete Web application. |
| get | /configfile |  |
| put | /configfile |  |
| get | /journal |  |
| put | /journal |  |
| get | /config |  |
| put | /config |  |
| get | /security/services | Get list of services. |
| get | /security/services/{name} | Get service detail by name |
| put | /security/services/{name} | Update service. |
| get | /cluster |  |
| put | /cluster |  |
| get | /debug/{name} |  |
| put | /debug/{name} |  |
| delete | /debug/{name} |  |
| get | /debug |  |
| post | /debug |  |
| get | /devicesubtypes/{name} |  |
| put | /devicesubtypes/{name} |  |
| delete | /devicesubtypes/{name} |  |
| get | /devicesubtypes |  |
| post | /devicesubtypes |  |
| get | /devices/{name} |  |
| put | /devices/{name} |  |
| delete | /devices/{name} |  |
| get | /devices |  |
| post | /devices |  |
| get | /ecp |  |
| put | /ecp |  |
| get | /ecpservers/{name} |  |
| put | /ecpservers/{name} |  |
| delete | /ecpservers/{name} |  |
| get | /ecpservers |  |
| post | /ecpservers |  |
| get | /io |  |
| put | /io |  |
| get | /licenseservers/{name} |  |
| put | /licenseservers/{name} |  |
| delete | /licenseservers/{name} |  |
| get | /licenseservers |  |
| post | /licenseservers |  |
| get | /magtapes/{name} |  |
| put | /magtapes/{name} |  |
| delete | /magtapes/{name} |  |
| get | /magtapes |  |
| post | /magtapes |  |
| get | /mapglobals/{namespace}/{name} |  |
| put | /mapglobals/{namespace}/{name} |  |
| delete | /mapglobals/{namespace}/{name} |  |
| get | /mapglobals/{namespace} |  |
| post | /mapglobals/{namespace} |  |
| get | /mapmirrors/{id}/{name} |  |
| put | /mapmirrors/{id}/{name} |  |
| delete | /mapmirrors/{id}/{name} |  |
| get | /mapmirrors/{id} |  |
| post | /mapmirrors/{id} |  |
| get | /mappackages/{namespace}/{name} |  |
| put | /mappackages/{namespace}/{name} |  |
| delete | /mappackages/{namespace}/{name} |  |
| get | /mappackages/{namespace} |  |
| post | /mappackages/{namespace} |  |
| get | /maproutines/{namespace}/{name} |  |
| put | /maproutines/{namespace}/{name} |  |
| delete | /maproutines/{namespace}/{name} |  |
| get | /maproutines/{namespace} |  |
| post | /maproutines/{namespace} |  |
| get | /mapshadows/{id}/{name} |  |
| put | /mapshadows/{id}/{name} |  |
| delete | /mapshadows/{id}/{name} |  |
| get | /mapshadows/{id} |  |
| post | /mapshadows/{id} |  |
| get | /mirrormember |  |
| put | /mirrormember |  |
| get | /mirrors/{name} |  |
| put | /mirrors/{name} |  |
| delete | /mirrors/{name} |  |
| get | /mirrors |  |
| post | /mirrors |  |
| get | /miscellaneous |  |
| put | /miscellaneous |  |
| get | /monitor |  |
| put | /monitor |  |
| get | /sql |  |
| put | /sql |  |
| get | /shadows/{name} |  |
| put | /shadows/{name} |  |
| delete | /shadows/{name} |  |
| get | /shadows |  |
| post | /shadows |  |
| get | /sqlsysdatatypes/{name} |  |
| put | /sqlsysdatatypes/{name} |  |
| delete | /sqlsysdatatypes/{name} |  |
| get | /sqlsysdatatypes |  |
| post | /sqlsysdatatypes |  |
| get | /sqluserdatatypes/{name} |  |
| put | /sqluserdatatypes/{name} |  |
| delete | /sqluserdatatypes/{name} |  |
| get | /sqluserdatatypes |  |
| post | /sqluserdatatypes |  |
| get | /startup |  |
| put | /startup |  |
| get | /telnet |  |
| put | /telnet |  |
 
 

 
 

