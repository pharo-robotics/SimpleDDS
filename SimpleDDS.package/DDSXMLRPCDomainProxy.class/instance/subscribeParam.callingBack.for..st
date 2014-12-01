API-Parameter-Server
subscribeParam: aParameterName callingBack: anXMLRPCUrl for: aCallerId
	^ self
		invokeMethod: 'subscribeParam'
		withArgs:
			{aCallerId.
			anXMLRPCUrl.
			aParameterName}