as yet unclassified
requestFor: aCallerId theTopic: aTopicName withProtocol: aSetOfProtocols
	^ self
		invokeMethod: 'requestTopic'
		withArgs:
			{aCallerId.
			aTopicName.
			{(aSetOfProtocols asArray)}}