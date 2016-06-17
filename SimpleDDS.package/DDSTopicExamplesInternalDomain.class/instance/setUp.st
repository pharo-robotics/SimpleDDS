running
setUp
	domain := MDDSInternallyDefinedDomain new.	" Add the protocol support "
	domain addProtocol: (DDSTCPProtocol encoding: MDDSEncoder decoding: MDDSDecoder).
