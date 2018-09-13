as yet unclassified
testDictionaryValue
	| parameter thereIsNoParameter |
	thereIsNoParameter := false.
	self createTestedParameterWithValue: false.
	parameter := self getParameterTestedParameterOr: [ thereIsNoParameter := true ].

	parameter set: Dictionary new. 
	parameter transform: [ : val | val at: 'lalaas' put: 'blas'. val ].
	self assert: (parameter get at: 'lalaas')= 'blas'