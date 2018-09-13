API-Parameter-Server
getParamNames: aCallerId
	^ self invokeMethod: 'getParamNames' withArgs: {aCallerId}