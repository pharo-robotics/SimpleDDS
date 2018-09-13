run
spinOnce
	listener isValid
		ifFalse: [ listener destroy.
			process kill ].
	protocol acceptConnectionFrom: listener with: participant offersOfConnection