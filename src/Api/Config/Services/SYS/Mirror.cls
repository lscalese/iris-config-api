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

}
