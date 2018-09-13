synchronization
synchronizeLocalServiceServersWith: serviceSet
	" Check if the services locally declared for serve are declared in the Master"

	domain createdServices
		select: [ :service | (serviceSet contains: [ :tuple | (tuple at: 1) = service name ]) not and: [ service hasLocalServers ] ]
		thenDo: [ :service | self ensureServiceIsRegistered: service ]