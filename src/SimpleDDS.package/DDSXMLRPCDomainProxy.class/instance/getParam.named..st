API-Parameter-Server
getParam: aCallerId named: aParameterName
	^ self
		invokeMethod: 'getParam'
		withArgs:
			{aCallerId.
			aParameterName}