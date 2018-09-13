API-Data-Accessors
getTopicTypes: aCallerId
	^ self invokeMethod: 'getTopicTypes' withArgs: {aCallerId}