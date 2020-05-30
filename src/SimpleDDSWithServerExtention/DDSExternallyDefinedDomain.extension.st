Extension { #name : #DDSExternallyDefinedDomain }

{ #category : #'*SimpleDDSWithServerExtention' }
DDSExternallyDefinedDomain classSide >> onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer [
	^ self
		on:
			(DDSRemoteDomainMirror
				onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer)
]
