as yet unclassified
testSetParam
	proxy setParam: 'aCallerId' named: 'aParameterName' with: 'value'.
	self assert: proxy calledMethod equals: #setParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aParameterName'.
			'value'}