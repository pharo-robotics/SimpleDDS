as yet unclassified
configureHeader: aMDDSHandshakeHeader
	aMDDSHandshakeHeader
		callerId: self participant name;
		latching: self latching;
		service: service name;
		type: service type name;
		requestType:  service type name, 'Request';
		responseType:  service type name, 'Response';
		md5sum: service type md5sum;
		message_definition: service type plainDefinition