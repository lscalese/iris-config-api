/// Description
Class Api.Config.Services.Security.GenericExport
{

ClassMethod ExportAll(Directory As %String = {..GetDefaultExportPath()}, ByRef Files As %Binary) As %Status
{
    Set sc = $$$OK
    Kill Files
    
    Set XData = ##class(%Dictionary.CompiledXData).%OpenId($CLASSNAME()_"||ExportAll")
    Set JsonList = {}.%FromJSON($REPLACE(XData.Data.Read(),"{ExportDir}",##class(%File).NormalizeDirectory(Directory)))

    Set iter = JsonList.%GetIterator()

    While iter.%GetNext(.key , .value ) {
        Set properties(key) = value
        Set sc = $CLASSMETHOD($CLASSNAME(),value.ClassMethod,value.Filename)
        Quit:$$$ISERR(sc)
        Set Files(value.ClassMethod) = value.Filename
    }

    Return sc
}

ClassMethod Applications(Filename As %String = {..GetDefaultExportPath()_"ApplicationsExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.Applications).Export(Filename, , "*", 14)
}

ClassMethod DocDBs(Filename As %String = {..GetDefaultExportPath()_"DocDBsExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.DocDBs).Export(Filename, , "*", "*")
}

ClassMethod Users(Filename As %String = {..GetDefaultExportPath()_"UsersExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.Users).Export(Filename,,,,$$$YES)
}

ClassMethod Roles(Filename As %String = {..GetDefaultExportPath()_"RolesExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.Roles).Export(Filename,,,,$$$YES)
}

ClassMethod Resources(Filename As %String = {..GetDefaultExportPath()_"ResourcesExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.Resources).Export(Filename,,,,$$$YES)
}

ClassMethod Services(Filename As %String = {..GetDefaultExportPath()_"ServicesExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.Services).Export(Filename,,"*")
}

ClassMethod SSLConfigs(Filename As %String = {..GetDefaultExportPath()_"SSLConfigsExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.SSLConfigs).Export(Filename,,"*")
}

ClassMethod X509Users(Filename As %String = {..GetDefaultExportPath()_"X509UsersExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.X509Users).Export(Filename)
}

ClassMethod SQLPrivileges(Filename As %String = {..GetDefaultExportPath()_"SQLPrivilegesExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.SQLPrivileges).Export(Filename)
}

ClassMethod SQLAdminPrivilegeSet(Filename As %String = {..GetDefaultExportPath()_"SQLAdminPrivilegesSetExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.SQLAdminPrivilegeSet).Export(Filename)
}

ClassMethod SQLRoleGrantOption(Filename As %String = {..GetDefaultExportPath()_"SQLRoleGrantOptionExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.SQLRoleGrantOption).Export(Filename)
}

ClassMethod System(Filename As %String = {..GetDefaultExportPath()_"SystemExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.System).Export(Filename)
}

/// Description
ClassMethod LDAPConfigs(Filename As %String = {..GetDefaultExportPath()_"LDAPConfigsExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.LDAPConfigs).Export(Filename)
}

ClassMethod KMIPServer(Filename As %String = {..GetDefaultExportPath()_"KMIPServerExport.xml"}) As %Status
{
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    Return ##class(Security.KMIPServer).Export(Filename)
}

ClassMethod DeleteExportDir(exportDir As %String = {..GetDefaultExportPath()}) As %Status
{
    Do ##class(%File).RemoveDirectoryTree(exportDir)
    Quit $$$OK
}

ClassMethod GetDefaultExportPath() As %String
{
    Set directory = ##class(%File).NormalizeDirectory($SYSTEM.Util.ManagerDirectory()_"tmp_export/")
    Do:'##class(%File).DirectoryExists(directory) ##class(%File).CreateDirectoryChain(directory)
    Return directory
}

/// Description
XData ExportAll [ MimeType = application/json ]
{
[
    {
        "ClassMethod" : "Roles",
        "Filename" : "{ExportDir}RolesExport.xml"
    },
    {
        "ClassMethod" : "Resources",
        "Filename" : "{ExportDir}ResourcesExport.xml"
    },
    {
        "ClassMethod" : "Users",
        "Filename" : "{ExportDir}UsersExport.xml"
    },
    {
        "ClassMethod" : "Applications",
        "Filename" : "{ExportDir}ApplicationsExport.xml"
    },
    {
        "ClassMethod" : "DocDBs",
        "Filename" : "{ExportDir}DocDBsExport.xml"
    },
    {
        "ClassMethod" : "Services",
        "Filename" : "{ExportDir}ServicesExport.xml"
    },
    {
        "ClassMethod" : "SSLConfigs",
        "Filename" : "{ExportDir}SSConfigsExport.xml"
    },
    {
        "ClassMethod" : "X509Users",
        "Filename" : "{ExportDir}X509UsersExport.xml"
    },
    {
        "ClassMethod" : "SQLPrivileges",
        "Filename" : "{ExportDir}SQLPrivilegesExport.xml"
    },
    {
        "ClassMethod" : "SQLAdminPrivilegeSet",
        "Filename" : "{ExportDir}SQLAdminPrivilegeSetExport.xml"
    },
    {
        "ClassMethod" : "SQLRoleGrantOption",
        "Filename" : "{ExportDir}SQLRoleGrantOptionExport.xml"
    },
    {
        "ClassMethod" : "System",
        "Filename" : "{ExportDir}SystemExport.xml"
    },
    {
        "ClassMethod" : "LDAPConfigs",
        "Filename" : "{ExportDir}LDAPConfigsExport.xml"
    },
    {
        "ClassMethod" : "KMIPServer",
        "Filename" : "{ExportDir}KMIPServerExport.xml"
    }
]
}

}
