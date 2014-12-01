as yet unclassified
typeDefinition: aTypeName ifAbsent: aBlock
	^ registry
		at: aTypeName
		ifPresent: [ :val | self loadTypeDefinitionNamed: aTypeName definedFromString: val ]
		ifAbsent: aBlock