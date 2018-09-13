as yet unclassified
testShutdown
	proxy shutdown: 'aCallerID' cause: 'aCause'.
	self assert: proxy calledMethod equals: #shutdown.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerID'.
			'aCause'}