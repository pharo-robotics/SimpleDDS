*SimpleDDSServer-extentions
onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer
	^ self on:
		(DDSDomainProxy onProxy: aDDSDomainDescriptorXMLRPCServer)