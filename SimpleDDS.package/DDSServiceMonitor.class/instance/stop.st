accessing
stop
	process
		ifNotNil: [ 
			process stop.
			process := nil ]