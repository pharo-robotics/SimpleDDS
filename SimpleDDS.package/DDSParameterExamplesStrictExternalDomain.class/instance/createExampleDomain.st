as yet unclassified
createExampleDomain
	| domain |
	domain := DDSExternallyDefinedDomain onSimpleDDS: 'http://127.0.0.1:11311'.	" Add the protocol support "
	domain addProtocol: (DDSTCPProtocol encoding: MDDSEncoder decoding: MDDSDecoder).
	^ domain