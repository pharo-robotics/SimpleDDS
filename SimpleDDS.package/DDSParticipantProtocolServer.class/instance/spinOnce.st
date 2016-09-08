run
spinOnce

	listener isValid
		ifFalse: [ listener destroy.
			process stop ].
	protocol acceptConnectionFrom: listener with: participant offersOfConnection.
	
	
