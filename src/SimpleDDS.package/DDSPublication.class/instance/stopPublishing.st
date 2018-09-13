run
stopPublishing
	connectionOffer ifNotNil: [ participant unregisterConnectionOffer: connectionOffer ]