API-Data-Mutators
setParam: aCallerId named: aParameterName with: anObject
	^ self
		invokeMethod: 'setParam'
		withArgs:
			{aCallerId.
			aParameterName.
			anObject}