/// Description
Class Api.Config.TempStream Extends %Persistent
{

Property created As %TimeStamp [ InitialExpression = {$zdatetime($HOROLOG,3,1)} ];

Property name As %String;

Property charStream As %Stream.GlobalCharacter;

Storage Default
{
<Data name="TempStreamDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>created</Value>
</Value>
<Value name="3">
<Value>name</Value>
</Value>
<Value name="4">
<Value>charStream</Value>
</Value>
</Data>
<DataLocation>^Api.Config.TempStreamD</DataLocation>
<DefaultData>TempStreamDefaultData</DefaultData>
<IdLocation>^Api.Config.TempStreamD</IdLocation>
<IndexLocation>^Api.Config.TempStreamI</IndexLocation>
<StreamLocation>^Api.Config.TempStreamS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
