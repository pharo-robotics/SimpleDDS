as yet unclassified
testRegisterPublisher
	proxy
		registerPublisher: 'aCallerId'
		to: 'aTopicName'
		with: 'aTopicMessageType'
		andCallerUri: 'anUri'.
	self assert: proxy calledMethod equals: #registerPublisher.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aTopicName'.
			'aTopicMessageType'.
			'anUri'}