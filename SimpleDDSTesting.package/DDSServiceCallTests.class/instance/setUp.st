as yet unclassified
setUp
	super setUp.
	
	service := domain findOrRegisterServiceByName: '/service' type: #'service_type/Adhoc'.
	participant := self participant