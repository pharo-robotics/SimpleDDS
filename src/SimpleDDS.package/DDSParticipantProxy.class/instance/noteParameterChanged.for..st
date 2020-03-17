as yet unclassified
noteParameterChanged: aParameter for: aCallerID
	[ proxy from: aCallerID update: aParameter name with: aParameter value ]
		on: ConnectionTimedOut
		do: [ 
			self traceCr: 'Error informing parameter' ]