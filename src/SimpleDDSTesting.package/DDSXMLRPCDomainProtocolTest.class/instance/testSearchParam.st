as yet unclassified
testSearchParam
	proxy searchParam: 'aCallerId' forParameter: 'aParameterName'.
	self assert: proxy calledMethod equals: #searchParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aParameterName'}