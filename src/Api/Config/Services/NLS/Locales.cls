Class Api.Config.Services.NLS.Locales
{

Parameter CLASSMETHODMODE = 1;

Parameter SYSCLASS = "Config.NLS.Locales";

/// Description
ClassMethod Install(model As %DynamicObject) As %Status
{
    Set sc = $$$OK
    
    Set oldNs = $NAMESPACE

    New $NAMESPACE
    Set $NAMESPACE = "%SYS"

    Set locale = $Select($ISOBJECT(model): model.Locale, 1:model) ; allow a more simple config : {"NLS":{"Install":"fraw"}}

    If '##class(Config.NLS.Locales).IsLoadable(locale) {
        $$$QuitOnError(##class(Config.NLS.Locales).Compile(locale))
    }

    Set sc = ##class(Config.NLS.Locales).Install(locale)

    Set $NAMESPACE = oldNs
    Do ##class(Api.Config.Services.Loader).log($$$FormatText("   + Install locale %1 : %2", locale, $SYSTEM.Status.GetOneErrorText(sc)))

    Quit sc
}

}
