as yet unclassified
createServiceNamed: aServiceName type: aDDSServiceType
	^ self createdServices
		at: aServiceName
		ifAbsentPut: [ DDSService domain: self name: aServiceName type: aDDSServiceType ]