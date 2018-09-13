accessing
stop
	connectionOffer
		ifNotNil: [ participant unregisterConnectionOffer: connectionOffer.
			connectionOffer := nil.
			isRunning := false ]