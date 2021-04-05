/// Dev helper to generate template UnitTests classes for services.
Class Api.Config.Developers.UnitTestsClassGen
{

Parameter PACKAGE = "UnitTests.Api.Config.Services.";

ClassMethod Gen(className As %String, Output unitTestClass As %String) As %Status
{
    ; zw ##class(Api.Config.Developers.UnitTestsClassGen).Gen("Api.Config.Services.Namespaces",.o)
    #define METHODEXISTS(%method)       ##class(%Dictionary.CompiledMethod).%ExistsId(className_"||"_%method)
    
    Set unitTestClass = ..#PACKAGE _ $PIECE(className,"Config.Services.",2)

    #dim class As %Dictionary.ClassDefinition = ##class(%Dictionary.ClassDefinition).%New()
    Set class.Name = unitTestClass
    Set class.ProcedureBlock = $$$YES
    Set class.Super = "%UnitTest.TestCase"

    If $$$METHODEXISTS("Get") {
        Do class.Methods.Insert(..GetMethod(className))
    }

    If $$$METHODEXISTS("Update") {
        Do class.Methods.Insert(..UpdateMethod(className))
    }

    If $$$METHODEXISTS("Create") {
        Do class.Methods.Insert(..CreateMethod(className))
    }

    If $$$METHODEXISTS("List") {
        Do class.Methods.Insert(..ListMethod(className))
    }



    Quit class.%Save()
}

ClassMethod ListMethod(className As %String) As %Dictionary.MethodDefinition
{
    #dim method As %Dictionary.MethodDefinition = ##class(%Dictionary.MethodDefinition).%New()
    Set method.Name = "TestList"
    Set method.ReturnType = "%Status"

    Do method.Implementation.WriteLine($CHAR(9)_"Set sc = $$$OK")

    Set listLine = "Set list = ##class(%1).List(%2)"

    If $PARAMETER(className,"ISMAP") {
        Set arg = $PIECE($PARAMETER(className,"PIDENTIFIER"),",",1)
        Do method.Implementation.WriteLine($CHAR(9) _ "Set "_ arg _" = """"" )
        Set listLine = $$$FormatText(listLine, className, arg)

    } Else {
        Set listLine = $$$FormatText(listLine, className, "")
    }

    Do method.Implementation.WriteLine($CHAR(9)_ listLine)
    
    
    
    Do method.Implementation.WriteLine($CHAR(9)_"Quit sc")

    Quit method
}

ClassMethod CreateMethod(className As %String) As %Dictionary.MethodDefinition
{
    #dim method As %Dictionary.MethodDefinition = ##class(%Dictionary.MethodDefinition).%New()
    Set method.Name = "TestCreateAndDelete"
    Set method.ReturnType = "%Status"

    Do method.Implementation.WriteLine($CHAR(9)_"Set sc = $$$OK")

    Do method.Implementation.WriteLine($CHAR(9)_"Set model = {}")

    Do method.Implementation.WriteLine($CHAR(9)_ $Replace("Set sc = ##class(%1).Create(model)", "%1",className))

    Do method.Implementation.WriteLine($CHAR(9)_ "Do $$$AssertStatusOK(sc,""Create status"")")

    Set delLine = $Replace("Set sc = ##class(%1).Delete(%2)","%1",className)

    If $PARAMETER(className,"ISMAP") {
        Set args = $PARAMETER(className,"PIDENTIFIER")
        For i=1:1:$LENGTH(args,",") {
            Do method.Implementation.WriteLine($CHAR(9) _ "Set "_$Piece(args,",",i) _" = """"" )
        }
        Set delLine = $$$FormatText(delLine, className, args)

    } Else {
        Set pName = $PARAMETER(className,"PNAME")
        Set:pName="" pName="Name"
        Do method.Implementation.WriteLine($CHAR(9) _ "Set "_pName _" = """"" )
        Set delLine = $$$FormatText(delLine, className, pName)
    }

    Do method.Implementation.WriteLine($CHAR(9)_ delLine)
    Do method.Implementation.WriteLine($CHAR(9)_ "Do $$$AssertStatusOK(sc,""Delete created ressource"")")
    
    
    Do method.Implementation.WriteLine($CHAR(9)_"Quit sc")

    Quit method
}

ClassMethod UpdateMethod(className As %String) As %Dictionary.MethodDefinition
{
    #dim method As %Dictionary.MethodDefinition = ##class(%Dictionary.MethodDefinition).%New()
    Set method.Name = "TestUpdate"
    Set method.ReturnType = "%Status"

    Do method.Implementation.WriteLine($CHAR(9)_"Set sc = $$$OK")

    Do method.Implementation.WriteLine($CHAR(9)_"Set model = {}")

    Do method.Implementation.WriteLine($CHAR(9)_ $Replace("Set sc = ##class(%1).Update(model)", "%1",className))

    Do method.Implementation.WriteLine($CHAR(9)_ "Do $$$AssertStatusOK(sc)")

    Do method.Implementation.WriteLine($CHAR(9)_"Quit sc")

    Quit method
}

ClassMethod GetMethod(className As %String) As %Dictionary.MethodDefinition
{
    #dim method As %Dictionary.MethodDefinition = ##class(%Dictionary.MethodDefinition).%New()
    Set method.Name = "TestGet"
    Set method.ReturnType = "%Status"

    Do method.Implementation.WriteLine($CHAR(9)_"Set sc = $$$OK")

    Set getLine = $CHAR(9) _ "Set model = ##class(%1).Get(%2)"

    If $PARAMETER(className,"ISSINGLE") {
        Set getLine = $$$FormatText(getLine, className, "")

    } ElseIf $PARAMETER(className,"ISMAP") {

        Set args = $PARAMETER(className,"PIDENTIFIER")
        For i=1:1:$LENGTH(args,",") {
            Do method.Implementation.WriteLine($CHAR(9) _ "Set "_$Piece(args,",",i) _" = """"" )
        }
        Set getLine = $$$FormatText(getLine, className, args)

    } Else {

        Set pName = $PARAMETER(className,"PNAME")
        Set:pName="" pName="Name"
        Do method.Implementation.WriteLine($CHAR(9) _ "Set "_pName _" = """"" )

        Set getLine = $$$FormatText(getLine, className, pName)
        
    }

    
    
    Do method.Implementation.WriteLine(getLine)
    For i=1:1:3 {
        Do method.Implementation.WriteLine($CHAR(9) _ "Set expected = """"")
        Do method.Implementation.WriteLine($CHAR(9) _ "Do $$$AssertTrue(model.%IsDefined(expected),$replace(""Check if property %1 is defined"",""%1"",expected))")
    }
    Do method.Implementation.WriteLine($CHAR(9)_"Quit sc")

    Quit method
}

}
