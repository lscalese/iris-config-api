Class Api.Config.Services.SYS.Mirror
{

Parameter SYSCLASS = "SYS.Mirror";

Parameter CLASSMETHODMODE = 1;

ClassMethod AddDatabase(model As %DynamicObject) As %Status
{
    Set sc = $$$OK
    Set oldNs = $NAMESPACE

    New $NAMESPACE
    Set $NAMESPACE = "%SYS"


    Set iter = model.%GetIterator()

    While iter.%GetNext(.directory, .db ) {
        Set $NAMESPACE = "%SYS"
        Set sc2 = ##class(SYS.Mirror).AddDatabase(directory, db.MirrorDBName)
        Set sc = $$$ADDSC(sc, sc2)
        Set $NAMESPACE = oldNs
        Do ##class(Api.Config.Services.Loader).log($$$FormatText("   + Add database %1 :: %2 , status : %3", directory, db.MirrorDBName, $SYSTEM.Status.GetOneErrorText(sc2)))
    }

    Quit sc
}

ClassMethod ActivateMirroredDatabase(model As %DynamicObject) As %Status
{
    Set sc = $$$OK
    Set oldNs = $NAMESPACE

    New $NAMESPACE
    Set $NAMESPACE = "%SYS"


    Set iter = model.%GetIterator()

    While iter.%GetNext(.directory, .v ) {
        Set $NAMESPACE = "%SYS"
        Set db=##Class(SYS.Database).%OpenId(directory)
        
        If '$ISOBJECT(db) {
            Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log($$$FormatText("   ! Database %1 does not exist.", directory))
            Set sc = $$$ADDSC(sc, $$$ERROR(5001, $$$FormatText("Database %1 does not exist."), directory))
            Continue

        } ElseIf 'db.Mirrored {    
            Set sc2 = ##class(SYS.Mirror).ActivateMirroredDatabase(directory)
            Set sc = $$$ADDSC(sc, sc2)
            Set $NAMESPACE = oldNs
            Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log($$$FormatText("   + Activate Mirrored Database %1 : %2", directory, $SYSTEM.Status.GetOneErrorText(sc2)))
        } Else {
            Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log($$$FormatText("   - Database %1 already in the mirror (skipping)", directory))
        }
        
        Set sfn = +$zu(49, directory)
        Set $NAMESPACE = "%SYS"
        set sc2 = ##class(SYS.Mirror).CatchupDB($lb(sfn))
        Set sc = $$$ADDSC(sc, sc2)
        Set $NAMESPACE = oldNs
        
        Do:$g(%zverbose,1) ##class(Api.Config.Services.Loader).log($$$FormatText("   + Catch up database %1 (sfn's %2) : %3",directory, sfn, $SYSTEM.Status.GetOneErrorText(sc2)))
    }

    Quit sc
}

}
