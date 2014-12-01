API-Data-Accessors
hasParam: aCallerId named: aParameterName
	^ self
		invokeMethod: 'hasParam'
		withArgs:
			{aCallerId.
			aParameterName}