accessing
destroy
	process
		ifNotNil: [ 
			process stop.
			process := nil ].
	domain := nil