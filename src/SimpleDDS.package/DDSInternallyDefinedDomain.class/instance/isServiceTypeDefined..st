testing
isServiceTypeDefined: aServiceTypeName
	self serviceTypeDefinition: aServiceTypeName ifAbsent: [ ^ false ].
	^ true