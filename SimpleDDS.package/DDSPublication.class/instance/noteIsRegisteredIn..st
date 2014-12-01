accessing
noteIsRegisteredIn: aPublisher
	connectionOffer := MDDSConnectionOffer publisher: aPublisher participant: participant.
	self startPublishing