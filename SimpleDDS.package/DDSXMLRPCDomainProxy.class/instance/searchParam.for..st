API-Parameter-Server
searchParam: aParameterName for: aCallerId
	^ self
		serviceResult:
			(self
				invokeMethod: 'searchParam'
				withArgs:
					{aCallerId.
					aParameterName})