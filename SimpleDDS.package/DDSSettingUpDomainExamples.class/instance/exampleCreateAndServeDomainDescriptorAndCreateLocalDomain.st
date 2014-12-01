as yet unclassified
exampleCreateAndServeDomainDescriptorAndCreateLocalDomain
	" self new exampleCreateAndServeDomainDescriptorAndCreateLocalDomain "

	| domain server |
	server := DDSDomainDescriptorServer xmlrpcServerOn: DDSDomainDescriptor new.
	server domain: DDSDomainDescriptor new.
	server serveAt: 11311.
	domain := DDSExternallyDefinedDomain onLocalSimpleDDS: server.
	domain explore.
	self halt: 'Proceed to destroy domain.'.
	domain destroy.
	server stop.