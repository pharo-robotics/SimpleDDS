as yet unclassified
participant: aDDSDomainParticipant url: anUrl service: aService
	^ self new
		url: anUrl asZnUrl;
		service: aService;
		participant: aDDSDomainParticipant;
		yourself