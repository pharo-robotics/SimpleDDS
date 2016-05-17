as yet unclassified
testLookupNode
	proxy lookupNode: 'nodeName' with: 'ID'.
	self assert: proxy calledMethod equals: #lookupNode.
	self
		assert: proxy calledArguments
		equals:
			{'ID'.
			'nodeName'}