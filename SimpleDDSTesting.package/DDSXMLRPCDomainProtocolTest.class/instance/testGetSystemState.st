as yet unclassified
testGetSystemState
	proxy getSystemState: 'aCallerId'.
	self assert: proxy calledMethod equals: #getSystemState.
	self assert: proxy calledArguments equals: {'aCallerId'}
	
	