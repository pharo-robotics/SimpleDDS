accessing
value
	self isSuccess
		ifFalse: [ self error: self statusMessage ].
	^ elements last