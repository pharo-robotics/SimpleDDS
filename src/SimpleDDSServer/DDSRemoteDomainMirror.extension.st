Extension { #name : #DDSRemoteDomainMirror }

{ #category : #'*SimpleDDSServer-extentions' }
DDSRemoteDomainMirror class >> onLocalSimpleDDS: aDDSDomainDescriptorXMLRPCServer [
	^ self on:
		(DDSDomainProxy onProxy: aDDSDomainDescriptorXMLRPCServer)
]
