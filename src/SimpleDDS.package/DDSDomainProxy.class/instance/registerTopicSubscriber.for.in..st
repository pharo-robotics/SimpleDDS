abstract
registerTopicSubscriber: aSubscriber for: aParticipantMirror in: aDomain
	| publishers |
	publishers := proxy
		registerSubscriber: aParticipantMirror name
		to: aSubscriber topic name
		with: aSubscriber topic type name
		andCallerUri: (self uriFor: aParticipantMirror).
	(self participantServerFor: aParticipantMirror) register: publishers for: aSubscriber