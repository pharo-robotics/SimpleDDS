as yet unclassified
informFrom: aCallerID for: aTopicName publishers: anArrayOfPublishers
	^ self
		invokeMethod: 'publisherUpdate'
		withArgs:
			{aCallerID.
			aTopicName.
			anArrayOfPublishers asArray}