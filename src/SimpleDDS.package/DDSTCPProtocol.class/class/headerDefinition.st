as yet unclassified
headerDefinition
	^ headerDefinition ifNil: [ headerDefinition := MDDSBasicTypeDefinition for: (MDDSHeaderType new).]