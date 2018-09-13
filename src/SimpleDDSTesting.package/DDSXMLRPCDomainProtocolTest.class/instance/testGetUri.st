as yet unclassified
testGetUri
	proxy getUri: 'aCallerId'.
	self assert: proxy calledMethod equals: #getUri.
	self assert: proxy calledArguments equals: {'aCallerId'}
