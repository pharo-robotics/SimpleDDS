as yet unclassified
unserve
	serving
		ifTrue: [ 
			XMLRPCService stop: port.
			serving := false ]