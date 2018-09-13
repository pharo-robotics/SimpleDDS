as yet unclassified
testRegisterService
	proxy
		registerServiceFor: 'ID'
		named: 'serviceName'
		at: 'aROSRPCUrl'
		for: 'aXMLRPCUrl'.
	self assert: proxy calledMethod equals: 'registerService'.
	self
		assert: proxy calledArguments
		equals: {'ID'. 'serviceName'. 'aROSRPCUrl'. 'aXMLRPCUrl'. }