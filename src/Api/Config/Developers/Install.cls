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

}
