example
createExampleDomain
	| domain |
	domain := DDSExternallyDefinedDomain onLocalSimpleDDS: server.	" Add the protocol support "
	domain addProtocol: (DDSTCPProtocol encoding: MDDSEncoder decoding: MDDSDecoder).
	^ domain