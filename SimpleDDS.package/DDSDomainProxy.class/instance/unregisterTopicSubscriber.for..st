abstract
unregisterTopicSubscriber: aSubscriber for: aParticipantMirror
	^ proxy unregisterSubscriber: aParticipantMirror name from: aSubscriber topic name andCallerUri: (self uriFor: aParticipantMirror)