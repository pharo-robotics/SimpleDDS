API-Parameter-Server
unsubscribeParam: aParameterName callingBack: anXMLRPCUrl for: aCallerId
	^ self
		serviceResult:
			(self
				invokeMethod: 'unsubscribeParam'
				withArgs:
					{aCallerId.
					anXMLRPCUrl.
					aParameterName})