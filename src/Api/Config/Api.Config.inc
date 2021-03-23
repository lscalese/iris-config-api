ROUTINE Api.Config.inc [Type=INC]

#Define SRVPKG              Api.Config.Services
/// HTTP Status Code

#Define HTTP200                     ##class(%CSP.REST).%GetParameter("HTTP200OK")
#Define HTTP201                     ##class(%CSP.REST).%GetParameter("HTTP201CREATED")
#Define HTTP204                     ##class(%CSP.REST).%GetParameter("HTTP204NOCONTENT")
#Define HTTP400                     ##class(%CSP.REST).%GetParameter("HTTP400BADREQUEST")
#Define HTTP404                     ##class(%CSP.REST).%GetParameter("HTTP404NOTFOUND")
#Define HTTP409                     ##class(%CSP.REST).%GetParameter("HTTP409CONFLICT")


/// OTHERS

#Define switchNSSys                             New $NAMESPACE  Set ns = $NAMESPACE, $NAMESPACE = "%SYS"
#Define restoreNS                               Set $NAMESPACE = ns
#Define CanSetProperty(%json,%property)         (%json.%IsDefined(%property)&&($Ascii(%json.%Get(%property))'=0))
#Define fillJSONFromArray(%array,%json)         Do ##class(dc.deploy.Utils).fillJSONFromArray(.%array,.%json)
#Define fillArrayFromJSON(%json,%array)         Do ##class(dc.deploy.Utils).fillArrayFromJSON(.%json,.%array)
