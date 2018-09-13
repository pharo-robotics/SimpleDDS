as yet unclassified
testLookupUnexistantServiceExplodes
	self should: [ service := domain findServiceByName: '/service' ] raise: MDDSError