synchronization
synchronizeLocalSubscribersWith: subscriberSet
	" Check if the topics locally declared for subscriptions are declared in the Master"
	domain createdTopics
		select: [ :t | (subscriberSet contains: [ :tuple | (tuple at: 1) = t name ]) not and: [ t hasSubscriptions ] ]
		thenDo: [ :topic | self ensureSubscriptionsAreRegistered: topic ].
	" For each topic subscriber registered in the master it checks that:
			-  if the topic is being published by a local participant, it is connected to all the subscribers 
			-  if the topic is subscribed by any local participant, this participant should be registered in this set"
	subscriberSet
		do: [ :tuple | 
			| topicName setOfSubscribers |
			topicName := tuple at: 1.
			setOfSubscribers := tuple at: 2.
			domain
				findTopicByName: topicName
				ifFound: [ :topic | 
					topic hasPublications
						ifTrue: [ self synchronizePublisherOf: topic connectionsTo: setOfSubscribers ].
					topic hasSubscriptions
						ifTrue: [ self ensureSubscriptionsOf: topic areDetailedIn: setOfSubscribers ] ]
				ifNone: [  ] ]