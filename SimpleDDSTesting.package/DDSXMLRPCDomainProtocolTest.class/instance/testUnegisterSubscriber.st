as yet unclassified
testUnegisterSubscriber
	proxy unregisterSubscriber: 'aCallerId' from: 'aTopicName' andCallerUri: 'anUri'.
	self assert: proxy calledMethod equals: #unregisterSubscriber.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aTopicName'.
			'anUri'}