as yet unclassified
configureConnection: aReadWriteConnection
	aReadWriteConnection inputMarshaller: service type requestMarshaller.
	aReadWriteConnection outputMarshaller: service type responseMarshaller.