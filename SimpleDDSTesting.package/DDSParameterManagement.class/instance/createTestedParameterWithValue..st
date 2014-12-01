as yet unclassified
createTestedParameterWithValue: aValue
	^ (domain createParameterNamed: '/tested_parameter' for: participant) set: aValue.