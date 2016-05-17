as yet unclassified
testDeleteParam
	proxy deleteParam: 'aCallerId' named: 'aParameterName'.
	self assert: proxy calledMethod equals: #deleteParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aParameterName'}