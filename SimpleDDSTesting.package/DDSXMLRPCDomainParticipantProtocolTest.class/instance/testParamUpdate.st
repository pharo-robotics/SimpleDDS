as yet unclassified
testParamUpdate
	proxy from: 'aCallerID' update: 'aParameterName' with: 'aValue'.
	self assert: proxy calledMethod equals: #paramUpdate.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerID'.
			'aParameterName'.
			'aValue'}