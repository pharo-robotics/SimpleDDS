as yet unclassified
topicDescriptorFor: aTopicName andType: aTopicMessageType
	^ self
		topicDescriptorFor: aTopicName
		ifNone: [ 
			| type topic |
			type := MDDSTypeDescriptor domain: self name: aTopicMessageType.
			topic := DDSSServerSideTopic domain: self name: aTopicName type: type.
			topics add: topic.
			topic ]