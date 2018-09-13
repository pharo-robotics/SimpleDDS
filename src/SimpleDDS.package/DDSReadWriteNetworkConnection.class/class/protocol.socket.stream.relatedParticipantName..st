as yet unclassified
protocol: aProtocol socket: aSocket stream: aStream relatedParticipantName: aRelatedParticipantName
	^ self new
		protocol: aProtocol;
		socket: aSocket;
		stream: aStream;
		participantName: aRelatedParticipantName;
		yourself