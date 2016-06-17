as yet unclassified
unsubscribe: aParticipant
	subscribed remove: aParticipant ifAbsent: [ ^ self ].
	domain note: (MDDSTopicAnnouncement participant: aParticipant isNotSubscribedAnymoreTo: self with: self)