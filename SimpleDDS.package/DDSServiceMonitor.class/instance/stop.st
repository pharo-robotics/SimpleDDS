run
stop
	process
		ifNotNil: [ 
			process cancel.
			process := nil ]