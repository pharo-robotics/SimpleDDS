as yet unclassified
connectAndCloseFor: aDDSDomainParticipant for: aBlockClosure
	| connection |
	connection := self protocol
		connect:
			(DDSServiceConnectionPetition
				participant: aDDSDomainParticipant
				url: serverUrl
				service: service).
	connection setAsClientSideConnection.
	connection
		inputMarshaller: service type responseMarshaller;
		outputMarshaller: service type requestMarshaller.
	^ [ aBlockClosure value: connection ]
		ensure: [ connection destroy ]