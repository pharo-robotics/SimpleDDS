as yet unclassified
testGetParameterGetsSameParameter
	| parameter thereIsNoParameter |
	self createTestedParameterWithValue: false.
	thereIsNoParameter := false.
	parameter := self getParameterTestedParameterOr: [ thereIsNoParameter := true ].
	self deny: thereIsNoParameter.
	self assert: (parameter == (self getParameterTestedParameterOr: [ thereIsNoParameter := true ])).
	self deny: thereIsNoParameter