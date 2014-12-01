abstract
unregisterTopicSubscriber: aSubscriber for: aParticipantMirror
	| retrieved |
	retrieved := proxy
		unregisterSubscriber: aParticipantMirror name
		from: aSubscriber topic name
		andCallerUri: (self uriFor: aParticipantMirror)