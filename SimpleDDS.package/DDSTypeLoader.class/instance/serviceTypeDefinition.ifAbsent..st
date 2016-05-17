as yet unclassified
serviceTypeDefinition: aTypeName ifAbsent: aBlock 
	^ registry
		at: aTypeName
		ifPresent: [ :val | self loadTypeDefinitionNamed: aTypeName definedFromString: val ]
		ifAbsent: aBlock