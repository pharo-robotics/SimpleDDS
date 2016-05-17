abstract
unregisterTopicPublisher: aPublisher for: aParticipantMirror
	^ proxy unregisterPublisher: aParticipantMirror name from: aPublisher topic name andCallerUri: (self uriFor: aParticipantMirror)