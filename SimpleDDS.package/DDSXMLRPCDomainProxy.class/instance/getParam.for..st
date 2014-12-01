API-Parameter-Server
getParam: aParameterName for: aCallerId
	^ self
		invokeMethod: 'getParam'
		withArgs:
			{aCallerId.
			aParameterName}