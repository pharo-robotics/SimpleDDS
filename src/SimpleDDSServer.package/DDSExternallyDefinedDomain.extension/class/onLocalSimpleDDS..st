*SimpleDDSServer-extentions
onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer
	^ self
		on:
			(DDSRemoteDomainMirror
				onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer)