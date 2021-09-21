/// Description
Class Api.Config.Services.Export
{

/// Description
ClassMethod ExportConfig() As %Status
{
    Set filter = {
        "SYS.Databases": "",
        "Library.SQLConnection": "",
        "Databases": "",
        "Namespaces": "",
        "MapGlobals":"",
        "MapPackages": "",
        "MapRoutines":"",
        "MapMirrors":"",
        "Journal":"",
        "config":"",
        "Devices":"",
        "Debug":"",
        "DeviceSubTypes":"",
        "Miscellaneous":"",
        "Monitor":"",
        "SQL":"",
        "SQLSysDatatypes":"",
        "SQLUserDatatypes":"",
        "Startup":"",
        "Telnet":"",
        "IO":""
    }
    Set OnlyNotDefaultValue = 1
    Set config = ##class(Api.Config.Services.Loader).export(filter,OnlyNotDefaultValue)
    Do ##class(Api.Config.Developers.Utils).FormatJSON(config,.out)
    Write !,out
}

}
