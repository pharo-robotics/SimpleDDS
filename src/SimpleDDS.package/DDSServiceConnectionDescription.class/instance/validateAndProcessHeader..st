as yet unclassified
validateAndProcessHeader: aMDDSHandshakeHeader
	^ aMDDSHandshakeHeader probe = 1
		or: [ aMDDSHandshakeHeader md5sum = service type md5sum ]