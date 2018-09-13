implemented
registerSubscriber: aCallerId to: aTopicName with: aTopicMessageType andCallerUri: anUri
	| topic participant |
	topic := domain topicDescriptorFor: aTopicName andType: aTopicMessageType.
	participant := domain participantDescriptorFor: aCallerId connectedAt: anUri.
	topic subscriber subscribe: participant.
	^ (topic publishers collect: #uri) asArray