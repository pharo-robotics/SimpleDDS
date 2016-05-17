as yet unclassified
serviceTypeDefinition: aTypeName ifAbsent: aBlockClosure
	^ typesRegistry
		at: aTypeName
		ifAbsentPut: [ proxy serviceTypeDefinition: aTypeName ifAbsent: aBlockClosure ]