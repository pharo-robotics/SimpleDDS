parameters
parameterNamed: aName for: aMDDSDomainParticipant ifNone: aBlockClosure
	^ parameters
		detect: [ :p | p name = aName and: [ p participant = aMDDSDomainParticipant ] ]
		ifNone: [ 
			| parameter |
			parameter := proxy
				parameterNamed: aName
				for: (self reflectParticipant: aMDDSDomainParticipant)
				ifNone: [ ^ aBlockClosure value ].
			parameter domain: domain.
			parameters add: parameter.
			parameter ]