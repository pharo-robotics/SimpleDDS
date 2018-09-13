accessing
removeParameterBindingNamed: aName for: aMDDSDomainParticipant
	parameters
		detect: [ :p | p name = aName and: [ p participant = aMDDSDomainParticipant ] ]
		ifFound: [ :p | parameters remove: p ]