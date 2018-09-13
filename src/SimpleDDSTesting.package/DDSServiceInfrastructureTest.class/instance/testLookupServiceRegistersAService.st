as yet unclassified
testLookupServiceRegistersAService
	service := domain findOrRegisterServiceByName: '/service'.
	self assert: (domain findServiceByName: '/service') equals: service