API-Parameter-Server
setParam: aCallerId named: aParameterName with: anObject
	^ self
		invokeMethod: 'setParam'
		withArgs:
			{aCallerId.
			aParameterName.
			anObject}