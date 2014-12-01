API-Parameter-Server
hasParam: aParameterName for: aCallerId
	^ self
		invokeMethod: 'hasParam'
		withArgs:
			{aCallerId.
			aParameterName}