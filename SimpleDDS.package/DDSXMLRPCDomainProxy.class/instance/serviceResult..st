private
serviceResult: aResult
	^ (aResult at: 1) = 1
		ifTrue: [ aResult at: 3 ]
		ifFalse: [ self error: (aResult at: 2) ]