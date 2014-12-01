as yet unclassified
testForBugJustCreatedParameterHasBeenProperlyBinded
	| parameter parameter2 name |
	name := 'parameter' , UUID new asString.
	parameter := self createNewParameterNamed: name.
	parameter set: 'value'.
	parameter2 := self getParameterWithDifferentParticipantNamed: name.
	self assert: parameter2 get = parameter get.
	self assert: parameter2 get = 'value'.
	self deny: parameter2 = parameter.
	self deny: parameter2 participant = parameter participant.
	parameter2 set:'othervalue'.
	self assert: parameter2 get = parameter get.
	self assert: parameter2 get = 'othervalue'.
	parameter set:'anOtherValue'.
	self assert: parameter2 get = parameter get.
	self assert: parameter2 get = 'anOtherValue'.