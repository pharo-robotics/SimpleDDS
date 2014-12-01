accessing
run
	[ keepRunning ]
		whileTrue: [ 
			[ 
			| connection |
			connection := nil.
			[ listener isValid and: [ connection isNil ] ]
				whileTrue: [ connection := protocol acceptConnectionFrom: listener with: self connectionOffer ].
			connection ifNotNil: [ onNewClient value: connection ] ]
				on: Error
				do: [ :err | 
					self handleError: err.
					listener isValid
						ifFalse: [ 
							self halt.
							listener destroy.
							keepRunning := false ] ] ]