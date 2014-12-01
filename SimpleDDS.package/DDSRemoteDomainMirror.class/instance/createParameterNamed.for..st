parameters
createParameterNamed: aName for: aParticipant
	| parameter |
	parameter := proxy createParameterNamed: aName for: aParticipant.
	parameter domain: domain.
	parameters add: parameter.
	^ parameter