as yet unclassified
createConnectionFor: aProtocol on: aSocket and: aStream for: aParticipantName
	^ self
		noteNewConnection:
			(DDSReadWriteNetworkConnection
				protocol: aProtocol
				socket: aSocket
				stream: aStream
				relatedParticipantName: aParticipantName)