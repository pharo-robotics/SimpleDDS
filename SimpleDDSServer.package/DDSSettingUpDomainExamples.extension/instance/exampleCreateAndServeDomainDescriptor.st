*SimpleDDSServer-extentions
exampleCreateAndServeDomainDescriptor
	" self new exampleCreateAndServeDomainDescriptor "

	| domainDescriptor server |
	domainDescriptor := DDSSDomainDescriptor new.
	server := DDSDomainDescriptorXMLRPCServer serve: domainDescriptor.
	server serveAt: 11311.
	server explore.
	self halt: 'Proceed to stop domain server.'.
	server stop