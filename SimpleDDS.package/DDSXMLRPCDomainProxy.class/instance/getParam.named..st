API-Data-Accessors
getParam: aCallerId named: aParameterName
	^ self
		invokeMethod: 'getParam'
		withArgs:
			{aCallerId.
			aParameterName}