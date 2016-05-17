*SimpleDDSWithServerExtention
exampleCreateAndServeDomainDescriptorAndCreateLocalDomain
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