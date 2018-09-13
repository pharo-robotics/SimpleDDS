ros-xml-reponses
getSubscriptions: aCallerID
	^ {1.
	' Subscriptions '.
	((participantMirror subscribedTopics
		collect: [ :topic | 
			{(topic name).
			(topic type name)} ]) asArray)}