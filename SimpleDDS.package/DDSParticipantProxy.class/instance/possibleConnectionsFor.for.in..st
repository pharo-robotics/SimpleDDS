as yet unclassified
possibleConnectionsFor: aSubscriber for: aParticipantMirror in: aDomain
	| retrieve |
	retrieve := proxy
		requestFor: aDomain name
		theTopic: aSubscriber topic name
		withProtocol: (aParticipantMirror protocols collect: #name).
	^ MDDSConnectionPetition
		protocolName: (retrieve at: 1)
		ip: (retrieve at: 2)
		port: (retrieve at: 3)
		subscriber: aSubscriber
		participant: aParticipantMirror