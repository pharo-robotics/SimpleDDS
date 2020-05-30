Extension { #name : #DDSRemoteDomainMirror }

{ #category : #'*SimpleDDSWithServerExtention' }
DDSRemoteDomainMirror classSide >> onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer [
	^ self on:
		(DDSDomainProxy onProxy: aDDSDomainDescriptorXMLRPCServer)
]
