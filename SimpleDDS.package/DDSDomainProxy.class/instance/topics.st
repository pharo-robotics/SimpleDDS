abstract
topics
	| remoteTopics |
	[ remoteTopics := proxy getTopicTypes: self queryid ]
		on: ConnectionTimedOut
		do: [ remoteTopics := {} ].
	self
		registerAll:
			(remoteTopics
				reject: [ :array | self isRegisteredTopic: (array at: 1) ]
				thenCollect: [ :array | MDDSTopicDescriptor name: (array at: 1) type: (MDDSTypeDescriptor named: (array at: 2)) ]).
	^ self registeredTopics