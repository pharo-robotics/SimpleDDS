API-Data-Mutators
deleteParam: aCallerId named: aParameterName
	^ self
		invokeMethod: 'deleteParam'
		withArgs:
			{aCallerId.
			aParameterName}