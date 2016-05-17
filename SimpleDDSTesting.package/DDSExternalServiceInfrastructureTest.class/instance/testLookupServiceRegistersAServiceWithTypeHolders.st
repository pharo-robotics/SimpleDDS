as yet unclassified
testLookupServiceRegistersAServiceWithTypeHolders
	service := domain findOrRegisterServiceByName: '/service'.
	self assert: service type isTypePlaceHolder