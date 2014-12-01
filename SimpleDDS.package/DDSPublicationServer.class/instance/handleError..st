accessing
handleError: anError
	Transcript show: anError messageText.
	self halt: anError messageText