run
spinOnce
	
	Stdio stdout << ' once - valid? ' << listener isValid asString << ' ' ; crlf.
	
	
	listener isValid
		ifFalse: [ listener destroy.
			process kill ].
	protocol acceptConnectionFrom: listener with: participant offersOfConnection.
	
	
