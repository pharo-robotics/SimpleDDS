as yet unclassified
testInformPublishers
	proxy informFrom: 'aCallerID' for: 'aTopicName' publishers: {'anArrayOfPublishers'}.
	self assert: proxy calledMethod equals: #publisherUpdate.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerID'.
			'aTopicName'.
			{'anArrayOfPublishers'}}