abstract
unregisterTopicPublisher: aPublisher for: aParticipantMirror
	| retrieved |
	retrieved := proxy
		unregisterPublisher: aParticipantMirror name
		from: aPublisher topic name
		andCallerUri: (self uriFor: aParticipantMirror)