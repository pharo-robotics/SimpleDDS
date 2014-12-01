as yet unclassified
exampleCreateAndServeDomainDescriptor
" self new exampleCreateAndServeDomainDescriptor "
	| domainDescriptor server |
	domainDescriptor := DDSDomainDescriptor new.
	server := DDSDomainDescriptorServer xmlrpcServerOn: domainDescriptor.
	server serveAt: 11311.
	server explore.
	self halt: 'Proceed to stop domain server.'.
	server stop.