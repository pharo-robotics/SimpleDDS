as yet unclassified
testGetPid
	proxy getPid:'aCallerID'.
	self assert: proxy calledMethod equals: #getPid.
	self assert: proxy calledArguments equals: {'aCallerID'}