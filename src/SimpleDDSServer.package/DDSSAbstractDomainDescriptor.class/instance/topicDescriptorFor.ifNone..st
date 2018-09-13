as yet unclassified
topicDescriptorFor: aTopicName ifNone: aBlock
	^ topics detect: [ :t | t name = aTopicName ] ifNone: aBlock