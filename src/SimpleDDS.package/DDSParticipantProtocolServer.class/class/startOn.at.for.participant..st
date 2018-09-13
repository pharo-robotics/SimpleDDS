constructor
startOn: anIP at: aPort for: aProtocol participant: aParticipant
	^ self new
		ip: anIP;
		port: aPort;
		protocol: aProtocol;
		participant: aParticipant;
		start;
		yourself