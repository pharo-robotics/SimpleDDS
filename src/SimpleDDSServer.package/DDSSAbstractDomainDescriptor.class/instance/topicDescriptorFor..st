as yet unclassified
topicDescriptorFor: aTopicName
	^ self topicDescriptorFor: aTopicName ifNone: [ self error: ' There is not topic named ' , aTopicName ]