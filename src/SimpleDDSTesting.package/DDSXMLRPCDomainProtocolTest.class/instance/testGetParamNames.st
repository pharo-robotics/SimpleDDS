as yet unclassified
testGetParamNames
	proxy getParamNames: 'aCallerId'.
	self assert: proxy calledMethod equals: #getParamNames.
	self assert: proxy calledArguments equals: {'aCallerId'}