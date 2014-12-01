API-Parameter-Server
deleteParam: aParameterName for: aCallerId
	^ self
		serviceResult:
			(self
				invokeMethod: 'deleteParam'
				withArgs:
					{aCallerId.
					aParameterName})