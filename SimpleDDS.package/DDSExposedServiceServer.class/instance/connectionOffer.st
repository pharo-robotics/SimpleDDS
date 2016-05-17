accessing
connectionOffer
	^ connectionOffer
		ifNil:
			[ connectionOffer := DDSServiceConnectionOffer
				service: service
				participant: participant
				onNewConnection: [ :conn | self configureConnection: conn.
					self serveAndClose: conn ] ]