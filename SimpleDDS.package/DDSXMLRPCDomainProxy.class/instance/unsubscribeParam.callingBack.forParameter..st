API-Parameter-Server
unsubscribeParam: aCallerId callingBack: anXMLRPCUrl forParameter: aParameterName
	^ self
		serviceResult:
			(self
				invokeMethod: 'unsubscribeParam'
				withArgs:
					{aCallerId.
					anXMLRPCUrl.
					aParameterName})