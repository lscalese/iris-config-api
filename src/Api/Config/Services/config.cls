Include Api.Config.inc

Class Api.Config.Services.config [ ProcedureBlock ]
{

Parameter ISSINGLE = 1;

ClassMethod CheckModel(model As %Library.DynamicObject) As %Status
{
	Quit $$$OK
}

ClassMethod Get() As %Library.DynamicObject
{
	$$$switchNSSys
	$$$ThrowOnError(##class(Config.config).Get(.properties))
	Quit ..ToDynamic(.properties)
}

ClassMethod ObjectToArray(ByRef pObj, Output properties As %Binary)
{
	Set properties("BackoffDisabled") = pObj.BackoffDisabled
	Set properties("CPFFile") = pObj.CPFFile
	Set properties("Comments") = pObj.Comments
	Set properties("ConsoleFile") = pObj.ConsoleFile
	Set properties("Flags") = pObj.Flags
	Set properties("LargePagesDisabled") = pObj.LargePagesDisabled
	Set properties("LargePagesRequired") = pObj.LargePagesRequired
	Set properties("LibPath") = pObj.LibPath
	Set properties("LineRecallBuffer") = pObj.LineRecallBuffer
	Set properties("LineRecallEntries") = pObj.LineRecallEntries
	Set properties("LockSharedMemory") = pObj.LockSharedMemory
	Set properties("LockTextSegment") = pObj.LockTextSegment
	Set properties("MaxServerConn") = pObj.MaxServerConn
	Set properties("MaxServers") = pObj.MaxServers
	Set properties("Name") = pObj.Name
	Set properties("VMSConsoleTerminal") = pObj.VMSConsoleTerminal
	Set properties("ZFSize") = pObj.ZFSize
	Set properties("ZFString") = pObj.ZFString
	Set properties("bbsiz") = pObj.bbsiz
	Set properties("console") = pObj.console
	Set properties("errlog") = pObj.errlog
	Set properties("globals") = pObj.globals
	Set properties("globals16kb") = pObj.globals16kb
	Set properties("globals32kb") = pObj.globals32kb
	Set properties("globals4kb") = pObj.globals4kb
	Set properties("globals64kb") = pObj.globals64kb
	Set properties("globals8kb") = pObj.globals8kb
	Set properties("gmheap") = pObj.gmheap
	Set properties("history") = pObj.history
	Set properties("ijcbuff") = pObj.ijcbuff
	Set properties("ijcnum") = pObj.ijcnum
	Set properties("jrnbufs") = pObj.jrnbufs
	Set properties("locksiz") = pObj.locksiz
	Set properties("memlock") = pObj.memlock
	Set properties("netjob") = pObj.netjob
	Set properties("nlstab") = pObj.nlstab
	Set properties("overview") = pObj.overview
	Set properties("pijdir") = pObj.pijdir
	Set properties("routines") = pObj.routines
	Set properties("targwijsz") = pObj.targwijsz
	Set properties("udevtabsiz") = pObj.udevtabsiz
	Set properties("useresidentmem") = pObj.useresidentmem
	Set properties("wijdir") = pObj.wijdir
	Quit
}

ClassMethod ToArray(model As %Library.DynamicObject, Output properties As %Binary)
{
	Set:$$$CanSetProperty(model,"BackoffDisabled") properties("BackoffDisabled") = model.BackoffDisabled
	Set:$$$CanSetProperty(model,"CPFFile") properties("CPFFile") = model.CPFFile
	Set:$$$CanSetProperty(model,"Comments") properties("Comments") = model.Comments
	Set:$$$CanSetProperty(model,"ConsoleFile") properties("ConsoleFile") = model.ConsoleFile
	Set:$$$CanSetProperty(model,"Flags") properties("Flags") = model.Flags
	Set:$$$CanSetProperty(model,"LargePagesDisabled") properties("LargePagesDisabled") = model.LargePagesDisabled
	Set:$$$CanSetProperty(model,"LargePagesRequired") properties("LargePagesRequired") = model.LargePagesRequired
	Set:$$$CanSetProperty(model,"LibPath") properties("LibPath") = model.LibPath
	Set:$$$CanSetProperty(model,"LineRecallBuffer") properties("LineRecallBuffer") = model.LineRecallBuffer
	Set:$$$CanSetProperty(model,"LineRecallEntries") properties("LineRecallEntries") = model.LineRecallEntries
	Set:$$$CanSetProperty(model,"LockSharedMemory") properties("LockSharedMemory") = model.LockSharedMemory
	Set:$$$CanSetProperty(model,"LockTextSegment") properties("LockTextSegment") = model.LockTextSegment
	Set:$$$CanSetProperty(model,"MaxServerConn") properties("MaxServerConn") = model.MaxServerConn
	Set:$$$CanSetProperty(model,"MaxServers") properties("MaxServers") = model.MaxServers
	Set:$$$CanSetProperty(model,"Name") properties("Name") = model.Name
	Set:$$$CanSetProperty(model,"VMSConsoleTerminal") properties("VMSConsoleTerminal") = model.VMSConsoleTerminal
	Set:$$$CanSetProperty(model,"ZFSize") properties("ZFSize") = model.ZFSize
	Set:$$$CanSetProperty(model,"ZFString") properties("ZFString") = model.ZFString
	Set:$$$CanSetProperty(model,"bbsiz") properties("bbsiz") = model.bbsiz
	Set:$$$CanSetProperty(model,"errlog") properties("errlog") = model.errlog
	Set:$$$CanSetProperty(model,"globals16kb") properties("globals16kb") = model.globals16kb
	Set:$$$CanSetProperty(model,"globals32kb") properties("globals32kb") = model.globals32kb
	Set:$$$CanSetProperty(model,"globals4kb") properties("globals4kb") = model.globals4kb
	Set:$$$CanSetProperty(model,"globals64kb") properties("globals64kb") = model.globals64kb
	Set:$$$CanSetProperty(model,"globals8kb") properties("globals8kb") = model.globals8kb
	Set:$$$CanSetProperty(model,"gmheap") properties("gmheap") = model.gmheap
	Set:$$$CanSetProperty(model,"ijcbuff") properties("ijcbuff") = model.ijcbuff
	Set:$$$CanSetProperty(model,"ijcnum") properties("ijcnum") = model.ijcnum
	Set:$$$CanSetProperty(model,"jrnbufs") properties("jrnbufs") = model.jrnbufs
	Set:$$$CanSetProperty(model,"locksiz") properties("locksiz") = model.locksiz
	Set:$$$CanSetProperty(model,"netjob") properties("netjob") = model.netjob
	Set:$$$CanSetProperty(model,"nlstab") properties("nlstab") = model.nlstab
	Set:$$$CanSetProperty(model,"pijdir") properties("pijdir") = model.pijdir
	Set:$$$CanSetProperty(model,"routines") properties("routines") = model.routines
	Set:$$$CanSetProperty(model,"targwijsz") properties("targwijsz") = model.targwijsz
	Set:$$$CanSetProperty(model,"udevtabsiz") properties("udevtabsiz") = model.udevtabsiz
	Set:$$$CanSetProperty(model,"useresidentmem") properties("useresidentmem") = model.useresidentmem
	Set:$$$CanSetProperty(model,"wijdir") properties("wijdir") = model.wijdir
	Quit
}

ClassMethod ToDynamic(ByRef properties As %Binary) As %Library.DynamicObject
{
	Set model = {}
	Do:$Data(properties("BackoffDisabled")) model.%Set("BackoffDisabled", properties("BackoffDisabled"), "boolean")
	Do:$Data(properties("CPFFile")) model.%Set("CPFFile", properties("CPFFile"), "string")
	Do:$Data(properties("Comments")) model.%Set("Comments", properties("Comments"), "string")
	Do:$Data(properties("ConsoleFile")) model.%Set("ConsoleFile", properties("ConsoleFile"), "string")
	Do:$Data(properties("Flags")) model.%Set("Flags", properties("Flags"), "number")
	Do:$Data(properties("LargePagesDisabled")) model.%Set("LargePagesDisabled", properties("LargePagesDisabled"), "boolean")
	Do:$Data(properties("LargePagesRequired")) model.%Set("LargePagesRequired", properties("LargePagesRequired"), "boolean")
	Do:$Data(properties("LibPath")) model.%Set("LibPath", properties("LibPath"), "string")
	Do:$Data(properties("LineRecallBuffer")) model.%Set("LineRecallBuffer", properties("LineRecallBuffer"), "number")
	Do:$Data(properties("LineRecallEntries")) model.%Set("LineRecallEntries", properties("LineRecallEntries"), "number")
	Do:$Data(properties("LockSharedMemory")) model.%Set("LockSharedMemory", properties("LockSharedMemory"), "boolean")
	Do:$Data(properties("LockTextSegment")) model.%Set("LockTextSegment", properties("LockTextSegment"), "boolean")
	Do:$Data(properties("MaxServerConn")) model.%Set("MaxServerConn", properties("MaxServerConn"), "number")
	Do:$Data(properties("MaxServers")) model.%Set("MaxServers", properties("MaxServers"), "number")
	Do:$Data(properties("Name")) model.%Set("Name", properties("Name"), "string")
	Do:$Data(properties("VMSConsoleTerminal")) model.%Set("VMSConsoleTerminal", properties("VMSConsoleTerminal"), "string")
	Do:$Data(properties("ZFSize")) model.%Set("ZFSize", properties("ZFSize"), "number")
	Do:$Data(properties("ZFString")) model.%Set("ZFString", properties("ZFString"), "number")
	Do:$Data(properties("bbsiz")) model.%Set("bbsiz", properties("bbsiz"), "number")
	Do:$Data(properties("console")) model.%Set("console", properties("console"), "string")
	Do:$Data(properties("errlog")) model.%Set("errlog", properties("errlog"), "number")
	Do:$Data(properties("globals")) model.%Set("globals", properties("globals"), "string")
	Do:$Data(properties("globals16kb")) model.%Set("globals16kb", properties("globals16kb"), "number")
	Do:$Data(properties("globals32kb")) model.%Set("globals32kb", properties("globals32kb"), "number")
	Do:$Data(properties("globals4kb")) model.%Set("globals4kb", properties("globals4kb"), "number")
	Do:$Data(properties("globals64kb")) model.%Set("globals64kb", properties("globals64kb"), "number")
	Do:$Data(properties("globals8kb")) model.%Set("globals8kb", properties("globals8kb"), "number")
	Do:$Data(properties("gmheap")) model.%Set("gmheap", properties("gmheap"), "number")
	Do:$Data(properties("history")) model.%Set("history", properties("history"), "string")
	Do:$Data(properties("ijcbuff")) model.%Set("ijcbuff", properties("ijcbuff"), "number")
	Do:$Data(properties("ijcnum")) model.%Set("ijcnum", properties("ijcnum"), "number")
	Do:$Data(properties("jrnbufs")) model.%Set("jrnbufs", properties("jrnbufs"), "number")
	Do:$Data(properties("locksiz")) model.%Set("locksiz", properties("locksiz"), "number")
	Do:$Data(properties("memlock")) model.%Set("memlock", properties("memlock"), "number")
	Do:$Data(properties("netjob")) model.%Set("netjob", properties("netjob"), "boolean")
	Do:$Data(properties("nlstab")) model.%Set("nlstab", properties("nlstab"), "number")
	Do:$Data(properties("overview")) model.%Set("overview", properties("overview"), "string")
	Do:$Data(properties("pijdir")) model.%Set("pijdir", properties("pijdir"), "string")
	Do:$Data(properties("routines")) model.%Set("routines", properties("routines"), "string")
	Do:$Data(properties("targwijsz")) model.%Set("targwijsz", properties("targwijsz"), "number")
	Do:$Data(properties("udevtabsiz")) model.%Set("udevtabsiz", properties("udevtabsiz"), "number")
	Do:$Data(properties("useresidentmem")) model.%Set("useresidentmem", properties("useresidentmem"), "string")
	Do:$Data(properties("wijdir")) model.%Set("wijdir", properties("wijdir"), "string")
	Quit model
}

ClassMethod Update(model As %Library.DynamicObject) As %Status
{
	Do ..ToArray(model,.properties)
	$$$switchNSSys
	Quit ##class(Config.config).Modify(.properties)
}

}
