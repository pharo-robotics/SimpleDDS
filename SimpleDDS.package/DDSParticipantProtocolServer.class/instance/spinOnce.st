run
spinOnce
	| connection |
	[ 
	connection := nil.
	[ listener isValid and: [ connection isNil ] ]
		whileTrue:
			[ connection := protocol acceptConnectionFrom: listener with: participant offersOfConnection ] ]
		on: Error
		do:
			[ :err | 
			self handleError: err.
			listener isValid
				ifFalse:
					[ 
					self logCr: 'Closing socket-listener publication server'.
					listener destroy.
					self destroy ] ]