as yet unclassified
testSubscribeParam
	proxy subscribeParam: 'aCallerId' callingBack: 'anXMLRPCUrl' forParameter: 'aParameterName'.
	self assert: proxy calledMethod equals: #subscribeParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'anXMLRPCUrl'.
			'aParameterName'}