as yet unclassified
forceReconnect: aParticipant of: aSubscriber to: anUrl
	| mirror |
	mirror := self reflectParticipant: aParticipant.
	^ (proxy participantServerFor: mirror) register: {anUrl} for: aSubscriber