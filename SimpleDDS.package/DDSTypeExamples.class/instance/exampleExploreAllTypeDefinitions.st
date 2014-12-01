as yet unclassified
exampleExploreAllTypeDefinitions
" self new exampleExploreAllTypeDefinitions "
	| typeDefinition position3D termometerMeasure |
	
	position3D := 
			MDDSTypeDefinition named: 'Position3D' defined: { 
					MDDSFieldDefinition name: #x type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #y type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #z type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
			}.	
	termometerMeasure := 
			MDDSTypeDefinition named: 'TermometerMeasure' defined: { 
					MDDSFieldDefinition name: #measure type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #position type: position3D
			}.
	typeDefinition :=
			MDDSTypeDefinition named: 'RoomTermometer' defined: { 
					MDDSFieldDefinition name: #stamp type: (MDDSBasicTypeDefinition for: MDDSTimeType new) .
					MDDSFieldDefinition name: #measures type: (
					MDDSCollectionTypeDefinition for: MDDSArrayType new storing: termometerMeasure)
			}.
	{typeDefinition . position3D  . termometerMeasure} explore.