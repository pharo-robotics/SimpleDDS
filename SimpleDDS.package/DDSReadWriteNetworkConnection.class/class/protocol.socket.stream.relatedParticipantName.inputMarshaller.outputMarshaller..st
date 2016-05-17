as yet unclassified
protocol: aProtocol socket: aSocket stream: aStream relatedParticipantName: aRelatedParticipantName inputMarshaller: aMarshaller outputMarshaller: anOtherMarshaller
	^ self new
		protocol: aProtocol;
		socket: aSocket;
		stream: aStream;
		participantName: aRelatedParticipantName;
		inputMarshaller: aMarshaller;
		outputMarshaller: anOtherMarshaller;
		yourself