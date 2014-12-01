as yet unclassified
testSetParameterChangesValue
	| parameter parameter2 thereIsNoParameter |
	thereIsNoParameter := false.
	self createTestedParameterWithValue: false.
	parameter := self getParameterTestedParameterOr: [ thereIsNoParameter := true ].
	self deny: thereIsNoParameter.
	self deny: parameter get.
	parameter set: true.
	self assert: parameter get.
	self removeParameterBindingNamed: parameter name.
	parameter2 := self getParameterTestedParameterOr: [ thereIsNoParameter := true ].
	self deny: thereIsNoParameter.
	self deny: parameter == parameter2.
	self assert: parameter2 get