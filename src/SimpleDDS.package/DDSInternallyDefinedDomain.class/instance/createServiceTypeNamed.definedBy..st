as yet unclassified
createServiceTypeNamed: aName definedBy: aDDSServiceTypeDefinition
	^ DDSServiceType
		domain: self
		name: aName
		responseMarshaller:
			aDDSServiceTypeDefinition response typeBuilder buildTypeMarshaller
		requestMarshaller:
			aDDSServiceTypeDefinition request typeBuilder buildTypeMarshaller
		md5sum: aDDSServiceTypeDefinition md5sum