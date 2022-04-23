Include Api.Config.inc

/// Description
Class Api.Config.Services.Security.Applications Extends Api.Config.Services.Common.Methods
{

Parameter SYSCLASS = "Security.Applications";

ClassMethod Create(model As %Library.DynamicObject) As %Status
{
    Set sc = ##super(model)
    Quit:$$$ISERR(sc) sc

    New $NAMESPACE
    Set $NAMESPACE = "%SYS"

    Set:model.WebServiceInfo ^SYS("Security","CSP","AllowClass",model.Name,"%SOAP.WebServiceInfo")=1
    Set:model.WebServiceInvoke ^SYS("Security","CSP","AllowClass",model.Name,"%SOAP.WebServiceInvoke")=1
    
    Quit sc
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Set sc = ##super(model)
    Quit:$$$ISERR(sc) sc
    
    New $NAMESPACE
    Set $NAMESPACE = "%SYS"
    
    Set:model.WebServiceInfo ^SYS("Security","CSP","AllowClass",model.Name,"%SOAP.WebServiceInfo")=1
    Set:model.WebServiceInvoke ^SYS("Security","CSP","AllowClass",model.Name,"%SOAP.WebServiceInvoke")=1
    
    Quit sc
}

}
