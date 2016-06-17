exposition
unserve
	self isServing
		ifTrue: [ 
			XMLRPCService stop: port.
			serving := false ]