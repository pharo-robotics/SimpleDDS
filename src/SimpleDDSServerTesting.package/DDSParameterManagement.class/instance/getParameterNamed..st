as yet unclassified
getParameterNamed: aName 
	^self getParameterNamed: aName or: [ self error: 'Parameter not found']