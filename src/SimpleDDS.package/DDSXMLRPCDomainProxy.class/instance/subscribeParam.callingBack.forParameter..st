API-Parameter-Server
subscribeParam: aCallerId callingBack: anXMLRPCUrl forParameter: aParameterName
	^ self
		invokeMethod: 'subscribeParam'
		withArgs:
			{aCallerId.
			anXMLRPCUrl.
			aParameterName}