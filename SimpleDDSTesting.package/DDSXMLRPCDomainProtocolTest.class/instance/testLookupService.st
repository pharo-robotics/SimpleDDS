as yet unclassified
testLookupService
	proxy lookupService: 'serviceName' with: 'ID'.
	self assert: proxy calledMethod equals: 'lookupService'.
	self
		assert: proxy calledArguments
		equals:
			{'ID'.
			'serviceName'}