as yet unclassified
createDomain
	| remoteProxy domainProxy  |
	server := DDSSDomainDescriptorServer xmlrpcServerOn: DDSSDomainDescriptor new.
	serverDescriptor := DDSSDomainDescriptor new.
	server domain: serverDescriptor.
	server serveAt: 11311.
	" domain "
	domainProxy := DDSDomainProxy onProxy: server.
	domainProxy typeLoader: DDSTestTypeLoader new.
	domainProxy typeLoader initializeWith: domainProxy.
	remoteProxy := DDSRemoteDomainMirror on: domainProxy.
	^ (DDSExternallyDefinedDomain on: remoteProxy)
		addProtocol: (DDSTCPProtocol encoding: MDDSEncoder decoding: MDDSDecoder);
		yourself