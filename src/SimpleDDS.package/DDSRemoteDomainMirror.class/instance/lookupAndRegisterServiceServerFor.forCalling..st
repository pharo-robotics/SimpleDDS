as yet unclassified
lookupAndRegisterServiceServerFor: aMDDSDomainParticipant forCalling: aDDSService
	| url |
	url := proxy
		lookupServiceServerFor: aMDDSDomainParticipant
		forCalling: aDDSService.
	url isNotEmpty
		ifTrue:
			[ 
			aDDSService
				registerServer: (DDSServiceRemoteServer on: url with: aDDSService at: domain) ]