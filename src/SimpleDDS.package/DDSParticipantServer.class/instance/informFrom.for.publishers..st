publishing metadata
informFrom: aCallerID for: aTopicName publishers: anArrayOfPublishers
	| relatedSubscriber |
	relatedSubscriber := (participantMirror subscribedTopics detect: [ :t | t name = aTopicName ]) subscriber.
	self register: anArrayOfPublishers for: relatedSubscriber.
	^ { 1 . 'Inform' . true }