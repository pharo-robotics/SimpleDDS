accessing
noteIsRegisteredIn: aPublisher
	connectionOffer := MDDSConnectionOffer
		publisher: aPublisher
		participant: participant
		onNewConnection: [ :connection | self register: connection ].
	participant registerConnectionOffer: connectionOffer