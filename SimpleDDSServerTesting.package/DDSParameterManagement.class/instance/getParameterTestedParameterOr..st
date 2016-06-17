as yet unclassified
getParameterTestedParameterOr: aBlock
	^ self getParameterNamed: '/tested_parameter' or: aBlock 