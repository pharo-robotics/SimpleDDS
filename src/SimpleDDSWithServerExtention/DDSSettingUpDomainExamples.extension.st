Extension { #name : #DDSSettingUpDomainExamples }

{ #category : #'*SimpleDDSWithServerExtention' }
DDSSettingUpDomainExamples >> exampleCreateAndServeDomainDescriptor [
	" self new exampleCreateAndServeDomainDescriptor "

	| domainDescriptor server |
	domainDescriptor := DDSSDomainDescriptor new.
	server := DDSDomainDescriptorXMLRPCServer serve: domainDescriptor.
	server serveAt: 11311.
	server explore.
	self halt: 'Proceed to stop domain server.'.
	server stop
]

{ #category : #'*SimpleDDSWithServerExtention' }
DDSSettingUpDomainExamples >> exampleCreateAndServeDomainDescriptorAndCreateLocalDomain [
	" self new exampleCreateAndServeDomainDescriptorAndCreateLocalDomain "

	| domain server |
	server := DDSDomainDescriptorXMLRPCServer serve: DDSSDomainDescriptor new..
	server domain: DDSSDomainDescriptor new.
	server serveAt: 11311.
	domain := DDSExternallyDefinedDomain onLocalSimpleDDS: server.
	domain explore.
	self halt: 'Proceed to destroy domain.'.
	domain destroy.
	server stop.
]
