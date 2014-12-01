ros-xml-reponses
getPublications: aCallerID
	^ {1.
	' Publications '.
	((participantMirror publishedTopics
		collect: [ :topic | 
			{(topic name).
			(topic type name)} ]) asArray)}