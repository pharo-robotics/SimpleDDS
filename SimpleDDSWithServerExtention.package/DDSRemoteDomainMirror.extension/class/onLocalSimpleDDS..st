*SimpleDDSWithServerExtention
onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer
	^ self on:
		(DDSDomainProxy onProxy: aDDSDomainDescriptorXMLRPCServer)