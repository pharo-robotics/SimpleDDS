destroy
destroy
	process
		ifNotNil: [ 
			process cancel.
			process := nil ].
	domain := nil