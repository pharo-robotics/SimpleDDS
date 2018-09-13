as yet unclassified
testLookupServiceRegistersWithTypeAServiceIsTyped
	service := domain
		findOrRegisterServiceByName: '/service'
		type: #'service_type/Adhoc'.
	self deny: service type isTypePlaceHolder