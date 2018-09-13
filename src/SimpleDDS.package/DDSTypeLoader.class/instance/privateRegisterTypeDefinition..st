private
privateRegisterTypeDefinition: aMDDSTypeDefinition
	registry at: aMDDSTypeDefinition name put: (self encodeTypeDefinition: aMDDSTypeDefinition).
	proxy informTypeRegistry: registry hasBeenModifiedAt: self.
	^ aMDDSTypeDefinition