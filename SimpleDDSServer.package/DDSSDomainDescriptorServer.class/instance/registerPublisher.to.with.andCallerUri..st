implemented
registerPublisher: aCallerId to: aTopicName with: aTopicMessageType andCallerUri: anUri
	| topic participant |
	topic := domain topicDescriptorFor: aTopicName andType: aTopicMessageType.
	participant := domain participantDescriptorFor: aCallerId connectedAt: anUri.
	topic publisher publishing: participant.
	^ (topic subscribed collect: #uri) asArray