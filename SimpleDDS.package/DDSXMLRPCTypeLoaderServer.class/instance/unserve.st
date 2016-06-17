exposition
unserve
	serving
		ifTrue: [ 
			XMLRPCService stop: port.
			serving := false ]