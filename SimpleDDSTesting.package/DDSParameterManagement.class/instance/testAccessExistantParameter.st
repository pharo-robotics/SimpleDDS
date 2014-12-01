as yet unclassified
testAccessExistantParameter
	| parameter thereIsNoParameter |
	thereIsNoParameter := false.
	self createTestedParameterWithValue: false.
	parameter := self getParameterTestedParameterOr: [ thereIsNoParameter := true ].
	self deny: thereIsNoParameter.
	self assert: (parameter isKindOf: DDSBindedParameter)