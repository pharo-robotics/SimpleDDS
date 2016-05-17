as yet unclassified
createServiceNamed: aServiceName type: aType
	^ createdServices
		at: aServiceName
		ifAbsentPut:
			[ DDSService domain: self name: aServiceName type: aType ]