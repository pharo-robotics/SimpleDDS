run
handleError: anError
	(anError isKindOf: OutOfMemory)
		ifFalse: [ self error: anError messageText ]