as yet unclassified
setUp
	super setUp.
	" server "
	server := DDSSDomainDescriptorServer xmlrpcServerOn: DDSSDomainDescriptor new.
	server domain: DDSSDomainDescriptor new.
	server serveAt: 11311.
	" domain "
	domain := DDSExternallyDefinedDomain onLocalSimpleDDS: server.
	mirror := domain mirror.
	participant := MDDSDomainParticipant domain: domain name: 'adhoc-participant' ip: '127.0.0.1'.
	participant2 := MDDSDomainParticipant domain: domain name: 'other-participant' ip: '127.0.0.1'