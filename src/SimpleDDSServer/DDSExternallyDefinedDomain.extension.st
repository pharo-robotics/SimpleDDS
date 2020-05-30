Extension { #name : #DDSExternallyDefinedDomain }

{ #category : #'*SimpleDDSServer-extentions' }
DDSExternallyDefinedDomain classSide >> onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer [
	^ self
		on:
			(DDSRemoteDomainMirror
				onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer)
]
