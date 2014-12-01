as yet unclassified
isRegisteredTopic: aName
	^ self registeredTopics anySatisfy: [ :td | td name = aName ]