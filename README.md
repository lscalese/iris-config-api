#  IRIS-Config-API

A library to ease IRIS configuration.  
Typically this library could be used in your application installer module.  
It allow to prepare your environment before install your application.  

Features : 

 * Create databases, namespaces, mappings, system settings and more ...  
 * Import configuration from JSON document.  
 * Export configuration to JSON document.  
 * RESTfull application.  

## Table of contents

1. [Prerequisites](#Prerequisites)
2. [Installation Docker](#Installation-Docker)
3. [Installation ZPM](#Installation-ZPM)
4. [Installation by XML](#Installation-By-XML)
5. [Run Unit Tests](#Run-Unit-Tests)
6. [Basic example](#Basic-example)
7. [Advanced](#Basic-example)



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

Download the latest version which include dependencies on [release page](https://github.com/lscalese/iris-config-api/releases/).  
Import and compile.  


### Dependencies

A part of this development has been splitted to a separate library [IO-Redirect](https://github.com/lscalese/IO-Redirect).  
You can download a xml with all sources [here](https://github.com/lscalese/IO-Redirect/releases/download/v0.4.0/io-redirect-v0.4.0.xml).  


## Run Unit Tests

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

Basically, there is a related for class for each existing class in %SYS Config package (and few classes from SYS and Security) to allow a configuration using a JSON document.  See the following example : 

```json
{
    "Defaults":{                    /* Declare your variables in Defaults section. */
        "DBDIR" : "${MGRDIR}",      /* predefined variable with mgr directory path. */
        "WEBAPPDIR" : "${CSPDIR}"   /* predefined variable with csp directory path. */
    },
    "SYS.Databases":{               /* Service class name here SYS.Databases (related to Api.Config.Services.SYS.Databases. */
        "${DBDIR}myappdata/" : {    /* Database directory to create, will be evaluated to /usr/irissys/mgr/myappdata/. */
            "ExpansionSize":128     /* Database parameters... */
        },
        "${DBDIR}myappcode/": {}    /* Create /usr/irissys/mgr/myappcode/ database with default parameters. */
    },
    "Databases":{                               /* Service class name related to Api.Config.Services.Databases". */
        "MYAPPDATA" : {                         /* Crate a database configuration named MYAPPDATA. */
            "Directory" : "${DBDIR}myappdata/"  /* Link /usr/irissys/mgr/myappdata/ to Database name MYAPPDATA. */
        },
        "MYAPPCODE" : {
            "Directory" : "${DBDIR}myappcode/"
        }
    },
    "Namespaces":{                  /* Service class name related to Api.Config.Services.Namespaces." */
        "MYAPP": {                  /* Create a Namespace "MYAPP". */
            "Globals":"MYAPPDATA",  /* Set default database for globals. */
            "Routines":"MYAPPCODE"  /* Set default database for routines. */
        }
    },
    "Security.Applications": {                      /* Service class name related to Api.Config.Services.Security.Applications." */
        "/csp/zrestapp": {                          /* Create REST application /csp/zrestapp.  */
            "DispatchClas" : "my.dispatch.class",   /* Dispatch class. */
            "Namespace" : "MYAPP",                  /* Namespace... */
            "Enabled" : "1",
            "AuthEnabled": "64",
            "CookiePath" : "/csp/zrestapp/"
        }
    }
}
```

Observ `Api.Config.Services` package to see the list of available [services](https://github.com/lscalese/iris-config-api/tree/master/src/Api/Config/Services).  


## Basic example

```ObjectScript
Set config = {"SYS.Databases":{"/usr/irissys/mgr/dbtestapi":{} } }
Set sc = ##class(Api.Config.Services.Loader).Load(config) /* config can be a %DynamicObject, a file name or a stream with the config. */
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
You can easily redirect to a stream, file, string or a global using `IORedirect.Redirect` class.  
More information about [IORedirect.Redirect here](https://github.com/lscalese/IO-Redirect).  

```ObjectScript
Do ##class(IORedirect.Redirect).ToFile("</path/to/logfile.log>")
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
Set sc = ##class(Api.Config.Services.Loader).Load(config)
```

If you analyze the output, you can notice a dump of the configuration document with all variables evaluated.  

Output
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

## Export configuration

There is a feature to export existing configuration.  
It's useful to generate a JSON document from an existing installation in order to use it for automatisation of further installation.  
Howewer, there is a lot of parameters... It's necessary to select wanted items.  

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
    "Journal":""  /* Export all journal setting.  *There is a trick to export only non default parameters(see below) */
    "config":""   /* Export config parameters */
}
Set OnlyNotDefaultValue = 1
Set config = ##class(Api.Config.Services.Loader).export(filter,OnlyNotDefaultValue)
```

`Filter` has a structure pretty similar to configuration document.  
`OnlyNotDefaultValue` allow to export parameters has value different of the "default value".  
It's an interesting feature to identify modified parameters and also to keep a configuration document clear.  
In most case, it's not necessary to export parameters wich contain the default value.  

