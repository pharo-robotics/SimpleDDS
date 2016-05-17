as yet unclassified
evaluate: aRequest for: aDDSDomainParticipant
	^ self
		connectAndCloseFor: aDDSDomainParticipant
		for: [ :rwconn | 
			rwconn write: aRequest.
			rwconn read ]