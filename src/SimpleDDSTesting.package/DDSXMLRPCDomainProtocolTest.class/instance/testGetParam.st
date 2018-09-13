as yet unclassified
testGetParam
	proxy getParam: 'aCallerId' named: 'aParameterName'.
	self assert: proxy calledMethod equals: #getParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aParameterName'}