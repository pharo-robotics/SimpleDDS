testing
isRegisteredTopic: aName
	^ self registeredTopics anySatisfy: [ :td | td name = aName ]