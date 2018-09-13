as yet unclassified
testUnegisterPublisher
	proxy unregisterPublisher: 'aCallerId' from: 'aTopicName' andCallerUri: 'anUri'.
	self assert: proxy calledMethod equals: #unregisterPublisher.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aTopicName'.
			'anUri'}