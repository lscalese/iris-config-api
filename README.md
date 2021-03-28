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
2. [Installation](#Installation)
3. [Installation ZPM](#Installation-ZPM)
4. [Run Unit Tests](#Run-Unit-Tests)


## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation 

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

### Dependencies

For non Docker\ZPM user, a part of this development has been splitted to a separate library [IO-Redirect](https://github.com/lscalese/IO-Redirect).  
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

## Samples

### Basic example

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
Set sc = ##class(Api.Config.Services.Loader).Load(config) /* config can be a %DynamicObject, a file name or a stream with the config. */
Do ##class(IORedirect.Redirect).RestoreIO()
```
