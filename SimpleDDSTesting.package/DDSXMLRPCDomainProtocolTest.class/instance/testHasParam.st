as yet unclassified
testHasParam
	proxy hasParam: 'aCallerId' named: 'aParameterName'.
	self assert: proxy calledMethod equals: #hasParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aParameterName'}