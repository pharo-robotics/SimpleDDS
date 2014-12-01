as yet unclassified
unserve
	self isServing
		ifTrue: [ 
			XMLRPCService stop: port.
			serving := false ]