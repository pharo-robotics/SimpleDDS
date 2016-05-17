synchronization
synchronizeLocalPublishersWith: publisherSet
	" Check if the topics locally declared for publications are declared in the Master"
	domain createdTopics
		select: [ :topic | (publisherSet contains: [ :tuple | (tuple at: 1) = topic name ]) not and: [ topic hasPublications ] ]
		thenDo: [ :topic | self ensurePublicationsAreRegistered: topic ].
		" For each topic publisher registered in the master it checks that:
			-  if the topic is being subscribed by a local participant, it is connected to all the publishers 
			-  if the topic is published by any local participant, this participant should be registered in this set"
	publisherSet
		do: [ :tuple | 
			| topicName setOfPublishers |
			topicName := tuple at: 1.
			setOfPublishers := tuple at: 2.
			domain
				findTopicByName: topicName
				ifFound: [ :topic | 
					topic hasSubscriptions
						ifTrue: [ self synchronizeSubscribersOf: topic connectionsTo: setOfPublishers ].
					topic hasPublications
						ifTrue: [ self ensurePublicationsOf: topic areDetailedIn: setOfPublishers ] ]
				ifNone: [  ] ]