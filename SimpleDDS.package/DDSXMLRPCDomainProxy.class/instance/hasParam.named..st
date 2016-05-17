API-Parameter-Server
hasParam: aCallerId named: aParameterName
	^ self
		invokeMethod: 'hasParam'
		withArgs:
			{aCallerId.
			aParameterName}