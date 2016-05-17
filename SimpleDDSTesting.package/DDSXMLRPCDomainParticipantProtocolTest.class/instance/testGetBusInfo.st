as yet unclassified
testGetBusInfo
	proxy getBusInfo:'aCallerID'.
	self assert: proxy calledMethod equals: #getBusInfo.
	self assert: proxy calledArguments equals: {'aCallerID'}