API-Data-Accessors
getSystemState: aCallerId
	^ self invokeMethod: 'getSystemState' withArgs: {aCallerId}