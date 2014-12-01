as yet unclassified
topics
	self
		registerAll:
			((proxy getTopicTypes: self queryid)
				reject: [ :array | self isRegisteredTopic: (array at: 1) ]
				thenCollect: [ :array | MDDSTopicDescriptor name: (array at: 1) type: (MDDSTypeDescriptor named: (array at: 2)) ]).
	^ self registeredTopics