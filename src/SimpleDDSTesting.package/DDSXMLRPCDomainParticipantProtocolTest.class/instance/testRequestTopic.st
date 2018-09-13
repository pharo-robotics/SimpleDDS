as yet unclassified
testRequestTopic
	proxy requestFor: 'aCallerId' theTopic: 'aTopicName' withProtocol: {'aSetOfProtocols'}.
	self assert: proxy calledMethod equals: #requestTopic.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aTopicName'.
			{{'aSetOfProtocols'}}}