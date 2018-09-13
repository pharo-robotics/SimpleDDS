implemented
unregisterSubscriber: aCallerId from: aTopicName andCallerUri: anUri
	^ self
		invokeMethod: 'unregisterSubscriber'
		withArgs:
			{aCallerId.
			aTopicName.
			anUri}