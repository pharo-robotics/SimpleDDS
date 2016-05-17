as yet unclassified
testGetTopicTypes
	proxy getTopicTypes: 'aCallerId'.
	self assert: proxy calledMethod equals: #getTopicTypes.
	self assert: proxy calledArguments equals: {'aCallerId'}
