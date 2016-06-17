as yet unclassified
getParameterWithDifferentParticipantNamed: aName
	^ domain parameterNamed: aName for: participant2 ifNone: [ self error:' unknown parameter ' , aName ].