as yet unclassified
createServiceCallerFor: aMDDSDomainParticipant forCalling: aDDSService
	aDDSService hasServers
		ifFalse: [ self lookupAndRegisterServiceServerFor: aMDDSDomainParticipant forCalling: aDDSService ].
	^ DDSServiceCaller for: aMDDSDomainParticipant on: aDDSService