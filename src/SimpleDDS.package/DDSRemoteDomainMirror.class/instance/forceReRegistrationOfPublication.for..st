as yet unclassified
forceReRegistrationOfPublication: aPublication for: aPublisher 
	| mirror |
	mirror := self reflectParticipant: aPublication participant.
	^ proxy registerTopicPublisher: aPublisher for: mirror in: domain.