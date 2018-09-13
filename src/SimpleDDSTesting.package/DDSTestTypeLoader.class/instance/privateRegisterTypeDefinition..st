as yet unclassified
privateRegisterTypeDefinition: aMDDSTypeDefinition
	registry at: aMDDSTypeDefinition name put: (self encodeTypeDefinition: aMDDSTypeDefinition).
	^ aMDDSTypeDefinition