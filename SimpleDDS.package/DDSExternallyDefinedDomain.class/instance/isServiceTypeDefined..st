as yet unclassified
isServiceTypeDefined: aServiceTypeName
	self serviceTypeDefinition: aServiceTypeName ifAbsent: [ ^ false ].
	^ true