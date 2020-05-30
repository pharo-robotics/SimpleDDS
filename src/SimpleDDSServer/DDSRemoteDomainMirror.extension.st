Extension { #name : #DDSRemoteDomainMirror }

{ #category : #'*SimpleDDSServer-extentions' }
DDSRemoteDomainMirror classSide >> onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer [
	^ self on:
		(DDSDomainProxy onProxy: aDDSDomainDescriptorXMLRPCServer)
]
