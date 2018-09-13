abstract
registerTopicPublisher: aPublisher for: aParticipantMirror in: aDomain
	proxy
		registerPublisher: aParticipantMirror name
		to: aPublisher topic name
		with: aPublisher topic type name
		andCallerUri: (self uriFor: aParticipantMirror)