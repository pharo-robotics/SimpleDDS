type management
serviceTypeDefinition: aTypeName ifAbsent: aBlockClosure
	^ self typeLoader serviceTypeDefinition: aTypeName ifAbsent: aBlockClosure