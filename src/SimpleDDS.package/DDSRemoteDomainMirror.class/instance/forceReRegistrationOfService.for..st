as yet unclassified
forceReRegistrationOfService: aService for: aServiceServer
	^ proxy
		registerServiceFor: aServiceServer participant name
		named: aService name
		at: (aServiceServer tcpUrl asZnUrl scheme: 'rosrpc') asString
		for: aServiceServer xmlrpcUrl asString