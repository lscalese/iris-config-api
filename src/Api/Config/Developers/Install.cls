/// Description
Class Api.Config.Developers.Install
{

ClassMethod installRESTApp() As %Status
{
    Set cfg = {
        "Security.Applications" : {
            "/api/config": {
                "NameSpace" : ($NAMESPACE),
                "Enabled" : 1,
                "DispatchClass" : "Api.Config.REST.disp",
                "CSPZENEnabled" : 1,
                "AutheEnabled": 32
            }
        }
    }

    Set sc = ##class(Api.Config.Services.Loader).Load(cfg)

    Quit sc
}

/// Description
ClassMethod SetSwaggerUIDefaultPath(specUrl As %String = "/api/config/", toReplace As %String = """http://localhost:52773/crud/_spec""") As %Status
{
    Quit:'##class(Api.Config.Services.Security.Applications).Exists("/swagger-ui") $$$ERROR(5001, "/swagger-ui web app does not exists")
    Set sc = $$$OK
    Set app = ##class(Api.Config.Services.Security.Applications).Get("/swagger-ui")
    Set dir = ##class(%File).NormalizeDirectory(app.Path)
    
    Set newValue = "(window.location.protocol+'//'+window.location.host+'"_specUrl_"')"
    Set file = ##class(%Stream.FileCharacter).%New()
    Do file.LinkToFile(dir_"index.html")
    Set buff = file.Read()
    Set buff = $REPLACE(buff, toReplace, newValue)
    Do file.Clear()
    Do file.Rewind()
    Do file.Write(buff)
    Quit file.%Save()
}

}
