as yet unclassified
createServiceServerFor: aMDDSDomainParticipant serving: aValuable for: aDDSService
	^ aDDSService hasServers
		ifTrue:
			[ 
			aDDSService server participant = aMDDSDomainParticipant
				ifTrue: [ aDDSService server valuable: aValuable ]
				ifFalse: [ self error: ' Multi servers is not yet allowed' ] ]
		ifFalse:
			[ 
			| server |
			server := (DDSExposedServiceServer
				for: aMDDSDomainParticipant
				serving: aValuable
				for: aDDSService)
				start;
				yourself.
			self
				registerServiceFor: aMDDSDomainParticipant name
				named: aDDSService name
				at: (server tcpUrl asZnUrl scheme: 'rosrpc') asString
				for: server xmlrpcUrl asString.
			server ]