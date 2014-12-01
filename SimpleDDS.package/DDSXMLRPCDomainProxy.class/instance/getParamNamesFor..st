API-Parameter-Server
getParamNamesFor: aCallerId
	^ self serviceResult: (self invokeMethod: 'getParamNames' withArgs: {aCallerId})