API-Registration
registerPublisher: aCallerId to: aTopicName with: aTopicMessageType andCallerUri: anUri
	^ self
		invokeMethod: 'registerPublisher'
		withArgs:
			{aCallerId.
			aTopicName.
			aTopicMessageType.
			anUri}