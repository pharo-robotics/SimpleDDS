private
termometerTypeDefinition
	^ (MDDSTypeDefinition named: 'TermometerMeasure' defined: { 
				MDDSFieldDefinition name: #measure type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				MDDSFieldDefinition name: #position type: (MDDSTypeDefinition named: 'Position3D' defined: { 
					MDDSFieldDefinition name: #x type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #y type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #z type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				})
			}).