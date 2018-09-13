API-Parameter-Server
deleteParam: aCallerId named: aParameterName
	^ self
		invokeMethod: 'deleteParam'
		withArgs:
			{aCallerId.
			aParameterName}