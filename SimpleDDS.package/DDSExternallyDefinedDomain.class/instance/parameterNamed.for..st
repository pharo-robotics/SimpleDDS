as yet unclassified
parameterNamed: aParameterName for: aParticipant
	^ self parameterNamed: aParameterName for: aParticipant ifNone: [ self error: 'There is not parameter named ' , aParameterName ]