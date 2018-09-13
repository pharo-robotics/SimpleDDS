API-Parameter-Server
searchParam: aCallerId  forParameter: aParameterName
	^ self
		serviceResult:
			(self
				invokeMethod: 'searchParam'
				withArgs:
					{aCallerId.
					aParameterName})