as yet unclassified
testRegisterSubscriber
	proxy
		registerSubscriber: 'aCallerId'
		to: 'aTopicName'
		with: 'aTopicMessageType'
		andCallerUri: 'anUri'.
	self assert: proxy calledMethod equals: #registerSubscriber.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aTopicName'.
			'aTopicMessageType'.
			'anUri'}