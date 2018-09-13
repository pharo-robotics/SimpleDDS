*SimpleDDSWithServerExtention
onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer
	^ self
		on:
			(DDSRemoteDomainMirror
				onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer)