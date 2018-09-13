as yet unclassified
forceReRegistrationOfSubscription: aSubscription for: aSubscriber 
	| mirror |
	mirror := self reflectParticipant: aSubscription participant.
	^ proxy registerTopicSubscriber: aSubscriber for: mirror in: domain.