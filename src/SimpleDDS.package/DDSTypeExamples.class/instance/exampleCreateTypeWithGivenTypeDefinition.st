as yet unclassified
exampleCreateTypeWithGivenTypeDefinition
" self new exampleCreateTypeWithGivenTypeDefinition "
	| typeDefinition domain type |
	domain := MDDSInternallyDefinedDomain new. " For different domains and how to build them, address the domain examples " 
	typeDefinition := MDDSTypeDefinition named: 'RoomTermometer' defined: { 
		MDDSFieldDefinition name: #stamp type: (MDDSBasicTypeDefinition for: MDDSTimeType new) .
		MDDSFieldDefinition name: #measures type: (
			MDDSCollectionTypeDefinition for: MDDSArrayType new storing: 
			(MDDSTypeDefinition named: 'TermometerMeasure' defined: { 
				MDDSFieldDefinition name: #measure type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				MDDSFieldDefinition name: #position type: (MDDSTypeDefinition named: 'Position3D' defined: { 
					MDDSFieldDefinition name: #x type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #y type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #z type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				})
			}))
	}.

	type := domain createTypeNamed: 'RoomTemperature' definedBy: typeDefinition.
	type explore.