API-Data-Accessors
getParamNames: aCallerId
	^ self invokeMethod: 'getParamNames' withArgs: {aCallerId}