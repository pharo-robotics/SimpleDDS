API-Registration
registerSubscriber: aCallerId to: aTopicName with: aTopicMessageType andCallerUri: anUri
	^ self
		invokeMethod: 'registerSubscriber'
		withArgs:
			{aCallerId.
			aTopicName.
			aTopicMessageType.
			anUri}