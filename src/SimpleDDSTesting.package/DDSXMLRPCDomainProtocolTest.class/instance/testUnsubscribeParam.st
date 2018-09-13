as yet unclassified
testUnsubscribeParam
	proxy unsubscribeParam: 'aCallerId' callingBack: 'anXMLRPCUrl' forParameter: 'aParameterName'.
	self assert: proxy calledMethod equals: #unsubscribeParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'anXMLRPCUrl'.
			'aParameterName'}