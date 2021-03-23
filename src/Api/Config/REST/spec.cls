Class Api.Config.REST.spec Extends %REST.Spec [ ProcedureBlock ]
{

XData OpenAPI [ MimeType = application/json ]
{
{
  "swagger":"2.0",
  "basePath":"/api/config",
  "schemes":[
    "http",
    "https"
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
    },
    "/cluster/":{
      "get":{
        "operationId":"GetCluster",
        "description":"Get Cluster.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/Cluster"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"Cluster not found."
          }
        }
      },
      "put":{
        "operationId":"PutCluster",
        "description":"Update Cluster.",
        "parameters":[
          {
            "name":"model",
            "description":"Cluster to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Cluster"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Cluster to update not found."
          }
        }
      }
    },
    "/configfile/":{
      "get":{
        "operationId":"GetConfigFile",
        "description":"Get ConfigFile.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ConfigFile"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"ConfigFile not found."
          }
        }
      },
      "put":{
        "operationId":"PutConfigFile",
        "description":"Update ConfigFile.",
        "parameters":[
          {
            "name":"model",
            "description":"ConfigFile to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/ConfigFile"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"ConfigFile to update not found."
          }
        }
      }
    },
    "/databases/{name}":{
      "get":{
        "operationId":"GetDatabases",
        "description":"Get Databases.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/Databases"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"Databases not found."
          }
        }
      },
      "put":{
        "operationId":"PutDatabases",
        "description":"Update Databases.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"Databases to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Databases"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Databases to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostDatabases",
        "description":"Create Databases.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"Databases to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Databases"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"Databases created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"Databases already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteDatabases",
        "description":"Delete Databases.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"Databases deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Databases not found."
          }
        }
      }
    },
    "/databases/":{
      "get":{
        "operationId":"GetListDatabases",
        "description":"Get List Of Databases.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfDatabases"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/debug/{name}":{
      "get":{
        "operationId":"GetDebug",
        "description":"Get Debug.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/Debug"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"Debug not found."
          }
        }
      },
      "put":{
        "operationId":"PutDebug",
        "description":"Update Debug.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"Debug to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Debug"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Debug to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostDebug",
        "description":"Create Debug.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"Debug to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Debug"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"Debug created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"Debug already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteDebug",
        "description":"Delete Debug.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"Debug deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Debug not found."
          }
        }
      }
    },
    "/debug/":{
      "get":{
        "operationId":"GetListDebug",
        "description":"Get List Of Debug.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfDebug"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/devicesubtypes/{name}":{
      "get":{
        "operationId":"GetDeviceSubTypes",
        "description":"Get DeviceSubTypes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/DeviceSubTypes"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"DeviceSubTypes not found."
          }
        }
      },
      "put":{
        "operationId":"PutDeviceSubTypes",
        "description":"Update DeviceSubTypes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"DeviceSubTypes to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/DeviceSubTypes"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"DeviceSubTypes to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostDeviceSubTypes",
        "description":"Create DeviceSubTypes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"DeviceSubTypes to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/DeviceSubTypes"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"DeviceSubTypes created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"DeviceSubTypes already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteDeviceSubTypes",
        "description":"Delete DeviceSubTypes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"DeviceSubTypes deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"DeviceSubTypes not found."
          }
        }
      }
    },
    "/devicesubtypes/":{
      "get":{
        "operationId":"GetListDeviceSubTypes",
        "description":"Get List Of DeviceSubTypes.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfDeviceSubTypes"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/devices/{name}":{
      "get":{
        "operationId":"GetDevices",
        "description":"Get Devices.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/Devices"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"Devices not found."
          }
        }
      },
      "put":{
        "operationId":"PutDevices",
        "description":"Update Devices.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"Devices to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Devices"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Devices to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostDevices",
        "description":"Create Devices.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"Devices to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Devices"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"Devices created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"Devices already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteDevices",
        "description":"Delete Devices.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"Devices deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Devices not found."
          }
        }
      }
    },
    "/devices/":{
      "get":{
        "operationId":"GetListDevices",
        "description":"Get List Of Devices.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfDevices"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/ecp/":{
      "get":{
        "operationId":"GetECP",
        "description":"Get ECP.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ECP"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"ECP not found."
          }
        }
      },
      "put":{
        "operationId":"PutECP",
        "description":"Update ECP.",
        "parameters":[
          {
            "name":"model",
            "description":"ECP to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/ECP"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"ECP to update not found."
          }
        }
      }
    },
    "/ecpservers/{name}":{
      "get":{
        "operationId":"GetECPServers",
        "description":"Get ECPServers.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ECPServers"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"ECPServers not found."
          }
        }
      },
      "put":{
        "operationId":"PutECPServers",
        "description":"Update ECPServers.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"ECPServers to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/ECPServers"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"ECPServers to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostECPServers",
        "description":"Create ECPServers.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"ECPServers to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/ECPServers"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"ECPServers created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"ECPServers already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteECPServers",
        "description":"Delete ECPServers.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"ECPServers deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"ECPServers not found."
          }
        }
      }
    },
    "/ecpservers/":{
      "get":{
        "operationId":"GetListECPServers",
        "description":"Get List Of ECPServers.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfECPServers"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/io/":{
      "get":{
        "operationId":"GetIO",
        "description":"Get IO.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/IO"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"IO not found."
          }
        }
      },
      "put":{
        "operationId":"PutIO",
        "description":"Update IO.",
        "parameters":[
          {
            "name":"model",
            "description":"IO to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/IO"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"IO to update not found."
          }
        }
      }
    },
    "/journal/":{
      "get":{
        "operationId":"GetJournal",
        "description":"Get Journal.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/Journal"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"Journal not found."
          }
        }
      },
      "put":{
        "operationId":"PutJournal",
        "description":"Update Journal.",
        "parameters":[
          {
            "name":"model",
            "description":"Journal to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Journal"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Journal to update not found."
          }
        }
      }
    },
    "/licenseservers/{name}":{
      "get":{
        "operationId":"GetLicenseServers",
        "description":"Get LicenseServers.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/LicenseServers"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"LicenseServers not found."
          }
        }
      },
      "put":{
        "operationId":"PutLicenseServers",
        "description":"Update LicenseServers.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"LicenseServers to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/LicenseServers"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"LicenseServers to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostLicenseServers",
        "description":"Create LicenseServers.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"LicenseServers to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/LicenseServers"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"LicenseServers created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"LicenseServers already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteLicenseServers",
        "description":"Delete LicenseServers.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"LicenseServers deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"LicenseServers not found."
          }
        }
      }
    },
    "/licenseservers/":{
      "get":{
        "operationId":"GetListLicenseServers",
        "description":"Get List Of LicenseServers.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfLicenseServers"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/magtapes/{name}":{
      "get":{
        "operationId":"GetMagTapes",
        "description":"Get MagTapes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/MagTapes"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"MagTapes not found."
          }
        }
      },
      "put":{
        "operationId":"PutMagTapes",
        "description":"Update MagTapes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"MagTapes to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MagTapes"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MagTapes to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostMagTapes",
        "description":"Create MagTapes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"MagTapes to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MagTapes"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"MagTapes created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"MagTapes already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteMagTapes",
        "description":"Delete MagTapes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"MagTapes deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MagTapes not found."
          }
        }
      }
    },
    "/magtapes/":{
      "get":{
        "operationId":"GetListMagTapes",
        "description":"Get List Of MagTapes.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfMagTapes"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/mapglobals/{namespace}/{name}":{
      "get":{
        "operationId":"GetMapGlobals",
        "description":"Get MapGlobals.",
        "parameters":[
          {
            "name":"namespace",
            "description":"Namespace where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/MapGlobals"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"MapGlobals not found."
          }
        }
      },
      "put":{
        "operationId":"PutMapGlobals",
        "description":"Update MapGlobals.",
        "parameters":[
          {
            "name":"namespace",
            "description":"Namespace where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"MapGlobals to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MapGlobals"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MapGlobals to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostMapGlobals",
        "description":"Create MapGlobals.",
        "parameters":[
          {
            "name":"namespace",
            "description":"Namespace where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"MapGlobals to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MapGlobals"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"MapGlobals created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"MapGlobals already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteMapGlobals",
        "description":"Delete MapGlobals.",
        "parameters":[
          {
            "name":"namespace",
            "description":"Namespace where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"MapGlobals deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MapGlobals not found."
          }
        }
      }
    },
    "/mapglobals/{namespace}/":{
      "get":{
        "operationId":"GetListMapGlobals",
        "description":"Get List Of MapGlobals.",
        "parameters":[
          {
            "name":"namespace",
            "description":"namespace.",
            "in":"path",
            "required":true,
            "type":"string"
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfMapGlobals"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/mapmirrors/{id}/{name}":{
      "get":{
        "operationId":"GetMapMirrors",
        "description":"Get MapMirrors.",
        "parameters":[
          {
            "name":"id",
            "description":"ID where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"This is the name of this instance in the mirror. Mirror system names\r\nmust be unique (enforced by Enterprise Manager) across all of the mirrors which \r\nthe EM manages, as an instance has a single mirror system name which \r\nmay appear in multiple mirror sets (eg. a reporting member may connect\r\nto multiple mirrors). For the most part the <property>GUID </property>\r\nis used to identify a mirror member, the Name is used for display \r\npurposes. \r\n<br><br>\r\nThe name must not contain a colon (':') and is converted to uppercase before\r\nsaving.",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/MapMirrors"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"MapMirrors not found."
          }
        }
      },
      "put":{
        "operationId":"PutMapMirrors",
        "description":"Update MapMirrors.",
        "parameters":[
          {
            "name":"id",
            "description":"ID where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"This is the name of this instance in the mirror. Mirror system names\r\nmust be unique (enforced by Enterprise Manager) across all of the mirrors which \r\nthe EM manages, as an instance has a single mirror system name which \r\nmay appear in multiple mirror sets (eg. a reporting member may connect\r\nto multiple mirrors). For the most part the <property>GUID </property>\r\nis used to identify a mirror member, the Name is used for display \r\npurposes. \r\n<br><br>\r\nThe name must not contain a colon (':') and is converted to uppercase before\r\nsaving.",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"MapMirrors to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MapMirrors"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MapMirrors to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostMapMirrors",
        "description":"Create MapMirrors.",
        "parameters":[
          {
            "name":"id",
            "description":"ID where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"This is the name of this instance in the mirror. Mirror system names\r\nmust be unique (enforced by Enterprise Manager) across all of the mirrors which \r\nthe EM manages, as an instance has a single mirror system name which \r\nmay appear in multiple mirror sets (eg. a reporting member may connect\r\nto multiple mirrors). For the most part the <property>GUID </property>\r\nis used to identify a mirror member, the Name is used for display \r\npurposes. \r\n<br><br>\r\nThe name must not contain a colon (':') and is converted to uppercase before\r\nsaving.",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"MapMirrors to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MapMirrors"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"MapMirrors created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"MapMirrors already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteMapMirrors",
        "description":"Delete MapMirrors.",
        "parameters":[
          {
            "name":"id",
            "description":"ID where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"This is the name of this instance in the mirror. Mirror system names\r\nmust be unique (enforced by Enterprise Manager) across all of the mirrors which \r\nthe EM manages, as an instance has a single mirror system name which \r\nmay appear in multiple mirror sets (eg. a reporting member may connect\r\nto multiple mirrors). For the most part the <property>GUID </property>\r\nis used to identify a mirror member, the Name is used for display \r\npurposes. \r\n<br><br>\r\nThe name must not contain a colon (':') and is converted to uppercase before\r\nsaving.",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"MapMirrors deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MapMirrors not found."
          }
        }
      }
    },
    "/mapmirrors/":{
      "get":{
        "operationId":"GetListMapMirrors",
        "description":"Get List Of MapMirrors.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfMapMirrors"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/mappackages/{namespace}/{name}":{
      "get":{
        "operationId":"GetMapPackages",
        "description":"Get MapPackages.",
        "parameters":[
          {
            "name":"namespace",
            "description":"Namespace where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/MapPackages"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"MapPackages not found."
          }
        }
      },
      "put":{
        "operationId":"PutMapPackages",
        "description":"Update MapPackages.",
        "parameters":[
          {
            "name":"namespace",
            "description":"Namespace where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"MapPackages to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MapPackages"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MapPackages to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostMapPackages",
        "description":"Create MapPackages.",
        "parameters":[
          {
            "name":"namespace",
            "description":"Namespace where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"MapPackages to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MapPackages"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"MapPackages created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"MapPackages already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteMapPackages",
        "description":"Delete MapPackages.",
        "parameters":[
          {
            "name":"namespace",
            "description":"Namespace where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"MapPackages deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MapPackages not found."
          }
        }
      }
    },
    "/mappackages/{namespace}/":{
      "get":{
        "operationId":"GetListMapPackages",
        "description":"Get List Of MapPackages.",
        "parameters":[
          {
            "name":"namespace",
            "description":"namespace.",
            "in":"path",
            "required":true,
            "type":"string"
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfMapPackages"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/maproutines/{namespace}/{name}":{
      "get":{
        "operationId":"GetMapRoutines",
        "description":"Get MapRoutines.",
        "parameters":[
          {
            "name":"namespace",
            "description":"Namespace where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/MapRoutines"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"MapRoutines not found."
          }
        }
      },
      "put":{
        "operationId":"PutMapRoutines",
        "description":"Update MapRoutines.",
        "parameters":[
          {
            "name":"namespace",
            "description":"Namespace where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"MapRoutines to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MapRoutines"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MapRoutines to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostMapRoutines",
        "description":"Create MapRoutines.",
        "parameters":[
          {
            "name":"namespace",
            "description":"Namespace where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"MapRoutines to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MapRoutines"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"MapRoutines created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"MapRoutines already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteMapRoutines",
        "description":"Delete MapRoutines.",
        "parameters":[
          {
            "name":"namespace",
            "description":"Namespace where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"MapRoutines deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MapRoutines not found."
          }
        }
      }
    },
    "/maproutines/{namespace}/":{
      "get":{
        "operationId":"GetListMapRoutines",
        "description":"Get List Of MapRoutines.",
        "parameters":[
          {
            "name":"namespace",
            "description":"namespace.",
            "in":"path",
            "required":true,
            "type":"string"
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfMapRoutines"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/mapshadows/{id}/{name}":{
      "get":{
        "operationId":"GetMapShadows",
        "description":"Get MapShadows.",
        "parameters":[
          {
            "name":"id",
            "description":"ID where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/MapShadows"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"MapShadows not found."
          }
        }
      },
      "put":{
        "operationId":"PutMapShadows",
        "description":"Update MapShadows.",
        "parameters":[
          {
            "name":"id",
            "description":"ID where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"MapShadows to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MapShadows"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MapShadows to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostMapShadows",
        "description":"Create MapShadows.",
        "parameters":[
          {
            "name":"id",
            "description":"ID where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"MapShadows to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MapShadows"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"MapShadows created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"MapShadows already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteMapShadows",
        "description":"Delete MapShadows.",
        "parameters":[
          {
            "name":"id",
            "description":"ID where the mapping is.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"name",
            "description":"Name of the mapping.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"MapShadows deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MapShadows not found."
          }
        }
      }
    },
    "/mapshadows/":{
      "get":{
        "operationId":"GetListMapShadows",
        "description":"Get List Of MapShadows.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfMapShadows"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/mirrormember/":{
      "get":{
        "operationId":"GetMirrorMember",
        "description":"Get MirrorMember.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/MirrorMember"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"MirrorMember not found."
          }
        }
      },
      "put":{
        "operationId":"PutMirrorMember",
        "description":"Update MirrorMember.",
        "parameters":[
          {
            "name":"model",
            "description":"MirrorMember to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/MirrorMember"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"MirrorMember to update not found."
          }
        }
      }
    },
    "/mirrors/{name}":{
      "get":{
        "operationId":"GetMirrors",
        "description":"Get Mirrors.",
        "parameters":[
          {
            "name":"name",
            "description":"Mirror names are uppercase (alphanumeric)\r\nName of the mirror, restricted to 15 uppercase alphanumeric characters. \r\nMust be unique across the mirrors managed by the EMS",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/Mirrors"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"Mirrors not found."
          }
        }
      },
      "put":{
        "operationId":"PutMirrors",
        "description":"Update Mirrors.",
        "parameters":[
          {
            "name":"name",
            "description":"Mirror names are uppercase (alphanumeric)\r\nName of the mirror, restricted to 15 uppercase alphanumeric characters. \r\nMust be unique across the mirrors managed by the EMS",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"Mirrors to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Mirrors"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Mirrors to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostMirrors",
        "description":"Create Mirrors.",
        "parameters":[
          {
            "name":"name",
            "description":"Mirror names are uppercase (alphanumeric)\r\nName of the mirror, restricted to 15 uppercase alphanumeric characters. \r\nMust be unique across the mirrors managed by the EMS",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"Mirrors to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Mirrors"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"Mirrors created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"Mirrors already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteMirrors",
        "description":"Delete Mirrors.",
        "parameters":[
          {
            "name":"name",
            "description":"Mirror names are uppercase (alphanumeric)\r\nName of the mirror, restricted to 15 uppercase alphanumeric characters. \r\nMust be unique across the mirrors managed by the EMS",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"Mirrors deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Mirrors not found."
          }
        }
      }
    },
    "/mirrors/":{
      "get":{
        "operationId":"GetListMirrors",
        "description":"Get List Of Mirrors.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfMirrors"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/miscellaneous/":{
      "get":{
        "operationId":"GetMiscellaneous",
        "description":"Get Miscellaneous.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/Miscellaneous"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"Miscellaneous not found."
          }
        }
      },
      "put":{
        "operationId":"PutMiscellaneous",
        "description":"Update Miscellaneous.",
        "parameters":[
          {
            "name":"model",
            "description":"Miscellaneous to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Miscellaneous"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Miscellaneous to update not found."
          }
        }
      }
    },
    "/monitor/":{
      "get":{
        "operationId":"GetMonitor",
        "description":"Get Monitor.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/Monitor"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"Monitor not found."
          }
        }
      },
      "put":{
        "operationId":"PutMonitor",
        "description":"Update Monitor.",
        "parameters":[
          {
            "name":"model",
            "description":"Monitor to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Monitor"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Monitor to update not found."
          }
        }
      }
    },
    "/namespaces/{name}":{
      "get":{
        "operationId":"GetNamespaces",
        "description":"Get Namespaces.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/Namespaces"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"Namespaces not found."
          }
        }
      },
      "put":{
        "operationId":"PutNamespaces",
        "description":"Update Namespaces.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"Namespaces to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Namespaces"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Namespaces to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostNamespaces",
        "description":"Create Namespaces.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"Namespaces to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Namespaces"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"Namespaces created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"Namespaces already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteNamespaces",
        "description":"Delete Namespaces.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"Namespaces deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Namespaces not found."
          }
        }
      }
    },
    "/namespaces/":{
      "get":{
        "operationId":"GetListNamespaces",
        "description":"Get List Of Namespaces.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfNamespaces"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/sql/":{
      "get":{
        "operationId":"GetSQL",
        "description":"Get SQL.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/SQL"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"SQL not found."
          }
        }
      },
      "put":{
        "operationId":"PutSQL",
        "description":"Update SQL.",
        "parameters":[
          {
            "name":"model",
            "description":"SQL to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/SQL"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"SQL to update not found."
          }
        }
      }
    },
    "/shadows/{name}":{
      "get":{
        "operationId":"GetShadows",
        "description":"Get Shadows.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/Shadows"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"Shadows not found."
          }
        }
      },
      "put":{
        "operationId":"PutShadows",
        "description":"Update Shadows.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"Shadows to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Shadows"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Shadows to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostShadows",
        "description":"Create Shadows.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"Shadows to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Shadows"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"Shadows created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"Shadows already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteShadows",
        "description":"Delete Shadows.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"Shadows deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Shadows not found."
          }
        }
      }
    },
    "/shadows/":{
      "get":{
        "operationId":"GetListShadows",
        "description":"Get List Of Shadows.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfShadows"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/sqlsysdatatypes/{name}":{
      "get":{
        "operationId":"GetSqlSysDatatypes",
        "description":"Get SqlSysDatatypes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/SqlSysDatatypes"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"SqlSysDatatypes not found."
          }
        }
      },
      "put":{
        "operationId":"PutSqlSysDatatypes",
        "description":"Update SqlSysDatatypes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"SqlSysDatatypes to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/SqlSysDatatypes"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"SqlSysDatatypes to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostSqlSysDatatypes",
        "description":"Create SqlSysDatatypes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"SqlSysDatatypes to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/SqlSysDatatypes"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"SqlSysDatatypes created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"SqlSysDatatypes already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteSqlSysDatatypes",
        "description":"Delete SqlSysDatatypes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"SqlSysDatatypes deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"SqlSysDatatypes not found."
          }
        }
      }
    },
    "/sqlsysdatatypes/":{
      "get":{
        "operationId":"GetListSqlSysDatatypes",
        "description":"Get List Of SqlSysDatatypes.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfSqlSysDatatypes"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/sqluserdatatypes/{name}":{
      "get":{
        "operationId":"GetSqlUserDatatypes",
        "description":"Get SqlUserDatatypes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/SqlUserDatatypes"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"SqlUserDatatypes not found."
          }
        }
      },
      "put":{
        "operationId":"PutSqlUserDatatypes",
        "description":"Update SqlUserDatatypes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"SqlUserDatatypes to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/SqlUserDatatypes"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"SqlUserDatatypes to update not found."
          }
        }
      },
      "post":{
        "operationId":"PostSqlUserDatatypes",
        "description":"Create SqlUserDatatypes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          },
          {
            "name":"model",
            "description":"SqlUserDatatypes to create.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/SqlUserDatatypes"
            }
          }
        ],
        "responses":{
          "201":{
            "description":"SqlUserDatatypes created.",
            "headers":{
              "Location":{
                "type":"string",
                "description":"Created ressource location."
              }
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "409":{
            "description":"SqlUserDatatypes already exists."
          }
        }
      },
      "delete":{
        "operationId":"DeleteSqlUserDatatypes",
        "description":"Delete SqlUserDatatypes.",
        "parameters":[
          {
            "name":"name",
            "description":"Name of the object instance.<br>",
            "in":"path",
            "type":"string",
            "required":true
          }
        ],
        "responses":{
          "204":{
            "description":"SqlUserDatatypes deleted."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"SqlUserDatatypes not found."
          }
        }
      }
    },
    "/sqluserdatatypes/":{
      "get":{
        "operationId":"GetListSqlUserDatatypes",
        "description":"Get List Of SqlUserDatatypes.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/ListOfSqlUserDatatypes"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          }
        }
      }
    },
    "/startup/":{
      "get":{
        "operationId":"GetStartup",
        "description":"Get Startup.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/Startup"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"Startup not found."
          }
        }
      },
      "put":{
        "operationId":"PutStartup",
        "description":"Update Startup.",
        "parameters":[
          {
            "name":"model",
            "description":"Startup to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Startup"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Startup to update not found."
          }
        }
      }
    },
    "/telnet/":{
      "get":{
        "operationId":"GetTelnet",
        "description":"Get Telnet.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/Telnet"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"Telnet not found."
          }
        }
      },
      "put":{
        "operationId":"PutTelnet",
        "description":"Update Telnet.",
        "parameters":[
          {
            "name":"model",
            "description":"Telnet to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Telnet"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"Telnet to update not found."
          }
        }
      }
    },
    "/config/":{
      "get":{
        "operationId":"Getconfig",
        "description":"Get config.",
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"OK",
            "schema":{
              "$ref":"#/definitions/config"
            }
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty."
          },
          "404":{
            "description":"config not found."
          }
        }
      },
      "put":{
        "operationId":"Putconfig",
        "description":"Update config.",
        "parameters":[
          {
            "name":"model",
            "description":"config to update.",
            "in":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/config"
            }
          }
        ],
        "responses":{
          "204":{
            "description":"Ressource updated."
          },
          "400":{
            "description":"Bad request, can occurs if mandatory parameters are missing or empty"
          },
          "404":{
            "description":"config to update not found."
          }
        }
      }
    }
  },
  "definitions":{
    "Cluster":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "CommIPAddress":{
          "type":"string",
          "default":"",
          "description":"Defines the IP Address to advertise in the PIJ to the other cluster members.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "JoinCluster":{
          "type":"boolean",
          "default":0,
          "description":"Set to True if this configuration is part of a cluster.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "ConfigFile":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "Product":{
          "type":"string",
          "default":"IRIS",
          "description":""
        },
        "Version":{
          "type":"string",
          "default":"",
          "description":"Version of the CPF file.<br>"
        }
      },
      "required":[
        "Name",
        "Version"
      ],
      "example":{
        "Name":"",
        "Version":""
      }
    },
    "Databases":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "ClusterMountMode":{
          "type":"boolean",
          "default":0,
          "description":" Specifies whether the database should be mounted privately or clustered.<br>\r\n 0 - Mount private<br>\r\n 1 - Mount clustered<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Directory":{
          "type":"string",
          "default":"",
          "description":" Directory where the database resides.<br><br>\r\n On ECP Clients of a mirror this contains logical references to the databases on the\r\n failover miror memebers as the path may be different on the various nodes. <br>\r\n This has two forms:<br>\r\n &nbsp&nbsp&nbsp&nbsp&nbsp:mirror:&ltmirror name&gt:&ltmirror database name&gt <br>\r\n &nbsp&nbsp&nbsp&nbsp&nbsp:ds:&ltconfig database name&gt <br>\r\n <br>\r\n The 1st form, :mirror:&ltmirror name&gt:&ltmirror database name&gt, refers to a mirrored database. The mirror\r\n database name is the internal mirror name assigned to the database when it was added to\r\n the mirror. This is generally the same as the database name in the configuration.\r\n <br><br>\r\n The 2nd form, :ds:&ltconfig database name&gt, refers to a non-mirrored database on the server.\r\n The config database name is the name of the database in the configuration and this database name\r\n is expected to exist on all of the failover members. This form is only used in special circumstances\r\n as normally non-mirrored databases are hosted on the ECP Client, not the ECP Server. This is used\r\n in cases where scratch data (eg. the data will be lost during a mirror failover) needs to be hosted\r\n on the server for some reason."
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "MountAtStartup":{
          "type":"boolean",
          "default":0,
          "description":" On a clustered system, specifies whether the database should be mounted at startup.<br>\r\n This property is valid for cluster systems only, and is ignored \r\n for non-cluster systems.<br>\r\n 0 - Don't mount at startup<br>\r\n 1 - Mount at startup<br>"
        },
        "MountRequired":{
          "type":"boolean",
          "default":0,
          "description":" Specifies that the database MUST be successfully mounted at startup.<br>\r\n 0 - Successful mount not required for startup to succeed.<br>\r\n 1 - Successful mount required for startup to succeed.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "Server":{
          "type":"string",
          "default":"",
          "description":" Name of the remote server where the DB resides.<br>\r\n If empty, the database is local.<br>\r\n Remote server must already be configured to be entered here.<br>"
        },
        "StreamLocation":{
          "type":"string",
          "default":"",
          "description":" Directory where the streams associated with this database go.<br>\r\n By default (value=\"\"), the location is in the subdirectory \"stream\", underneath the\r\n database directory, e.g. for a database located in c:\\abc, the default would be\r\n c:\\abc\\stream. InterSystems recommends leaving this parameter as \"\".<br>"
        }
      },
      "required":[
        "Directory",
        "Name"
      ],
      "example":{
        "Directory":"",
        "Name":""
      }
    },
    "ListOfDatabases":{
      "type":"object",
      "properties":{
        "Databases":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/Databases"
          }
        }
      }
    },
    "Debug":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "ListOfDebug":{
      "type":"object",
      "properties":{
        "Debug":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/Debug"
          }
        }
      }
    },
    "DeviceSubTypes":{
      "type":"object",
      "properties":{
        "Backspace":{
          "type":"string",
          "default":"",
          "description":"Enter the ASCII code that represents the backspace character on the selected<br>\r\ndevice in this form: $C(code1). Default depends on the device type.<br>"
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "CursorControl":{
          "type":"string",
          "default":"",
          "description":"Enter the cursor control keys for the selected device.<br>\r\nDefault depends on the device type.<br>"
        },
        "EraseEOF":{
          "type":"string",
          "default":"",
          "description":"Enter the ASCII code that represents erasing to the end of file on the<br>\r\nselected device in this form: $C(code1,code2...).<br>\r\nDefault depends on the device type.<br>"
        },
        "EraseEOL":{
          "type":"string",
          "default":"",
          "description":"Enter the ASCII code that represents erasing to the end of line on this device<br>\r\nin the form $C(code1,code2).<br>\r\nDefault depends on the device type.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "FormFeed":{
          "type":"string",
          "default":"",
          "description":"Enter the ASCII code that represents a form feed on the selected device in this form:<br>\r\n#,$C(code1,code2...).<br>\r\nDefault depends on the device type.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "RightMargin":{
          "type":"integer",
          "default":80,
          "description":"Enter the number that represents the location of the right margin.<br>\r\nDevice output will wrap at that number of characters.<br>\r\nDefault depends on the device type.<br>"
        },
        "ScreenLength":{
          "type":"integer",
          "default":0,
          "description":"Enter the number of lines that comprise one screen or page for the device.<br>"
        },
        "ZU22Backspace":{
          "type":"string",
          "default":"",
          "description":"Enter the ASCII code that represents a backspace on the selected device in the form $C(code).<br>\r\nDefault depends on the device type.<br>"
        },
        "ZU22FormFeed":{
          "type":"string",
          "default":"",
          "description":"Enter the ASCII code that represents a form feed on the selected device in the form $C(code1,code2).<br>\r\nDefault depends on the device type.<br>"
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "ListOfDeviceSubTypes":{
      "type":"object",
      "properties":{
        "DeviceSubTypes":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/DeviceSubTypes"
          }
        }
      }
    },
    "Devices":{
      "type":"object",
      "properties":{
        "Alias":{
          "type":"integer",
          "default":"",
          "description":"Alternate device ID (number) for this device. <br>\r\nAll aliases must be unique. You can use this value to specify a device in an OPEN command, e.g 0PEN 210<br>"
        },
        "AlternateDevice":{
          "type":"string",
          "default":"",
          "description":"Device ID of an alternate device.<br>\r\nThis allows a user using %IS to specify A as the device.\r\nThe alternate device must be a defined mnemonic.<br>"
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Description":{
          "type":"string",
          "default":"",
          "description":"Enter a description of where the device is located. This field is for your<br>\r\nown reference to help you identify what machine you're configuring.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "OpenParameters":{
          "type":"string",
          "default":"",
          "description":"Values that will be sent as the second argument for an OPEN command.<br>\r\nThis value allows you to specify more specific terminal information.<br>"
        },
        "PhysicalDevice":{
          "type":"string",
          "default":"",
          "description":"Physical device name used to refer to the device.<br>"
        },
        "Prompt":{
          "type":"integer",
          "default":"",
          "description":"Number of the prompt option desired.<br>\r\nOptions:<br>\r\nNULL (blank) = user sees the device selection prompt with the default device defined<br>\r\n1 = automatically uses this device, if it is the current device<br>\r\n2 = automatically uses this device with predefined Right Margin and Parameter settings.<br>"
        },
        "SubType":{
          "type":"string",
          "default":"",
          "description":"Options to refine the definition of your device SubTypes.<br>\r\nSubTypes specify terminal charactistics. They are used to create the appropriate\r\nOPEN command for the device. There should be SubType information for every terminal type.<br>"
        },
        "Type":{
          "type":"string",
          "default":"",
          "description":"Enter the type of device.<br>\r\nOptions:<br>\r\nTRM = Terminal<br>\r\nSPL = Spooling device<br>\r\nMT = Magnetic Tape drive<br>\r\nBT = Cartridge tape drive<br>\r\nIPC = Interprocess communication<br>\r\nOTH = any other device including printers and sequential files.<br>\r\nDefault depends on the device type.<br>"
        }
      },
      "required":[
        "Name",
        "PhysicalDevice",
        "SubType",
        "Type"
      ],
      "example":{
        "Name":"",
        "PhysicalDevice":"",
        "SubType":"",
        "Type":""
      }
    },
    "ListOfDevices":{
      "type":"object",
      "properties":{
        "Devices":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/Devices"
          }
        }
      }
    },
    "ECP":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "ClientReconnectDuration":{
          "type":"integer",
          "default":1200,
          "description":"How long a client should keep trying to re-establish a connection before giving up\r\nor declaring connection failed (in seconds).<br>"
        },
        "ClientReconnectInterval":{
          "type":"integer",
          "default":5,
          "description":"When a server is not available, how long to wait between each reconnection attempt (in seconds).<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "ServerTroubleDuration":{
          "type":"integer",
          "default":60,
          "description":"Duration a connection will stay in troubled state (in seconds).\r\nOnce this period of time has elapsed, the server will declare the connection dead and\r\npresume recovery is not possible.<br>"
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "ECPServers":{
      "type":"object",
      "properties":{
        "Address":{
          "type":"string",
          "default":"",
          "description":"IP Address to connect to.<br>"
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "MirrorConnection":{
          "type":"integer",
          "default":0,
          "description":"Specifies the behavior of this connection with regard to mirrored database servers.\r\n<p>\r\nValue:\r\n<li>0: Non-mirrored connection.  Access databases on non-mirror members.  Also\r\nused to connect to async members to access mirror databases, configured by\r\ntheir database paths.\r\n<li>1: Mirrored connection. ECP will automatically find the primary mirror\r\nmember and will only connect to the primary. Access to mirrored databases \r\nis configured by mirror database name.</li>\r\n<li>-1: Mirrored connection restricted to the configured mirror member only. The\r\nconfigured member is the one specified by <PROPERTY>Address</PROPERTY> and\r\n<PROPERTY>Port</PROPERTY>. Like value '1', a connection will be established \r\nif the configured member is primary and access to mirrored databases is\r\nconfigured by mirror database name. Unlike '1', if the configured member is\r\na Disaster Recovery member, the connection will be established, allowing\r\nread-only access to mirrored databases. If the DR member is promoted, the \r\nconnection will be dropped and will be re-established when it becomes primary. \r\n<b>Warning</b>: This setting is not appropriate in typical configurations where\r\n mirroring will automatically fail over, as the new primary won't be found.\r\nThis is for use in specialized DR configurations, or other long-distance\r\nconfigurations, to prevent the application server from being automatically \r\nredirected to a primary in a different data center while allowing local \r\nread-only access. There is no system utility to set the value of '-1', but it\r\ncan be specified via this class interface.</li>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "Port":{
          "type":"integer",
          "default":1972,
          "description":"IP Port to connect to.<br>"
        },
        "SSLConfig":{
          "type":"integer",
          "default":0,
          "description":"Use SSL configuration (%ECPClient) for the ECP connection.<br>"
        }
      },
      "required":[
        "Address",
        "Name"
      ],
      "example":{
        "Address":"",
        "Name":""
      }
    },
    "ListOfECPServers":{
      "type":"object",
      "properties":{
        "ECPServers":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/ECPServers"
          }
        }
      }
    },
    "IO":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "File":{
          "type":"string",
          "default":"^%X364",
          "description":"Routine to use in WRITE commands for sequential files.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "MagTape":{
          "type":"string",
          "default":"^%XMAG",
          "description":"Routine to use in WRITE commands for magnetic tapes.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "Other":{
          "type":"string",
          "default":"^%X364",
          "description":"Routine to use in WRITE commands for Other devices.<br>"
        },
        "Terminal":{
          "type":"string",
          "default":"^%X364",
          "description":"Routine to use in WRITE commands for terminals.<br>"
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "Journal":{
      "type":"object",
      "properties":{
        "AlternateDirectory":{
          "type":"string",
          "default":"",
          "description":"Alternate journal directory.<br>"
        },
        "BackupsBeforePurge":{
          "type":"integer",
          "default":2,
          "description":"Number of backups before the journal files are automatically purged.<br>"
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "CurrentDirectory":{
          "type":"string",
          "default":"",
          "description":"Primary journal directory.<br>"
        },
        "DaysBeforePurge":{
          "type":"integer",
          "default":2,
          "description":"Number of days before the journal files are purged.<br>"
        },
        "FileSizeLimit":{
          "type":"integer",
          "default":1024,
          "description":"Maximum size of each journal file in MB.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "FreezeOnError":{
          "type":"boolean",
          "default":0,
          "description":"Freeze the system if there is an error writing to the journal.<br>\r\nIf this option is set to true (1), as soon as the error occurs all global activities \r\nthat are normally journaled are blocked, which causes other jobs to block. \r\nThe typical outcome is that the system goes into a hang state until the journaling problem is \r\nresolved, and then resumes running. While InterSystems IRIS is hanging, the administrator can take \r\ncorrective measures, such as freeing up space on a disk that is full, switching the journal \r\nto a new disk, etc. This option has the advantage that once the problem is fixed and \r\nInterSystems IRIS resumes running, no journal information has been lost. \r\nIt has the disadvantage that the system is less available while the problem is being solved.<br>\r\nIf this option is set to false (0), when a journaling error occurs journaling is \r\nentirely disabled, while the system continues running as normal. \r\nThe system sends a console message to alert the administrator, who can fix the problem and then\r\nrun ^JRNSWTCH at the console to restart journaling. "
        },
        "JournalFilePrefix":{
          "type":"string",
          "default":"",
          "description":"Prefixes journal file names with this string.<br>\r\nMay be used to distinguish journal files from different instances in the same directory.<br>"
        },
        "JournalcspSession":{
          "type":"boolean",
          "default":0,
          "description":"%cspSession global will be mapped to the TEMP database and not journaled.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "LicenseServers":{
      "type":"object",
      "properties":{
        "Address":{
          "type":"string",
          "default":"127.0.0.1",
          "description":"IP Address of the license server.<br>"
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "KeyDirectory":{
          "type":"string",
          "default":"",
          "description":"Directory used to load license keys for distribution. At startup of a local\r\nLicense Server, the system will attempt to load license keys from all *.key files\r\nin this directory. These keys can then be requested by other Instances using this\r\nLicense Server."
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "Port":{
          "type":"integer",
          "default":4002,
          "description":"IP Port of the license server.<br>"
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "ListOfLicenseServers":{
      "type":"object",
      "properties":{
        "LicenseServers":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/LicenseServers"
          }
        }
      }
    },
    "MagTapes":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "SystemDevice":{
          "type":"string",
          "default":"",
          "description":"Physical tape device name.<br>"
        }
      },
      "required":[
        "Name",
        "SystemDevice"
      ],
      "example":{
        "Name":"",
        "SystemDevice":""
      }
    },
    "ListOfMagTapes":{
      "type":"object",
      "properties":{
        "MagTapes":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/MagTapes"
          }
        }
      }
    },
    "MapGlobals":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Collation":{
          "type":"integer",
          "default":5,
          "description":"Default collation of the global"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Database":{
          "type":"string",
          "default":"",
          "description":"Database to map global to.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<var>Bit $$$CPFSave</var> - Save object to disk.<br>\r\n<var>Bit $$$CPFWrite</var> - Write CPF file from object.<br>\r\n<var>Bit $$$CPFActivate</var> - Activate object into memory if CPFFile is the same as what is currently active.<br>"
        },
        "LockDatabase":{
          "type":"string",
          "default":"",
          "description":"Database to map global lock to.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the mapping.<br>"
        },
        "Namespace":{
          "type":"string",
          "default":"",
          "description":"Namespace where the mapping is.<br>"
        }
      },
      "required":[
        "Database",
        "Name",
        "Namespace"
      ],
      "example":{
        "Database":"",
        "Name":"",
        "Namespace":""
      }
    },
    "ListOfMapGlobals":{
      "type":"object",
      "properties":{
        "MapGlobals":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/MapGlobals"
          }
        }
      }
    },
    "MapMirrors":{
      "type":"object",
      "properties":{
        "AgentAddress":{
          "type":"string",
          "default":"",
          "description":"Network address (IP address preferred to avoid DNS issues)\r\nmirror members which connect to the primary should use to \r\ncontact the Agent on this failover member. This is omitted\r\nreporting members as the agent is not used for mirroring\r\non those systems. This is required on failover members. This\r\nfield does not need to be specified on DR members although it will\r\nneed to be filled in before promotion of the DR to a Failover member. \r\nIt is best to configure the agent and the address information earlier \r\nrather than later.\r\n<br><br>\r\nThe agent can transfer journal data so a private address may\r\nbe desirable here to avoid network congestion. "
        },
        "AgentPort":{
          "type":"integer",
          "default":"",
          "description":"Port # which the agent on this system is configured to listen\r\non. <classmethod>##class(SYS.Agent).GetApplicationPort()</classmethod>\r\nwill return the current value if the local agent is active."
        },
        "AsyncMemberType":{
          "type":"integer",
          "default":0,
          "description":"AsyncMemberType indicates the async member is a disaster recovery (DR), read-only reporting or read-write reporting async member.<br>\r\n0 - Disaster Recovery (DR). This is a disaster recovery async member, all its mirrored databases are read-only mirrored databases.<br>\r\n1 - Read-Only Reporting. This is a reporting async member, all its mirrored databases could be read-only or read-write databases, the default is read-only when the database is\r\ncreated.<br>\r\n2 - Read-Write Reporting. This is a reporting async member, all its mirrored databases could be read-only or read-write databases, the default is read-write when the database is\r\ncreated.<br>"
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "ConnectsTo":{
          "type":"string",
          "default":"",
          "description":"Reserved for future use."
        },
        "DejournalFilter":{
          "type":"string",
          "default":"",
          "description":"The name of the filter class for mirror dejournaling, null string means the dejournal filter is disabled. <br> \r\nThis property is meaningful only for Reporting Async members. "
        },
        "ECPAddress":{
          "type":"string",
          "default":"",
          "description":"This is the superserver address referenced in the documentation for this \r\ninstance. External mirror-aware systems can connect to the primary using \r\nthis address. Currently the only such external systems are ECP application \r\nservers connecting to failover members. This is distributed to\r\nthe ECP clients, along with the address for the other failover member\r\n(if there is one) when an ECP client builds a connection to a mirror. \r\n<br><br>\r\nOther mirror members may also make connections to a member's superserver \r\naddress for certain control and monitoring purposes. When a member is primary, \r\nasync members attempt to establish their data channel to the member using this \r\naddress if the mirror private address is not accessible, which means that \r\njournal data may travel over the network via this address.\r\n<br><br>\r\nThis a required field on failover members, optional on others."
        },
        "EncryptCommunication":{
          "type":"integer",
          "default":0,
          "description":"When SSL is not required by <Property>Config.Mirrors.UseSSL</Property> mirror wide\r\nsetting, this property controls whether this member uses SSL for its outgoing\r\nconnections and/or whether it requires SSL for its incoming connections. Whenever SSL is\r\nused to encrypt a connection, the endpoints also perform authorization and verify that the\r\nDN name in the SSL configuration matches the listed <property>SSLComputerName</property>\r\nfor that system in the Mirror configuration.\r\n<br><br>\r\nValues are:\r\n<ul>\r\n <li><p>0 - Encryption is not required. Outgoing connections may still be\r\n            encrypted if the member we connect to requires SSL for incoming\r\n            connections.\r\n\t\t\t</p></li>\r\n <li><p>1 - SSL is used to encrypt outgoing connections.\r\n            the server must have an SSL Mirror configuration or the\r\n            connection will fail\r\n            </p></li>\r\n <li><p>2 - Encryption is required for incoming connections. The clients\r\n            which connect must have an SSL Mirror configuration or the\r\n            connection will fail\r\n            </p></li>\r\n <li><p>3 - Both 1+2: Outgoing connections are encrypted, encryption is\r\n            required for incoming connections\r\n            </p></li>\r\n</ol>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<var>Bit $$$CPFSave</var> - Save object to disk.<br>\r\n<var>Bit $$$CPFWrite</var> - Write CPF file from object.<br>\r\n<var>Bit $$$CPFActivate</var> - Activate object into memory if CPFFile is the same as what is currently active.<br>"
        },
        "GUID":{
          "type":"string",
          "default":"",
          "description":"Uniquely identifies this node in the mirror. Apart from identifying\r\nthe nodes, primary used to identify the instance that owns a particular \r\ncopy of a mirrored database."
        },
        "ID":{
          "type":"string",
          "default":"",
          "description":"ID where the mapping is.<br>"
        },
        "InstanceDirectory":{
          "type":"string",
          "default":"",
          "description":"The installation directory of the instance (the parent of the mgr directory).\r\nUsed primarily on failover members to identify the instance to the agent"
        },
        "MemberType":{
          "type":"integer",
          "default":0,
          "description":"Numeric value indicating the type of mirror member.\r\n<br><br>\r\n0 - Failover member<br>\r\n1 - &ltreserved for future use&gt<br>\r\n2 - Async member (doesn't accept client connections)<br>\r\n(defined in %syMirror.inc as FailoverMemberType, AsyncMemberType)"
        },
        "MirrorAddress":{
          "type":"string",
          "default":"",
          "description":"Address (IP preferred to avoid DNS troubles) the other mirror members\r\nshould use to contact the superserver on this instance. \r\nWhen a InterSystems IRIS instance is running as the primary failover member, \r\neach of the other mirror members uses the mirror private address to \r\nestablish its mirror data channel, the channel over which it receives \r\njournal data from the primary and the most heavily used mirror \r\ncommunication channel. \r\n<br><br>\r\nFailover members are restricted in that they can only use this address\r\nfor establishing the connection to receive live updates. Async members\r\nattempt to use this address to connect to the primary but fall back to\r\nthe superserver address (<property>ECPAddress</property> property) if necessary.\r\n<br><br>\r\nThis documentation refers to ths property as the Mirror Private Address."
        },
        "MirrorSSPort":{
          "type":"integer",
          "default":"",
          "description":"SuperServer port for this instance. Used in conjunction with both the\r\n<property>MirrorAddress</property> and the <property>ECPAddress</property>\r\nby clients establishing connections to this instance."
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"This is the name of this instance in the mirror. Mirror system names\r\nmust be unique (enforced by Enterprise Manager) across all of the mirrors which \r\nthe EM manages, as an instance has a single mirror system name which \r\nmay appear in multiple mirror sets (eg. a reporting member may connect\r\nto multiple mirrors). For the most part the <property>GUID </property>\r\nis used to identify a mirror member, the Name is used for display \r\npurposes. \r\n<br><br>\r\nThe name must not contain a colon (':') and is converted to uppercase before\r\nsaving."
        },
        "SSLComputerName":{
          "type":"string",
          "default":"",
          "description":"Value of the DN field in the SSL certificate which is part of\r\nthe %Mirror SSL configuration on this instance. When SSL is enabled\r\nan instance sends this value as part of establishing a TCP connection. Both\r\nsides of the connection verify that the other side's DN value matches a value\r\nstored in the configuration. It is best for every mirror member to have a unique\r\nDN value as otherwise it may be possible for a system that was removed from the\r\nmirror to still connect if it's DN value matches the DN stored with another system\r\nof the same type (eg. async v. failover). "
        }
      },
      "required":[
        "GUID",
        "ID",
        "InstanceDirectory",
        "MirrorAddress",
        "MirrorSSPort",
        "Name"
      ],
      "example":{
        "GUID":"",
        "ID":"",
        "InstanceDirectory":"",
        "MirrorAddress":"",
        "MirrorSSPort":0,
        "Name":""
      }
    },
    "ListOfMapMirrors":{
      "type":"object",
      "properties":{
        "MapMirrors":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/MapMirrors"
          }
        }
      }
    },
    "MapPackages":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Database":{
          "type":"string",
          "default":"",
          "description":"Database to map Package to.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<var>Bit $$$CPFSave</var> - Save object to disk.<br>\r\n<var>Bit $$$CPFWrite</var> - Write CPF file from object.<br>\r\n<var>Bit $$$CPFActivate</var> - Activate object into memory if CPFFile is the same as what is currently active.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the mapping.<br>"
        },
        "Namespace":{
          "type":"string",
          "default":"",
          "description":"Namespace where the mapping is.<br>"
        }
      },
      "required":[
        "Database",
        "Name",
        "Namespace"
      ],
      "example":{
        "Database":"",
        "Name":"",
        "Namespace":""
      }
    },
    "ListOfMapPackages":{
      "type":"object",
      "properties":{
        "MapPackages":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/MapPackages"
          }
        }
      }
    },
    "MapRoutines":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Database":{
          "type":"string",
          "default":"",
          "description":"Database to map routine to.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<var>Bit $$$CPFSave</var> - Save object to disk.<br>\r\n<var>Bit $$$CPFWrite</var> - Write CPF file from object.<br>\r\n<var>Bit $$$CPFActivate</var> - Activate object into memory if CPFFile is the same as what is currently active.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the mapping.<br>"
        },
        "Namespace":{
          "type":"string",
          "default":"",
          "description":"Namespace where the mapping is.<br>"
        }
      },
      "required":[
        "Database",
        "Name",
        "Namespace"
      ],
      "example":{
        "Database":"",
        "Name":"",
        "Namespace":""
      }
    },
    "ListOfMapRoutines":{
      "type":"object",
      "properties":{
        "MapRoutines":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/MapRoutines"
          }
        }
      }
    },
    "MapShadows":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Directory":{
          "type":"string",
          "default":"",
          "description":"Database to map global to.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<var>Bit $$$CPFSave</var> - Save object to disk.<br>\r\n<var>Bit $$$CPFWrite</var> - Write CPF file from object.<br>\r\n<var>Bit $$$CPFActivate</var> - Activate object into memory if CPFFile is the same as what is currently active.<br>"
        },
        "ID":{
          "type":"string",
          "default":"",
          "description":"ID where the mapping is.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the mapping.<br>"
        }
      },
      "required":[
        "Directory",
        "ID",
        "Name"
      ],
      "example":{
        "Directory":"",
        "ID":"",
        "Name":""
      }
    },
    "ListOfMapShadows":{
      "type":"object",
      "properties":{
        "MapShadows":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/MapShadows"
          }
        }
      }
    },
    "MirrorMember":{
      "type":"object",
      "properties":{
        "AgentAddress":{
          "type":"string",
          "default":"",
          "description":""
        },
        "AsyncMemberGUID":{
          "type":"string",
          "default":"",
          "description":""
        },
        "AsyncMemberType":{
          "type":"integer",
          "default":0,
          "description":"AsyncMemberType indicates the async member is a disaster recovery (DR), read-only reporting or read-write reporting async member.<br>\r\n0 - Disaster Recovery (DR). This is a disaster recovery async member, all its mirrored databases are read-only mirrored databases.<br>\r\n1 - Read-Only Reporting. This is a reporting async member, all its mirrored databases could be read-only or read-write databases, the default is read-only when the database is\r\ncreated.<br>\r\n2 - Read-Write Reporting. This is a reporting async member, all its mirrored databases could be read-only or read-write databases, the default is read-write when the database is\r\ncreated.<br>"
        },
        "AsyncUseSystemPurgeInterval":{
          "type":"boolean",
          "default":0,
          "description":"AsyncUseSystemPurgeInterval when set indicates that the async member should\r\npurge mirror journal files according to the same criteria it uses for purging\r\nlocal journal files (eg. after a certain number of days or a certain number\r\nof backups). When this parameter is missing, or clear, the default state, mirror\r\njournal files are purged as soon as they are no longer needed because they\r\nhave been replayed to the local databases and/or sent on to the various clients\r\nthat connect (if this is a relay member)."
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "JoinMirror":{
          "type":"boolean",
          "default":0,
          "description":"Flag indicating whether this system processes its mirror configuration\r\nat startup. When set to NO, the mirror configuration is ignored and the\r\nsystem is not considered a mirror member. This can be used if there is a \r\nproblem in the configuration which prevents the system from starting or\r\nas part of removing a system from the mirror as if a system is the primary\r\nit needs to be restarted but we also need to block the system from joining\r\nthe mirror when it restarts and becoming the primary again."
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "SystemName":{
          "type":"string",
          "default":"",
          "description":"This is the name by which the system is known in the mirror (the mirror \r\nmember name). The name is converted to uppercase before storing. \r\nThe following characters are not permitted in mirror system names:\r\n<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: # , ; = ^ ~ \" &ltspace&gt &lttab&gt \r\n<br>\r\nThe following character sequences are not allowed in mirror system names:\r\n<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;/*  \r\n<br>\r\n\r\nMirror system names must be unique across all\r\nmirror members as some mirror members (eg. relay and async members) may\r\nparticipate in multiple mirrors and they will have the same system name\r\nin all of the mirrors."
        },
        "VirtualAddressInterface":{
          "type":"string",
          "default":"",
          "description":"When the mirror is configured to keep a virtual ip address assigned\r\nto the primary, this is the local interface which hosts the IP address.<br><br>\r\nConsult the documentation for the format specific to the operating system.<br><br>"
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "Mirrors":{
      "type":"object",
      "properties":{
        "AllowParallelDejournaling":{
          "type":"integer",
          "default":0,
          "description":"Determines the type of mirror members can run parallel dejournaling updaters.\r\n<br>\r\n0 - Failover and Disaster Recover members.<br>\r\n1 - Failover members only.<br>\r\n2 - All members including Failover, Disaster Recovery and Reporting Async members.<br>\r\n<br>"
        },
        "ArbiterNode":{
          "type":"string",
          "default":"",
          "description":"An address for the arbiter node used by this mirror.<br>\r\nThe arbiter node is used by the failover members as an observer to provide\r\ninformation to an active backup that allows it to take over when the agent\r\non the primary cannot be contacted (eg. the primary loses power).<br><br>"
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "CompressionForAsyncMembers":{
          "type":"integer",
          "default":0,
          "description":"Determines whether journal data is compressed before being transmitted to async members (disaster recovery and reporting).\r\n<br>\r\n0 - System Selected: The system will use a compression strategy expected to balance network utilization with performance.<br>\r\n1 - Uncompressed: No compression will be used.<br>\r\n2 - Compressed: Compression will be used.<br>\r\n<br>"
        },
        "CompressionForFailoverMembers":{
          "type":"integer",
          "default":0,
          "description":"Determines whether journal data is compressed before being transmitted between failover members.\r\n<br>\r\n0 - System Selected: The system will use compression only in configurations where it is expected to improve the response time for synchronization between the primary and backup.<br>\r\n1 - Uncompressed: No compression will be used.<br>\r\n2 - Compressed: Compression will be used.<br>\r\n<br>"
        },
        "CompressionTypeForAsyncMembers":{
          "type":"integer",
          "default":0,
          "description":"Compress type when CompressionForAsyncMembers is set to 'Compressed' mode. It is meanlinless if CompressionForAsyncMembers is not 'Compressed' mode.\r\n<br>\r\n0 - ZLIB.<br>\r\n1 - ZSTD.<br>\r\n2 - LZ4.<br>\r\n<br>"
        },
        "CompressionTypeForFailoverMembers":{
          "type":"integer",
          "default":0,
          "description":"Compress type when CompressionForFailoverMembers is set to 'Compressed' mode. It is meanlinless if CompressionForFailoverMembers is not 'Compressed' mode.\r\n<br>\r\n0 - ZLIB.<br>\r\n1 - ZSTD.<br>\r\n2 - LZ4.<br>\r\n<br>"
        },
        "DefinedPrimary":{
          "type":"string",
          "default":"",
          "description":"Field used internally when mirror failover is disabled, \r\ngenerally for maintenance purposes. Manipulated via the nofailover options\r\nwhen shutting down InterSystems IRIS. This contains the mirror system name of the node\r\nwhich is allowed to become the primary. It is cleared automatically when that\r\nnode starts up and becomes the primary (eg. starting it NOSTU will not clear\r\nthis field). This can also be set and cleared manually via ^MIRROR."
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "GUID":{
          "type":"string",
          "default":"",
          "description":"Internal GUID which is unique to this mirror"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Mirror names are uppercase (alphanumeric)\r\nName of the mirror, restricted to 15 uppercase alphanumeric characters. \r\nMust be unique across the mirrors managed by the EMS"
        },
        "QOSTimeout":{
          "type":"integer",
          "default":8000,
          "description":"Contains the time in milliseconds which the primary will wait for the backup\r\nto acknowledge receipt of a chunk of journal data before the primary\r\nmarks the backup as inactive."
        },
        "UseSSL":{
          "type":"boolean",
          "default":0,
          "description":"Yes/No field for whether the mirror uses to encrypt the communication \r\nbetween members for every mirror connection. \r\nWhen set to Yes the Mirror SSL configuration is used for client/server connections by this\r\nnode. When set to No, encryption setting are controlled on a per-connection basis via\r\n<property>Config.MapMirrors.EncryptCommunication</property> and by\r\n<property>Config.MapMirrors.RequireEncryption MapMirrors</property>.\r\n<br><br>\r\nSetting this field to Yes forces <property>RequireAuthentication</property> to be set to \r\nYes and <property>RequireAuthentication</property> cannot be set to No while this field is\r\nenabled.\r\n<br><br>\r\nThis must be enabled when journal files are encrypted on the \r\nfailover mirror members or when there are any encrypted mirrored databases."
        },
        "VirtualAddress":{
          "type":"string",
          "default":"",
          "description":"Optional Virtual IP address which the mirror maintains pointing to the\r\ncurrent primary. When this is specified the failover members must be\r\nconfigured to host the Virtual IP on one of their interfaces. This is used\r\nby TCP/IP Client applications to connect to the primary mirror member."
        }
      },
      "required":[
        "GUID",
        "Name"
      ],
      "example":{
        "GUID":"",
        "Name":""
      }
    },
    "ListOfMirrors":{
      "type":"object",
      "properties":{
        "Mirrors":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/Mirrors"
          }
        }
      }
    },
    "Miscellaneous":{
      "type":"object",
      "properties":{
        "AsyncDisconnectErr":{
          "type":"boolean",
          "default":0,
          "description":"This setting modifies the behavior of InterSystems IRIS when DisconnectErr is enabled.<br>\r\n0 - The process receives a <DSCON> error at the next read or write command.<br>\r\n1 - The process receives an asynchronous <DSCON> error at the time a disconnect occurs on the device. This error will occur at the next command executed. Hang commands will be interrupted. <br>\r\nAsyncDisconnectError is only applicable to Telnet connections on Windows. It has no effect on any other device type or operating system. If DisconnectErr is set to 0 (false), then AsyncDisconnectError has no effect. "
        },
        "AsynchError":{
          "type":"boolean",
          "default":1,
          "description":"Enable processes to receive asynchronous errors.<br>\r\n0 - Processes cannot receive asynchronous errors.<br>\r\n1 - Processes can receive asynchronous errors.<br>\r\nThis setting applies to ECP networking. "
        },
        "BreakMode":{
          "type":"boolean",
          "default":1,
          "description":"Process action when debug BREAK command executed.<br>\r\n0 - Breaks are ignored.<br>\r\n1 - Breaks are taken.<br>"
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "CollectResourceStats":{
          "type":"boolean",
          "default":0,
          "description":"Controls whether the system resource statistics are updated or not (seize, nseize, \r\naseize, bseize).<br>\r\n0 - Statistics are not collected<br>\r\n1 - Statistics are collected.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "DX":{
          "type":"boolean",
          "default":0,
          "description":"Sets $X update mode for escape sequences system-wide.<br>\r\nYou can control the way the system updates $X when writing a string containing an escape sequence. \r\nDefault behaviors for various system implementations are as follows: <br>\r\nUNIX - parses the ANSI standard escape sequence and counts the rest of the non-escape \r\ncharacters in the string against $X. <br>\r\nVMS - Do not count any more characters in the string against $X as soon as they encounter an \r\nescape character ($CHAR(27)). <br>\r\nOpen M [DSM] - Counts all characters in a string, including the escape character, against $X.<br>\r\nOpen M [DTM] and Open M [MSM] - Count all characters except for the escape character against $X.<br>\r\nA numeric code that controls a nondefault, consistent, system-wide way of updating $X.<br>\r\n0 - Use UNIX default behavior on system. <br>\r\n1 = Use Open M [DSM] default behavior on system.<br> \r\n2 = Use Open M [DTM]/Open M [MSM] default behavior on system.<br> \r\n3 = Use OpenVMS Alpha default behavior on system. <br>\r\nThe default behavior on UNIX zero (0).<br> \r\nThe default behavior on VMS is three (3).<br>"
        },
        "DisconnectErr":{
          "type":"boolean",
          "default":0,
          "description":"Enable a process to receive disconnect errors.<br>\r\nThis setting conditions how a process responds to a disconnect of the principal \r\nI/O device. <br>\r\nBe aware that when error on disconnect is enabled, a process continues to execute after \r\nits principal device has been disconnected. It is the responsibility of the application to \r\ndetect the disconnect condition and exit gracefully. Use care when enabling error on disconnect. \r\nThe application must be prepared to recognize the <DSCON> error and handle it appropriately \r\nin error traps. Error on disconnect is only applicable to TCP devices and to terminal devices \r\nwhere a disconnect can be recognized. Examples are modem controlled terminals and Windows \r\nTelnet, Windows LAT, and Windows local cterm (TRM:) connections. Error on disconnect is only \r\napplicable to the principal device.\r\n0 - Process exits without reporting an error to the application when a disconnect is detected.<br>\r\n1 - Process receives a <DSCON> error when a disconnect is detected during a Write or Read command.<br>"
        },
        "FileMode":{
          "type":"boolean",
          "default":0,
          "description":"Create a file if it does not exist when called with Write or Read/Write.<br>\r\nWhen 0 (false) and a file is opened for writing that does not exist, a new file is not created \r\nunless the N parameter was provided with the OPEN command.<br>\r\nWhen 1 (true) and a file is opened for writing that does not exist, a new file is created.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "GlobalKillEnabled":{
          "type":"boolean",
          "default":1,
          "description":"Enable KILL of an unsubscripted global.<br>\r\n0 - KILL of an unsubscripted global results in a <PROTECT> error.\r\n1 - KILL of an unsubscripted global is allowed, so you can kill all subscripts of a global with a single kill instead if killing them individually. "
        },
        "IEEEError":{
          "type":"boolean",
          "default":1,
          "description":"Enables or disables $DOUBLE returning INF and NAN values system-wide.<br>\r\nThis property sets the $DOUBLE function return value behavior system-wide. \r\nIf 0, $DOUBLE returns INF (infinity), -INF, and NAN (Not A Number) for unresolvable IEEE \r\nfloating point conversions. If 1, $DOUBLE generates ObjectScript errors for unresolvable IEEE \r\nfloating point conversions. The property controls the issuing of INF, -INF, and NAN when \r\na $DOUBLE numeric operation cannot be resolved to a numeric value. It does not control\r\nthe issuing of INF, -INF, and NAN in all cases. $DOUBLE always returns INF, -INF, or \r\nNAN when you supply one of these strings as the input value, regardless of this property.\r\nMathematical operations on $DOUBLE numbers that result in an INF, -INF, or NAN are controlled \r\nby this property. These include arithmetic operations, exponentiation, and logarithmic and \r\ntrigonometric functions. <br>\r\n0 - $DOUBLE returns INF, -INF, or NAN when given an unresolvable numeric expression. <br>\r\n1 - $DOUBLE generates <MAXNUMBER>, <ILLEGAL VALUE>, and <DIVIDE> errors when given an unresolvable numeric expression."
        },
        "LineRecall":{
          "type":"boolean",
          "default":1,
          "description":"Enable command line recall for READ commands. <br>\r\nRead line recall is only used by terminal devices.<br>\r\nThe OPEN command sets the read line recall mode for a terminal. You can specify the \r\nR protocol (enable) or the N protocol (disable). If neither protocol is specified, \r\nOPEN takes its setting from the current default established by %SYS.ProcessQuery.LineRecall,\r\nthis property. The USE command can specify the R protocol (enable) or the N protocol (disable) \r\nto change the OPEN mode. If neither protocol is specified, USE takes its setting from the \r\ninitial OPEN mode value.\r\nAn implicit open of an active device, such as issuing a BREAK command, reopens the device \r\nin the same mode as the initial OPEN command. \r\nModifying this property does not override an OPEN or USE setting for an active terminal. \r\nTo change read line recall for an already open terminal device, you must explicitly reopen \r\nthe device. You can use this property  or %SYS.ProcessQuery.LineRecall to change the default, \r\nthen issue an OPEN 0 command, which reopens the active terminal device, applying the current \r\ndefault. See Terminal I/O in InterSystems IRIS I/O Device Guide for details on using protocols. <br><br>\r\nRead Line Recall<br>\r\nRead line recall mode provides line recall of editable lines as input for READ operations \r\nfrom a terminal. These recallable lines include both previous READ input lines and previous \r\ncommand lines. Echoing of input lines is a necessary precondition for read line recall. \r\nThe system supports read line recall for both variable-length terminal reads (READ var) \r\nand fixed-length terminal reads (READ var#n). The system does not support read line recall \r\nfor single-character terminal reads (READ *var). For a fixed-length terminal read, the \r\nrecalled line is truncated to one character less than the number of characters specified in \r\nthe READ. This final READ character position is reserved for typing a line termination \r\ncharacter, specifying an edit character, or adding one more data character. \r\nWhen read line recall is active, you can provide input to a READ by using the Up Arrow and \r\nDown Arrow keys to recall a previous terminal input line. You can then use the Left Arrow,\r\nRight Arrow, Home, and End keys to position the cursor for editing the recalled line. \r\nYou can use the Backspace key to delete a character, Ctrl-X to delete the entire line, \r\nor Ctrl-U to delete all of the line to the left of the cursor. \r\nWhen read line recall is not active, the four Arrow keys, the Home key, and the End key \r\nall issue a line termination character. You can use the Backspace key to delete a single \r\ninput character, and Ctrl-X (or Ctrl-U) to delete the entire input line. Read line recall \r\ncan be deactivated by using the -R protocol, or by specifying the N, I, S, or T protocols, \r\nas described in the Terminal I/O chapter of the InterSystems IRIS I/O Device Guide. <br><br>\r\n0 - Command line recall is not enabled.<br>\r\n1 - Command line recall is enabled.<br>"
        },
        "ListFormat":{
          "type":"integer",
          "default":0,
          "description":"Enable compression of some $LIST types.<br>\r\nThe value is bit flags controlling these types:<br>\r\n1 - Compress IEEE floating point values ($DOUBLE)<br>\r\n2 - Compress Unicode strings"
        },
        "LogRollback":{
          "type":"boolean",
          "default":0,
          "description":"Enable logging for transaction rollbacks.<br>\r\n0 - Do not log transaction rollbacks.<br>\r\n1 - Log transaction rollbacks to the console log file.<br>"
        },
        "MVDefined":{
          "type":"boolean",
          "default":0,
          "description":"Sets MVBasic handling of undefined variables system-wide.<br>\r\nThis property function defines MVBasic behavior when it encounters a reference to an \r\nundefined variable. By default, if an MVBasic routine references an undefined variable, \r\nThe system generates an <UNDEFINED> error. You can change this default behavior to have \r\nthe system substitute an empty string for an undefined variable, without signaling an error.<br> \r\n0 - issue an <UNDEFINED> error for an undefined variable.<br>\r\n1 - substitute the empty string for an undefined variable.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "NodeNameInPid":{
          "type":"boolean",
          "default":0,
          "description":"Behavior when there is a reference to the special variable $JOB. <br>\r\n0 - $JOB returns only the process ID number. \r\n1 - $JOB returns the process ID number of the current process, concatenated to the nodename."
        },
        "NullSubscripts":{
          "type":"boolean",
          "default":0,
          "description":"Enable null subscript references.<br>\r\n0 - Throw <SUBSCRIPT> error when referencing a null subscript.<br>\r\n1 - Null subscript references do not throw an error.<br>"
        },
        "OldZU5":{
          "type":"boolean",
          "default":0,
          "description":"When switching namespace to the same namespace via $namespace or ZN, clear global vectors.<br>\r\n0 - Switching to the same namespace is a NOOP.<br>\r\n1 - Switching to the same namespace clears the globals vector cache.<br>"
        },
        "OpenMode":{
          "type":"integer",
          "default":0,
          "description":"The read/write mode you want used when opening sequential files and no mode is specified in the OPEN command.<br>\r\n0 - Read<br>\r\n1 - Read-Write<br>"
        },
        "PopError":{
          "type":"boolean",
          "default":0,
          "description":"When to pop $ZTRAP error handlers off the stack.<br><br>\r\nWhen a $ZTRAP error handler is invoked by the system, that error handler remains on the stack of\r\nestablished error handlers. Therefore, if an error occurs when the error handler is executing,\r\nthat error handler attempts to invoke itself, receives the same error again and enters an\r\ninfinite loop, unless that error handler explicitly sets $ZTRAP to a new value.<br>\r\nWhen a $ZTRAP error handler is invoked in DSM, the error handler is removed from the stack. \r\nTherefore, if an error occurs while the error handler is executing, that error is handled \r\nby the previous error handler on the stack.<br><br>\r\n0 - Normal behavior: A $ZTRAP error handler stays active when the error handler is invoked.<br>\r\n1 - Pop the $ZTRAP error handler off the stack when an error is triggered (DSM compatibility mode). <br>"
        },
        "RefInKind":{
          "type":"boolean",
          "default":0,
          "description":"Result of $NAME and $QUERY when an extended global reference is the argument.<br>\r\n0 - Return the global with an extended reference. <br>\r\n1 - Return the global without reference to where it is on the network. <br>"
        },
        "ScientificNotation":{
          "type":"boolean",
          "default":1,
          "description":"Enables or disables lowercase \"e\" as scientific notation symbol system-wide.<br>\r\n0 - Disable lowercase \"e\".<br>\r\n1 - Enable lowercase \"e\".<br>"
        },
        "SetZEOF":{
          "type":"boolean",
          "default":0,
          "description":"Behavior when the system encounters an unexpected end-of-file when reading a sequential file.<br>\r\n0 - Throw an <ENDOFFILE> error.<br>\r\n1 - Set the special variable $ZEOF to indicate that you have reached the end of the file. <br>"
        },
        "ShutDownLogErrors":{
          "type":"boolean",
          "default":0,
          "description":"Write ^SYSLOG errors to the console log file at shutdown.<br>\r\n0 - Do not write ^SYSLOG errors.<br>\r\n1 - Write ^SYSLOG errors.<br>"
        },
        "StopID":{
          "type":"boolean",
          "default":0,
          "description":"Sets $ZF process deletion behavior for OpenVMS STOP/ID system-wide.<br>\r\nUsing the OpenVMS STOP/ID command to delete a process can cause your \r\nsystem to fail. For this reason, the system on OpenVMS systems prevent you \r\nfrom deleting processes with STOP/ID.\r\nFor processes that are executing $ZF functions, you may need to be able to delete \r\na process from OpenVMS. Set this value to 0 if you need to terminate processes in a $ZF function.<br>\r\n0 - Enable deletion of processes with STOP/ID.<br>\r\n1 - Disable deletion of processes with STOP/ID.<br>"
        },
        "SwitchOSdir":{
          "type":"boolean",
          "default":0,
          "description":"Behavior of the current working O/S directory when changing namespaces.<br>\r\n0 - When you change namespaces, the current working directory is changed to the directory of the default database of the new namespace. However, if this dataset is remote (networked to a different system), the current working directory is left unchanged.<br>\r\n1 - When you change namespaces, the current working directory remains unaltered no matter what namespace you switch to.<br>"
        },
        "SynchCommit":{
          "type":"boolean",
          "default":0,
          "description":"Synchronize TCOMMIT with the corresponding journal write operation.<br>\r\n0 - TCOMMIT does not wait for the write operation to complete. <br>\r\n1 - TCOMMIT does not complete until the journal data write operation completes. Note that setting this\r\nproperty to 1 will have performance implications.<br>"
        },
        "TelnetNUL":{
          "type":"boolean",
          "default":0,
          "description":"Suppress Telnet NUL at end-of-line system-wide.<br>\r\nThis property disables or enables the issuance of a NUL character (ASCII 0) following a CR \r\ncharacter (ASCII 13) at end-of-line during Telnet transmission on Windows systems only. It has\r\nno affect of Unix or VMS systems. On output, a Telnet network virtual terminal (NVT) \r\nperforms the following default end-of-line behavior: either issues a CR \r\n(carriage return character) followed by a LF (linefeed character), or issues a CR \r\n(carriage return character) followed by a NUL character (if no LF is issued). <br>\r\n0 - do not suppress NUL. <br>\r\n1 - suppress NUL. <br>"
        },
        "TruncateOverflow":{
          "type":"boolean",
          "default":0,
          "description":"Enable the <MAXNUMBER> error on numeric overflow.<br>\r\nWhen the system encounters a number larger than 9223372036854775807 E127 (or smaller than -9223372036854775808 E127) it throws the <MAXNUMBER> error. <br>\r\n0 - <MAXNUMBER> error is thrown.<br> \r\n1 - <MAXNUMBER> error is suppressed.<br> "
        },
        "Undefined":{
          "type":"integer",
          "default":0,
          "description":"ObjectScript response to undefined variables.<br>\r\n0 - Always throw an <UNDEFINED> error.<br>\r\n1 - If the undefined variable has subscripts, return a null string, but if the undefined variable is single-valued, throw an <UNDEFINED> error.<br>\r\n2 - Always return a null string.<br>"
        },
        "UseNagleAlgorithm":{
          "type":"boolean",
          "default":0,
          "description":"Enable the Nagle algorithm for Telnet (Windows only).<br>\r\n0 - Nagle algorithm is disabled.<br>\r\n1 - Nagle algorithm is enabled.<br>"
        },
        "ViewPastData":{
          "type":"boolean",
          "default":0,
          "description":"Enable $VIEW command to examine data outside of the InterSystems IRIS memory area.<br>\r\n0 - $VIEW command throws an error.<br>\r\n1 - $view command does not throw an error.<br>"
        },
        "ZDateNull":{
          "type":"boolean",
          "default":0,
          "description":"$ZDATE response to an invalid value. <br>\r\n0 - The valid range is from 0 through 2980013, inclusive, which corresponds to dates from \r\n12/31/1840 through 12/31/9999. This range can be restricted by setting the $ZDATE mindate \r\nand maxdate parameters. If the date is invalid, the error message <ILLEGAL VALUE> or \r\n<VALUE OUT OF RANGE> will be generated. The behavior can be overridden by supplying an \r\nerropt to the $ZDATE call. <br>\r\n1 - (ISM compatibility) The valid range is from 1 through 94232, inclusive, which corresponds to dates from 01/01/1841 \r\nthrough 12/30/2098. This date range is set for any $ZDATE function call which has three or \r\nfewer parameters. If a $ZDATE function call has more than three parameters, the valid date \r\nrange is taken either from the $ZDATE mindate and maxdate parameters (if specified) or \r\nfrom the date range established for the current locale. If the date is invalid, \r\n$ZDATE will return the null string if you submit an invalid date. This behavior is set for \r\nany $ZDATE function call, regardless of the number of parameters. "
        },
        "ZaMode":{
          "type":"boolean",
          "default":0,
          "description":"Determines how the ZALLOCATE (ZA) and ZDEALLOCATE (ZD) commands behave, according to InterSystems IRIS rules or DSM-11 rules.<br>\r\n0 - InterSystems IRIS rules, which means that ZA and ZD behave exactly like LOCK + and LOCK -.<br>\r\n1 - DSM-11 rules, which means that ZA locks can only be unlocked by ZD and LOCK + locks can only be unlocked by LOCK.<br>"
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "Monitor":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "PatrolCollectionInterval":{
          "type":"integer",
          "default":30,
          "description":"** DEPRECATED - No longer Supported. **\r\nEnter the number of seconds between each time the system collects data and sends it to Patrol.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "PatrolDisplayMode":{
          "type":"integer",
          "default":0,
          "description":"** DEPRECATED - No longer Supported. **\r\nControl how the metric data is displayed in the Patrol console.<br>\r\n0 - 'Total' displays the total counts since the collection was started.<br>\r\n1 - 'Delta' displays the count for the last collection period.<br>\r\n2 - 'Rate' displays a calculated count per second.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "PatrolEnabled":{
          "type":"boolean",
          "default":0,
          "description":"** DEPRECATED - No longer Supported. **\r\nAautomatically starts the connection to Patrol when the system is started.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "PatrolTopProcesses":{
          "type":"integer",
          "default":20,
          "description":"** DEPRECATED - No longer Supported. **\r\nNumber of processes to be displayed in the Process Status window on the Patrol console.<br>\r\nThis will show the top processes as sorted by global or routine.<br>\r\nA value of 0 tells the PATROL utility to stop calculating the top processes.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "SNMPEnabled":{
          "type":"boolean",
          "default":0,
          "description":"Automatically starts the SNMP agent when the system is started.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "WMIEnabled":{
          "type":"boolean",
          "default":0,
          "description":"** DEPRECATED - No longer Supported. **\r\nIdentifies this configuration as one that should be monitored by the WMI DLL.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "Namespaces":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "Globals":{
          "type":"string",
          "default":"",
          "description":"Default database for globals.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "Routines":{
          "type":"string",
          "default":"",
          "description":"Default database for routines.<br>"
        },
        "TempGlobals":{
          "type":"string",
          "default":"IRISTEMP",
          "description":"Default database for temporary globals.<br>"
        }
      },
      "required":[
        "Globals",
        "Name",
        "Routines"
      ],
      "example":{
        "Globals":"",
        "Name":"",
        "Routines":""
      }
    },
    "ListOfNamespaces":{
      "type":"object",
      "properties":{
        "Namespaces":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/Namespaces"
          }
        }
      }
    },
    "SQL":{
      "type":"object",
      "properties":{
        "ANSIPrecedence":{
          "type":"boolean",
          "default":1,
          "description":"Apply SQL92 operator precedence if this flag is set<br>"
        },
        "AllowRowIDUpdate":{
          "type":"boolean",
          "default":0,
          "description":"1 - The table compiler omits the checks to see if the RowID field(s) are being updated.<br>\r\n0 - The checks are performed."
        },
        "AutoParallel":{
          "type":"boolean",
          "default":1,
          "description":"Enable auto hinting for %PARALLEL<br>"
        },
        "AutoParallelThreshold":{
          "type":"integer",
          "default":3200,
          "description":"The threshold for auto hinting for %PARALLEL, the lower the value is, the higher the chance this query would be paralleded executed<br>"
        },
        "BiasQueriesAsOutlier":{
          "type":"boolean",
          "default":0,
          "description":"Set to 1 if queries on fields with non-null outliers often refer to the outlier.<br>"
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comment":{
          "type":"boolean",
          "default":1,
          "description":"Set the flag that determines if embedded SQL statements are retained as comments in the .INT code version of the routine.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "DBMSSecurity":{
          "type":"boolean",
          "default":1,
          "description":"Set the flag that determines if SQL security is enabled. If SQL security is ON, all SQL security is active. This means: Each user must specify a valid username and password when logging in through ODBC (or by setting the %msql variable directly); Privilege-based table/view security is active, and the user may only perform actions on a table or view they have been granted access to. If SQL Security is off: Any user may access SQL through ODBC, and may be prompted for a username/password but will not be validated; Privilege-based table/view security is suppressed, and user's may perform actions on tables and views to which they have not been given access.<br>"
        },
        "DDLDefineBitmapExtent":{
          "type":"boolean",
          "default":1,
          "description":"Sets the flag which determines if a class created by a DDL CREATE TABLE statement defines a bitmap extent index for the class.\r\nThis setting only applies to classes created through DDL that do not also define an explicit IdKey index.\r\nDDLDefineBitmapExtent=0 means a bitmap extent index will not be defined.\r\nDDLDefineBitmapExtent=1 means a bitmap extent index will be defined, if possible."
        },
        "DDLFinal":{
          "type":"boolean",
          "default":1,
          "description":"Sets the flag which determines if a class created by a DDL CREATE TABLE statement is Final.<br>\r\nDDLFinal=0 means the class created by the statement will not be defined as Final<br>\r\nDDLFinal=1 means the class created by the statement will be defined as Final.<br>"
        },
        "DDLNo201":{
          "type":"boolean",
          "default":0,
          "description":"Set the flag that determines if an SQLCODE -201 error is returned when an attempt is made to CREATE a previously existing table through DDL.<br>"
        },
        "DDLNo30":{
          "type":"boolean",
          "default":0,
          "description":"Set the flag that determines if an SQLCODE -30 error is returned when an attempt is made to DROP a non-existing table through DDL.<br>"
        },
        "DDLNo307":{
          "type":"boolean",
          "default":0,
          "description":"Set the flag that determines if an SQLCODE -307 error is returned when an attempt is made to a primary key constraint to a table through DDL, when a primary key constraint already exists for that table.<br>"
        },
        "DDLNo311":{
          "type":"boolean",
          "default":0,
          "description":"Setting this parameter to 'Yes' allows you to ADD a foreign key through DDL even if one with the same name already exists. Setting this parameter to 'No' disallows this action and returns an error code.<br>"
        },
        "DDLNo315":{
          "type":"boolean",
          "default":0,
          "description":"Set the flag that determines if an SQLCODE -315 error is returned when an attempt is made to DROP a non-existant constraint through DDL.<br>"
        },
        "DDLNo324":{
          "type":"boolean",
          "default":0,
          "description":"Set the flag that determines if an SQLCODE -324 error is returned when an attempt is made to CREATE a previously existing index through DDL.<br>"
        },
        "DDLNo333":{
          "type":"boolean",
          "default":0,
          "description":"Set the flag that determines if an SQLCODE -333 error is returned when an attempt is made to drop a non-existant index through DDL.<br>"
        },
        "DDLSQLOnlyCompile":{
          "type":"boolean",
          "default":0,
          "description":"1 - any class compilation performed as a result of executing a DDL statement will compile the class with the \"q\" (sqlonly) flag.<br>\r\n0 - the \"q\" flag is not used. This is the default."
        },
        "DDLUseExtentSet":{
          "type":"boolean",
          "default":1,
          "description":"Sets the flag which determines if a class created by a DDL CREATE TABLE statement defines the USEEXTENTSET class parameter to a value of 1.\r\nUSEEXTENTSET=1 will generally bind the table to better improving global names, especially the index globals.  It does mean the global names the class is mapped to is not a name that attempts to match the classname.\r\nSee documentation for USEEXTENTSET parameter for more information."
        },
        "DDLUseSequence":{
          "type":"boolean",
          "default":1,
          "description":"Sets the flag which determines if a class created by a DDL CREATE TABLE statement uses $Sequence for ID assignment.\r\nThe storage keyword IDFUNCTION can be defined as INCREMENT or SEQUENCE. This keyword value is used by the class compiler to determine \r\nwhich system function - $increment or $sequence - is to be used for assigning new ID values for a persistent class using default storage.\r\nThe default value for IDFUNCTION is INCREMENT, however the default behavior for classes defined through DDL is to define IDFUNCTION as SEQUENCE.\r\nTo configure the system to have classes created through DDL to define IDFUNCTION as INCREMENT, define DDLUseSequence=0.\r\nTo configure the system to have classes created through DDL to define IDFUNCTION as SEQUENCE, define DDLUseSequence=1."
        },
        "DefaultSchema":{
          "type":"string",
          "default":"SQLUser",
          "description":"This setting provides the ability to define a default schema name other than SQLUser, the default. When an unqualified table name is encountered in an SQL statement (and there is no #import statement specified), the default schema will be used.  You may specify _CURRENT_USER for the default schema name if you wish to use the SQL username the process logged in as the name of the default schema. If the process has not logged in to SQL, SQLUser will be used as the default schema name.  You may also specify _CURRENT_USER/<default name>.  In this case, if the process has not logged in to SQL, <default name> will be used as the default schema name.  For example:  _CURRENT_USER/HMO will use HMO as the default schema if the process has not logged in to SQL.  This setting has nothing to do with the mappings between SQL schema names and the class package name, it only specifies the default schema.<br>"
        },
        "DelimitedIds":{
          "type":"boolean",
          "default":1,
          "description":"Set the flag that determines if double quotes (\") in an SQL statement are used for delimited (quoted) identifiers or string constants.  If \"Yes\", a double quoted string (\"My String\") will be considered an identifier within an SQL statement.  If \"No\", a double quoted string (\"My String\") will be considered a string literal within an SQL statement.<br>"
        },
        "DropDelete":{
          "type":"boolean",
          "default":1,
          "description":"Set the flag that determines whether a DDL DROP TABLE statement deletes the table's data.<br>"
        },
        "ECPSync":{
          "type":"boolean",
          "default":0,
          "description":"When an SQL Select statement is executed, forces all pending ECP requests to the DB-server.\r\nOn completion it guarantees that the client cache is in sync."
        },
        "ExtrinsicFunctions":{
          "type":"boolean",
          "default":0,
          "description":"Allows/disallows extrinsic functions to be used in SQL statements through ODBC, JDBC, and Dynamic Query.<br>"
        },
        "FastDistinct":{
          "type":"boolean",
          "default":1,
          "description":"Set the flag that determines if SQL DISTINCT optimization is turned on.  If true (the default) many SQL queries involving DISTINCT (and GROUP BY) \r\n\twill run much more efficiently by making better use of indices (if available). \r\n\tThe downside of this is that the values returned by such queries will be collated \r\n\tin the same way they are stored within the index (i.e., results may be in upper case). \r\n\tSome applications care about the case of values returned by such queries. \r\n\tIf \"Fast DISTINCT\" is set to false (0), the SQL will revert to its pre-Cache 5.1 \r\n\tbehavior with regards to DISTINCT behavior.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "IdKey":{
          "type":"boolean",
          "default":1,
          "description":"Set the flag that determines whether a Primary Key constraint specified through DDL also<br>\r\nbecomes the IDKey index in the class definition or not. By default, the primary key does<br>\r\nalso become the idkey index. This generally gives better performance, but means that<br>\r\nthe Primary Key fields cannot be updated.<br>"
        },
        "IdTrxFrom":{
          "type":"string",
          "default":"",
          "description":"Modifies the DDL Identifier Translation mappings. This is for filtering/modifying valid SQL identifier characters when translating SQL identifiers into Objects identifiers. When converting an SQL identifier to an Objects identifier at DDL run-time, the characters in the 'From' list are converted to the characters in the 'To' list.<br>"
        },
        "IdTrxTo":{
          "type":"string",
          "default":"",
          "description":"Modifies the DDL Identifier Translation mappings. This is for filtering/modifying valid SQL identifier characters when translating SQL identifiers into Objects identifiers. When converting an SQL identifier to an Objects identifier at DDL run-time, the characters in the 'From' list are converted to the characters in the 'To' list.<br>"
        },
        "JDBCGatewayJVMArgs":{
          "type":"string",
          "default":"",
          "description":"Optional JVM arguments to include in the command line when starting the JDBC Gateway.<br>"
        },
        "JDBCGatewayLog":{
          "type":"string",
          "default":"",
          "description":"Name of the JDBC Gateway log file.<br>"
        },
        "JDBCGatewayPort":{
          "type":"integer",
          "default":62972,
          "description":"Port number for the JDBC Gateway.<br>"
        },
        "JDBCGatewayUsePassphrase":{
          "type":"boolean",
          "default":0,
          "description":"Require Passhphrase for JDBC connection"
        },
        "JavaClassPath":{
          "type":"string",
          "default":"",
          "description":""
        },
        "JavaHome":{
          "type":"string",
          "default":"",
          "description":""
        },
        "LockThreshold":{
          "type":"integer",
          "default":1000,
          "description":"The value n is the lock threshold. This is the number of inserts, updates, or deletes for a single table\r\nwithin a single transaction that will trigger a table-level lock when reached. For example, if the lock\r\nthreshold is 1000 and a process starts a transaction and then inserts 2000 rows, after the 1001st row is\r\ninserted the process will attempt to acquire a table-level lock instead of continue to lock individual\r\nrows. This is to help keep the lock table from becoming too full."
        },
        "LockTimeout":{
          "type":"integer",
          "default":10,
          "description":"Set the Lock Timeout for locks made during execution of SQL statements. This value is in seconds.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "ODBCVarcharMaxlen":{
          "type":"integer",
          "default":4096,
          "description":"Defines the MaxLen for ODBC fields of type VarChar.<br>"
        },
        "QueryProcedures":{
          "type":"boolean",
          "default":0,
          "description":"Defines whether or not all class queries project as SQL Stored Procedures \r\nregardless of the query's SqlProc setting.<br>\r\nDefault is 0, only class queries defined with SqlProc=1 will project as \r\nStored Procedures. When set to 1, all class queries will project as stored\r\nprocedures. When changing this setting, you must recompile the classes with \r\nthe class queries in order for this change to have an affect."
        },
        "RTPC":{
          "type":"boolean",
          "default":0,
          "description":"Enable Run Time Plan Choice<br>"
        },
        "ReferentialChecks":{
          "type":"boolean",
          "default":1,
          "description":"For INSERT, UPDATE, and DELETE, setting this parameter to 'Yes' instructs InterSystems IRIS to validate the foreign key constraint. Setting this parameter to 'No' will bypass foreign key constraint checking.<br>"
        },
        "SaveMAC":{
          "type":"boolean",
          "default":0,
          "description":"Defines whether or not the source code (.MAC and .INT) is saved or not. The default is that no source code is saved. This setting is made on a per-system basis.<br>"
        },
        "TCPKeepAlive":{
          "type":"integer",
          "default":300,
          "description":"Set the TCP Keep Alive timeout for xDBC TCP connections.<br>\r\nThis is the number of seconds between keep alive-messages.  The default for this is 300 seconds (5 minutes).]]></Description>"
        },
        "TODATEDefaultFormat":{
          "type":"string",
          "default":"DD MON YYYY",
          "description":"Default date format for the SQL TO_DATE() function.<br>"
        },
        "TimePrecision":{
          "type":"integer",
          "default":0,
          "description":"Set the default precision for the Time component of the value returned by the GETDATE(), CURRENT_TIME, and CURRENT_TIMESTAMP SQL Scalar functions.  The precision, the number of decimal places for the millisecond portion of the time value, has a default is 0, which means milliseconds are not returned in the values returned by the GETDATE(), CURRENT_TIME, and CURRENT_TIMESTAMP functions.<br>"
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "Shadows":{
      "type":"object",
      "properties":{
        "Address":{
          "type":"string",
          "default":"",
          "description":"IP Address to connect to.<br>"
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "DaysBeforePurge":{
          "type":"integer",
          "default":0,
          "description":""
        },
        "DisableJournalUpdates":{
          "type":"boolean",
          "default":0,
          "description":"If true, updates that the shadow applies to the shadow databases are NOT\r\njournaled, regardless of the journal settings on the databases. By default,\r\nthis is false, that is, shadow updates are journaled."
        },
        "Enabled":{
          "type":"boolean",
          "default":0,
          "description":"Specifies whether the shadow should be running or stopped.<br>\r\n0 - Stopped<br>\r\n1 - Running<br>"
        },
        "FilterRoutine":{
          "type":"string",
          "default":"",
          "description":""
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "JournalDirectory":{
          "type":"string",
          "default":"shadow",
          "description":"Directory where the shadow journal files reside.<br>"
        },
        "MaxErrors":{
          "type":"integer",
          "default":10,
          "description":"Maximum number of errors to retain.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "SSLConfig":{
          "type":"string",
          "default":"",
          "description":"SSL configuration to use on the shadow connection.<br>"
        }
      },
      "required":[
        "Address",
        "Name"
      ],
      "example":{
        "Address":"",
        "Name":""
      }
    },
    "ListOfShadows":{
      "type":"object",
      "properties":{
        "Shadows":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/Shadows"
          }
        }
      }
    },
    "SqlSysDatatypes":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Datatype":{
          "type":"string",
          "default":"",
          "description":""
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        }
      },
      "required":[
        "Datatype",
        "Name"
      ],
      "example":{
        "Datatype":"",
        "Name":""
      }
    },
    "ListOfSqlSysDatatypes":{
      "type":"object",
      "properties":{
        "SqlSysDatatypes":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/SqlSysDatatypes"
          }
        }
      }
    },
    "SqlUserDatatypes":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "Datatype":{
          "type":"string",
          "default":"",
          "description":""
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        }
      },
      "required":[
        "Datatype",
        "Name"
      ],
      "example":{
        "Datatype":"",
        "Name":""
      }
    },
    "ListOfSqlUserDatatypes":{
      "type":"object",
      "properties":{
        "SqlUserDatatypes":{
          "type":"array",
          "items":{
            "$ref":"#/definitions/SqlUserDatatypes"
          }
        }
      }
    },
    "Startup":{
      "type":"object",
      "properties":{
        "ArbiterURL":{
          "type":"string",
          "default":"",
          "description":"When configuring a mirror using ShardMirrorRole, this field can be\r\nused to specify an Arbiter.<br>\r\nThe format of this field is  <i>host</i>:<i>port</i>"
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "CallinHalt":{
          "type":"boolean",
          "default":1,
          "description":"Execute the CALLIN^%ZSTOP routine entry during calling Halt.<br>"
        },
        "CallinStart":{
          "type":"boolean",
          "default":1,
          "description":"Executes the CALLIN^%ZSTART routine entry during Callin startup.<br>"
        },
        "CliSysName":{
          "type":"string",
          "default":"",
          "description":"Name used to append to $J when Config.Miscellaneous.NodeNameInPid is set.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "DBSizesAllowed":{
          "type":"string",
          "default":"8192",
          "description":"Stores a list of allowed database block sizes.<br>"
        },
        "DefaultPort":{
          "type":"integer",
          "default":1972,
          "description":"Port for the SuperServer.<br>"
        },
        "DefaultPortBindAddress":{
          "type":"string",
          "default":"",
          "description":"IP Address SuperServer will bind to.<br>\r\nBy default, the SuperServer accepts requests on all addresses, but if a DefaultPortBindAddress is specified it will accept requests only on that address.\r\nYou should insure that all clients, including the CSP Gateway, are also configured to connect to the address you specify.\r\nIf no address is specified, the SuperServer will accept requests directed to any address on the server."
        },
        "EnableVSSBackup":{
          "type":"boolean",
          "default":0,
          "description":"Start the VSS Backup Daemon.<br>"
        },
        "EnsembleAutoStart":{
          "type":"boolean",
          "default":0,
          "description":"Auto start the Interoperability productions.<br>"
        },
        "ErrorPurge":{
          "type":"integer",
          "default":30,
          "description":"Number of days to store application error logs before purging them.<br>"
        },
        "FIPSMode":{
          "type":"boolean",
          "default":0,
          "description":"Use FIPS 140-2 compliant library for database encryption.<br>"
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "IPv6":{
          "type":"boolean",
          "default":0,
          "description":"System is operating in an IPv6 network, with IPv6 addresses.<br>\r\n0 - IPv6 is not enabled.<br>\r\n1 - IPv6 is enabled.<br>"
        },
        "JobHalt":{
          "type":"boolean",
          "default":1,
          "description":"Execute the JOB^%ZSTOP routine entry during JOB process Halt.<br>"
        },
        "JobServers":{
          "type":"integer",
          "default":0,
          "description":"Number of job servers you want the system to start up with.<br>"
        },
        "JobStart":{
          "type":"boolean",
          "default":1,
          "description":"Execute the JOB^%ZSTART routine entry during JOB process startup.<br>"
        },
        "LicenseID":{
          "type":"string",
          "default":"",
          "description":"LicenseID is used to request the license key from the License Server at startup, if there is no local key file.<br>"
        },
        "MaxConsoleLogSize":{
          "type":"integer",
          "default":5,
          "description":"Maximum size in megabytes of the messages.log after which it will be automatically switched.<br>"
        },
        "MaxIRISTempSizeAtStart":{
          "type":"integer",
          "default":0,
          "description":"Maximum size in megabytes the IRISTEMP database will be when the system is\r\nrestarted.<br> When the system restarts, the IRISTEMP database will be truncated to\r\nthis size. If 0, the IRISTEMP database will not be truncated.<br>"
        },
        "MirrorMember":{
          "type":"string",
          "default":"",
          "description":"Make this node part of a mirror:<br>\r\n<ul>\r\n<li> primary: This node will be the primary failover member\r\n<li> backup: This node will be the backup failover member\r\n<li> drasync This node will be a DR async member\r\n</ul>\r\nNote that these are only initial designations, and that failover may occur at any time. "
        },
        "MirrorPrimary":{
          "type":"string",
          "default":"",
          "description":"Specifies the host or IP of the initial mirror primary. This parameter is required for any\r\nnon-empty value of parameter <i>MirrorMember</i> other than \"primary\"."
        },
        "MirrorSetName":{
          "type":"string",
          "default":"",
          "description":"MirrorSetName is the name of the mirror set to be created. This name is converted to uppercase before storing.\r\nOnly alphanumeric characters are allowed to be in the mirror set name. This name can not be a null string."
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "PasswordHash":{
          "type":"string",
          "default":"",
          "description":"Set the IRIS password using a cryptographic hash and salt.<br>\r\nThe format of this field is:  <i>hash</i>,<i>salt</i>,<i>workFactor</i>,<i>algorithm</i><br>\r\n<ul>\r\n<li>Hash: Hex-encoded output of PBKDF2 function.  Must be correct number of bits for Algorithm.\r\n<li>Salt: Hex-encoded salt input to PBKDF2.  Must be correct number of bits for Algorithm.\r\n<li>WorkFactor: WorkFactor input for PBKDF2.\r\n<li>Algorithm: A valid <a href=\"%25CSP.Documatic.cls?PAGE=CLASS&LIBRARY=%25SYS&CLASSNAME=Security.PBKDF2Alg\">Security.Datatype.PBKDF2Alg</a> value.\r\n</ul>\r\n"
        },
        "ProcessHalt":{
          "type":"boolean",
          "default":1,
          "description":"Execute the LOGIN^%ZSTOP routine entry during terminal user Halt.<br>"
        },
        "ProcessStart":{
          "type":"boolean",
          "default":1,
          "description":"Execute the LOGIN^%ZSTART routine entry during terminal user startup.<br>"
        },
        "ShardClusterURL":{
          "type":"string",
          "default":"",
          "description":"In node-level architecture, specifies the location of the initial data node.\r\nThis field should be populated for all values of <i>ShardRole</i> other than <b>NODE1</b>.<br>\r\nThe format of this field is:  IRIS://<i>host</i>:<i>port</i>/<i>namespace</i><br>"
        },
        "ShardMasterRegexp":{
          "type":"string",
          "default":"-0$",
          "description":"Regular expression used to determine node type when <i>ShardRole</i> is <b>AUTO</b>.\r\nIf the hostname matches this expression, role will be <b>NODE1</b>, otherwise <b>DATA</b>.\r\nThe default regular expression assumes that the hostname for the <b>NODE1</b> node ends in \"-0\":<br>\r\n<ul>\r\niris-data-0 &nbsp&nbsp&nbsp&nbsp // NODE1<br>\r\niris-data-1 &nbsp&nbsp&nbsp&nbsp // DATA<br>\r\n. . .<br>\r\niris-data-N &nbsp&nbsp&nbsp&nbsp // DATA<br>\r\n</ul>\r\nHowever, suppose your hostname convention was the following:\r\n<ul>\r\niris-data-0-0 &nbsp&nbsp&nbsp&nbsp // Shard 0 primary<br>\r\niris-data-0-1 &nbsp&nbsp&nbsp&nbsp // Shard 0 backup<br>\r\niris-data-1-0 &nbsp&nbsp&nbsp&nbsp // Shard 1 primary<br>\r\niris-data-1-1 &nbsp&nbsp&nbsp&nbsp // Shard 1 backup<br>\r\n. . .<br>\r\niris-data-N-0 &nbsp&nbsp&nbsp&nbsp // Shard N primary<br>\r\niris-data-N-1 &nbsp&nbsp&nbsp&nbsp // Shard N backup<br>\r\n</ul>\r\nIn this case, we choose a value for <i>ShardMasterRegexp</i> that matches the first node only: \"-0-0$\"<br>"
        },
        "ShardMirrorMember":{
          "type":"string",
          "default":"",
          "description":"Make this node part of a mirror:<br>\r\n<ul>\r\n<li> primary: This node will be the primary failover member\r\n<li> backup: This node will be the backup failover member\r\n<li> drasync This node will be a DR async member\r\n<li> auto: Automatic failover member selection based on whether the hostname (which must conform with <i>ShardRegexp</i>)\r\ncontains an even or odd number after the final dash:\r\n  <ul>\r\n  iris-data-0: primary<br>\r\n  iris-data-1: backup<br>\r\n  iris-data-2: primary<br>\r\n  iris-data-3: backup<br>\r\n  </ul>\r\n</ul>\r\nNote that these are only initial designations, and that failover may occur at any time. "
        },
        "ShardRegexp":{
          "type":"string",
          "default":"-[0-9]+$",
          "description":"Regular expression used to make sure that hostnames conform to a regular numbering scheme,\r\nwhich is a prerequisite for using <i>ShardRole</i> and <i>ShardMirrorMember</i> in automatic mode.  The default assumes\r\na scheme such as the following:\r\n<ul>\r\niris-data-0<br>\r\niris-data-1<br>\r\n. . .<br>\r\niris-data-N<br>\r\n</ul>"
        },
        "ShardRole":{
          "type":"string",
          "default":"",
          "description":"Specify the role of this IRIS instance in nod-level architecture:<br>\r\n<ul>\r\n<li> NODE1: This is the initial data node; if mirrored, set on primary failover member only\r\n<li> DATA: For all data nodes other than NODE1\r\n<li> AUTO: Automatically determine role by comparing hostname with <i>ShardMasterRegexp</i>:\r\n  <ul>\r\n  <li>Match: NODE1\r\n  <li>Non-match: DATA\r\n  </ul>\r\n<li> COMPUTE: This will be a compute node\r\n</ul>\r\nFor all roles other than <b>NODE1</b>, requires that <i>ShardClusterURL</i> be provided."
        },
        "ShutdownTimeout":{
          "type":"integer",
          "default":300,
          "description":"Enter the time, in seconds, InterSystems IRIS should wait for shutdown to complete normally before\r\ntiming out and forcing a shutdown.<br>"
        },
        "SystemHalt":{
          "type":"boolean",
          "default":1,
          "description":"Execute the SYSTEM^%ZSTOP routine entry during system shutdown.<br>"
        },
        "SystemMode":{
          "type":"string",
          "default":"",
          "description":"The SystemMode is displayed in the title of the Management Portal web page. Currently, SystemMode string values recognized by the Management Portal include:<br>\r\n<ul>\r\n<li>LIVE\r\n<li>TEST\r\n<li>DEVELOPMENT\r\n<li>FAILOVER\r\n</ul>"
        },
        "SystemStart":{
          "type":"boolean",
          "default":1,
          "description":"Executes the SYSTEM^%ZSTART routine entry during system startup.<br>"
        },
        "TempDirectory":{
          "type":"string",
          "default":"Temp",
          "description":"Directory for temporary files.<br>"
        },
        "TerminalPrompt":{
          "type":"string",
          "default":"8,2",
          "description":"Set the format of the terminal prompt.<br>\r\nThis is a comma separated string of values which set the default terminal prompt for the system.<br>\r\nValues:<br>\r\n0 - Use only \">\" for the prompt.<br>\r\n1 - Host name, also known as the current system name. The name assigned to your\r\ncomputer. For example, LABLAPTOP&gt;. This is the same for all of your terminal\r\nprocesses.<br>\r\n2 - Namespace name. For example, %SYS&gt;. The current namespace name is contained\r\nin the $NAMESPACE special variable. It can be an explicit namespace name or an\r\nimplied namespace name.<br>\r\n3 - Config name. The name of your system installation. For example, DEVELOPMENT&gt;.\r\nThis is the same for all of your terminal processes.<br>\r\n4 - Current time, expressed as local time in 24-hour format with whole seconds.\r\nFor example, 15:59:36&gt;. This is the static time value for when the prompt was\r\nreturned. This value changes for each prompt.<br>\r\n5 - pid. The Process ID for your terminal. For example, 2336&gt;. This is different\r\nfor each terminal process. This value can also be returned from the $JOB special\r\nvariable.<br>\r\n6 - Username. For example, fred&gt;. This is the same for all of your terminal\r\nprocesses.<br>\r\n7 - Elapsed time executing the last command, in seconds.milliseconds. For example,\r\n.000495&gt;. Leading and trailing zeros are suppressed. This changes for each prompt.<br>\r\n8 - Transaction Level. For example, TL1&gt;.<br><br>\r\nThe order of the values in the string determines the order the values appear in the prompt.\r\nFor example TerminalPrompt=\"2,1\" will give you a terminal prompt of \"%SYS:HostName>\""
        },
        "WebServer":{
          "type":"boolean",
          "default":1,
          "description":"Start the private WebServer.<br>"
        },
        "WebServerName":{
          "type":"string",
          "default":"",
          "description":"Webserver name or IP address the private web server is running on.<br>\r\nIf not specified, it defaults to localhost. For Unix and Windows, the\r\nprivate web server will be started on this node, on the specified IP address\r\nand port. For VMS, This is the IP address of the node where the webserver\r\nis running."
        },
        "WebServerPort":{
          "type":"integer",
          "default":57772,
          "description":"Private WebServer port.<br>"
        },
        "WebServerURLPrefix":{
          "type":"string",
          "default":"",
          "description":"URL prefix.<br>"
        },
        "ZSTU":{
          "type":"boolean",
          "default":1,
          "description":"Run the user defined startup from the ZSTU routine at system startup.<br>"
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "Telnet":{
      "type":"object",
      "properties":{
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "DNSLookup":{
          "type":"string",
          "default":"ON",
          "description":"Determines whether DNS lookup should be enabled.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "Port":{
          "type":"integer",
          "default":23,
          "description":"Telnet port.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    },
    "config":{
      "type":"object",
      "properties":{
        "BackoffDisabled":{
          "type":"boolean",
          "default":0,
          "description":"Upon failure to allocate memory, do not retry with a reduced amount.  If shared\r\nmemory cannot be allocated at its configured size, startup is aborted.\r\n<br><br>\r\nMakes up part of the CPF parameter memlock=\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "CPFFile":{
          "type":"string",
          "default":"/usr/irissys/iris.cpf",
          "description":"CPF file which the object maps to.<br>"
        },
        "Comments":{
          "type":"string",
          "default":"",
          "description":"Embedded comments in the CPF file.<br>"
        },
        "ConsoleFile":{
          "type":"string",
          "default":"",
          "description":"Location of the messages.log file.<br>\r\nNull means the MGR directory.<br>\r\nThis is the second piece of the CPF parameter console=VMSConsoleTerminal,ConsoleFile\r\n<br><br>\r\nModifying this property does not require a restart of the system to make it active."
        },
        "Flags":{
          "type":"integer",
          "default":7,
          "description":"Flags governing how the object is processed when %Save() is called.<br>\r\nFor normal operations, all bits should be set.<br>\r\n<b>Bit $$$CPFSave</b> - Save object to disk.<br>\r\n<b>Bit $$$CPFWrite</b> - Write CPF file from object.<br>\r\n<b>Bit $$$CPFActivate</b> - Activate object into memory if CPFFile is the same as what is currently active.<br>\r\n<b>Bit $$$CPFAvoidBackupDB</b> - Don't Add/Remove the Database to Backup DB list.<br>"
        },
        "LargePagesDisabled":{
          "type":"boolean",
          "default":0,
          "description":"If true, on platforms supporting large/huge pages, instructs the system not\r\nto use them for global and routine buffers.\r\n<br><br>\r\nMakes up part of the CPF parameter memlock=\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "LargePagesRequired":{
          "type":"boolean",
          "default":0,
          "description":"If true, on platforms supporting large or huge pages, requires shared memory to\r\nbe allocated from them.  Ignored on other platforms or if large pages are \r\ndisabled by <PROPERTY>LargePagesDisabled</PROPERTY>.  If true and not ignored, \r\nand memory cannot be allocated in large/huge pages, startup is aborted.  Note: \r\nstartup may retry with a small reduction in memory size, but the extent to which\r\nmemory may be reduced is smaller than would be allowed in absence of this flag.\r\nYou can disable this retry altogether with <PROPERTY>BackoffDisabled</PROPERTY>.\r\n<br><br>\r\nMakes up part of the CPF parameter memlock=\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "LibPath":{
          "type":"string",
          "default":"",
          "description":"On Unix systems this sets the LD_LIBRARY_PATH environment variable to set \r\nsearch paths for third-party shared libraries. Ignored on Windows and VMS.\r\n<br><br>\r\nModifying this property does not require a restart of the system to make it active."
        },
        "LineRecallBuffer":{
          "type":"integer",
          "default":1024,
          "description":"The size in bytes of the command line/read line buffer.<br>\r\nThis is the second piece of the CPF parameter history=LineRecallEntries,LineRecallBuffer\r\n<br><br>\r\nModifying this property does not require a restart of the system to make it active."
        },
        "LineRecallEntries":{
          "type":"integer",
          "default":500,
          "description":"The number of entries held in the command line/read line recall buffer.<br>\r\nThis is the first piece of the CPF parameter history=LineRecallEntries,LineRecallBuffer\r\n<br><br>\r\nModifying this property does not require a restart of the system to make it active."
        },
        "LockSharedMemory":{
          "type":"boolean",
          "default":0,
          "description":"On platforms that support it, requests control structures, global and routine\r\nbuffers to be locked in physical memory.  When using large or huge pages for\r\nshared memory, there is no need to set this property since they are \r\nautomatically locked in physical memory.\r\n<br><br>\r\nMakes up part of the CPF parameter memlock=.\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "LockTextSegment":{
          "type":"boolean",
          "default":0,
          "description":"On some UNIX platforms, requests the text segment (executable image) to be\r\nlocked in physical memory.\r\n<br><br>\r\nMakes up part of the CPF parameter memlock=\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "MaxServerConn":{
          "type":"integer",
          "default":1,
          "description":"Maximum number of clients that can access this server simultaneously.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "MaxServers":{
          "type":"integer",
          "default":2,
          "description":"Maximum number of ECP servers that can be accessed from this system.<br>\r\n<br><br>\r\nModifying this property does not require a restart of the system to make it active if memory is available in the shared memory heap."
        },
        "Name":{
          "type":"string",
          "default":"",
          "description":"Name of the object instance.<br>"
        },
        "VMSConsoleTerminal":{
          "type":"string",
          "default":"",
          "description":"Location of the VMS console terminal.<br>\r\nThis is the first piece of the CPF parameter console=VMSConsoleTerminal,ConsoleFile\r\n<br><br>\r\nModifying this property does not require a restart of the system to make it active."
        },
        "ZFSize":{
          "type":"integer",
          "default":0,
          "description":"The total number of bytes allocated in virtual memory for $ZF input and output parameters, including strings.<br>\r\nThis is the second piece of the CPF parameter zfheap=ZFString,ZFSize\r\n<br><br>\r\nModifying this property does not require a restart of the system to make it active."
        },
        "ZFString":{
          "type":"integer",
          "default":0,
          "description":"Number of bytes allocated for the each output byte array or string parameter on the $ZF heap.<br>\r\nThis is the First piece of the CPF parameter zfheap=ZFString,ZFSize\r\n<br><br>\r\nModifying this property does not require a restart of the system to make it active."
        },
        "bbsiz":{
          "type":"integer",
          "default":262144,
          "description":"Maximum amount of memory a process can use (in KB).<br>\r\n<br><br>\r\nModifying this property does not require a restart of the system to make it active."
        },
        "console":{
          "type":"string",
          "default":",",
          "description":"CPF file representation of console=VMSConsoleTerminal,ConsoleFile.<br>"
        },
        "errlog":{
          "type":"integer",
          "default":500,
          "description":"Maximum number of entries you want to store in the SYSLOG log file.<br>\r\nThe log file will expire old entries when this limit is reached.\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "globals":{
          "type":"string",
          "default":"0,0,0,0,0,0",
          "description":"List of configured sizes (in MBytes) for the global caches.<br>\r\nElement #1 corresponds to 2KB blocks (deprecated, always 0 now).<br>\r\nElement #2 corresponds to 4KB blocks.<br>\r\nElement #3 corresponds to 8KB blocks.<br>\r\nElement #4 corresponds to 16KB blocks.<br>\r\nElement #5 corresponds to 32KB blocks.<br>\r\nElement #6 corresponds to 64KB blocks.<br>"
        },
        "globals16kb":{
          "type":"integer",
          "default":0,
          "description":"Number of 16KB buffers in MB.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "globals32kb":{
          "type":"integer",
          "default":0,
          "description":"Number of 32KB buffers in MB.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "globals4kb":{
          "type":"integer",
          "default":0,
          "description":"Number of 4KB buffers in MB.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "globals64kb":{
          "type":"integer",
          "default":0,
          "description":"Number of 64KB buffers in MB.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "globals8kb":{
          "type":"integer",
          "default":0,
          "description":"Number of 8KB buffers in MB.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "gmheap":{
          "type":"integer",
          "default":37568,
          "description":"Generic Memory Heap Size (in KB).<br>\r\nThis is the place from where the Lock\r\ntable, the NLS tables and the PID table are allocated. The absolute minimum value is\r\n2048KB. If you specify a big Lock Table, the minimum value will increase so that there's\r\nalways room for it. If you are using an Asian locale you may want to add an extra MB (1024KB).\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "history":{
          "type":"string",
          "default":"500,1024",
          "description":"CPF file representation of history=LineRecallEntries,LineRecallBuffer.<br>"
        },
        "ijcbuff":{
          "type":"integer",
          "default":512,
          "description":"Number of bytes allocated for each InterJob Communication Device.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "ijcnum":{
          "type":"integer",
          "default":16,
          "description":"The number of InterJob Communication devices.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "jrnbufs":{
          "type":"integer",
          "default":64,
          "description":"Size of journal buffer pool in MBs. Modifying this property will require a restart of the system to make it active. The maximum value is 1024 and the minimum, 16 on Unicode platforms or 8 otherwise."
        },
        "locksiz":{
          "type":"integer",
          "default":16777216,
          "description":"The amount of memory allocated on your system for locks, in bytes.<br>\r\nThe maximum value depends on the gmheap size and not exceeding gmheap size. Memory is allocated in multiples\r\nof 64k (65536 bytes) chunks. If you enter a value which is not on a 64k boundary, the\r\nvalue will be rounded to the next higher 64k boundary.\r\nIncrease the gmheap size if you need more room for the Lock Table.\r\n<br><br>\r\nModifying this property does not require a restart of the system to make it active."
        },
        "memlock":{
          "type":"integer",
          "default":0,
          "description":"When checked, this allows you to lock control structures in memory to improve access time.<br>\r\nCPF file representation of memlock="
        },
        "netjob":{
          "type":"boolean",
          "default":1,
          "description":"Allows jobs from remote connections to run on your server.<br>\r\n<br><br>\r\nModifying this property does not require a restart of the system to make it active."
        },
        "nlstab":{
          "type":"integer",
          "default":50,
          "description":"Enter the maximum number of collation tables. This instructs InterSystems IRIS to reserve space for that many tables at startup.<sp>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "overview":{
          "type":"string",
          "default":"Windows (Intel)~Windows",
          "description":""
        },
        "pijdir":{
          "type":"string",
          "default":"",
          "description":"Directory to store the cluster image journal.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "routines":{
          "type":"string",
          "default":0,
          "description":"Number of MB allocated for caching routine buffers.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "targwijsz":{
          "type":"integer",
          "default":0,
          "description":"When targwijsz is non-zero it is the desired size of the WIJ file in MB.\r\nThe maximum effective value is the size of the buffer pool. While it would not hurt\r\nto have a larger WIJ, it does not help anything. The minimum value is 100MB. When\r\nthe size of the global buffer pool is less than 100MB at startup the WIJ is sized\r\nto hold the entire buffer pool; the minimum size of the WIJ at startup is either\r\n100MB or the size required to hold the entire buffer pool (which is slightly larger\r\nthan the actual size of the buffer pool). If an existing WIJ is larger than\r\nthe specified target, the size of the WIJ is not reduced. <br><br>\r\nWhen the target size is larger than the size of the existing WIJ, the system will\r\nexpand the WIJ while the write daemon is idle up to the specified target (but\r\nnot to exceed the actual size of the WIJ needed to hold the entire buffer pool). The\r\nsystem can expand the WIJ past the target size if that becomes necessary to\r\ncomplete a write cycle.<br><br>\r\nLeaving this value set to 0 is fine. The system will grow the WIJ as needed based\r\non activity. Generally the WIJ quickly reaches whatever size is needed to \r\nsupport the activity level/the size of the buffer pool.  The purpose of setting\r\na target size is that if space has been reserved for the WIJ, setting a target\r\nallows the WIJ to grow to occupy that space early on in the life of the system.\r\nSince user activity can be blocked if the WIJ is too small (the WIJ will try to expand\r\nif this happens), setting the target may lead to a better user experience after\r\nstartup. If the target is set to 0, the WIJ may quickly expand as needed however\r\nusers may be blocked at times when this happens until the WIJ reaches the size\r\nrequired by the system."
        },
        "udevtabsiz":{
          "type":"integer",
          "default":24576,
          "description":"Maximum size in bytes of the device table.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "useresidentmem":{
          "type":"string",
          "default":"",
          "description":"VMS system resident memory name.<br>\r\n<br><br>\r\nModifying this property will require a restart of the system to make it active."
        },
        "wijdir":{
          "type":"string",
          "default":"",
          "description":"Enter the directory for the Write Image Journal file into this text box.<br>\r\n<br><br>\r\nModifying this property does not require an instance restart to activate the change except on cluster members."
        }
      },
      "required":[
        "Name"
      ],
      "example":{
        "Name":""
      }
    }
  }
}
}

}
