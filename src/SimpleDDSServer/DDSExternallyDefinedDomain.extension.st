Extension { #name : #DDSExternallyDefinedDomain }

{ #category : #'*SimpleDDSServer-extentions' }
DDSExternallyDefinedDomain class >> onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer [
	^ self
		on:
			(DDSRemoteDomainMirror
				onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer)
]
