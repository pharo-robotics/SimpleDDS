API-Registration
unregisterPublisher: aCallerId from: aTopicName andCallerUri: anUri
	^ self
		invokeMethod: 'unregisterPublisher'
		withArgs:
			{aCallerId.
			aTopicName.
			anUri}