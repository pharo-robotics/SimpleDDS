"
the service monitor is an object with a process related in charge of analyzing the output of the remote master call 'systemState', for learning about any kind of inconsitency in between what the master knows and how the local system behaves. 

This is a pluggable  service that allows communication failures recovery and master crash recovery 
"
Class {
	#name : #DDSServiceMonitor,
	#superclass : #Object,
	#instVars : [
		'domain',
		'process',
		'backendConnected',
		'lastReadedState',
		'timesChecked',
		'hasBeenReconnected',
		'masterMetaDataHasChanged',
		'threadshold',
		'anyRecoveryMethodHasbeenExecuted',
		'rate'
	],
	#category : 'SimpleDDS-Domain'
}

{ #category : #'as yet unclassified' }
DDSServiceMonitor class >> for: anExternallyDefinedDomain [
	^ self new
		domain: anExternallyDefinedDomain;
		start;
		yourself
]

{ #category : #'as yet unclassified' }
DDSServiceMonitor class >> routinePassageMaxThreadshold [
	^ 10.
]

{ #category : #'as yet unclassified' }
DDSServiceMonitor class >> routinePassageMinThreadshold [
	^ 1.
]

{ #category : #query }
DDSServiceMonitor >> analyzeCurrentState [
	| state isCurrentlyConnected |
	isCurrentlyConnected := true.
	hasBeenReconnected := false.
	masterMetaDataHasChanged := false.
	[ 
	state := domain mirror systemState.
	isCurrentlyConnected := state isEmptyOrNil not.
	masterMetaDataHasChanged := state ~= lastReadedState
		and: [ state isEmptyOrNil not ] ]
		on: Error
		do: [ isCurrentlyConnected := false ].
	hasBeenReconnected := backendConnected not and: isCurrentlyConnected.
	lastReadedState := state.
	backendConnected := isCurrentlyConnected.
	^ hasBeenReconnected
]

{ #category : #accessing }
DDSServiceMonitor >> destroy [
	process
		ifNotNil: [ 
			process stop.
			process := nil ].
	domain := nil
]

{ #category : #accessing }
DDSServiceMonitor >> domain: anExternallyDefinedDomain [
	domain := anExternallyDefinedDomain
]

{ #category : #'recovery reconnections' }
DDSServiceMonitor >> ensureConnectionsOf: aParticipant at: aSubscriber to: anUrl [
	anyRecoveryMethodHasbeenExecuted := true.
	domain mirror forceReconnect: aParticipant of: aSubscriber to: anUrl
]

{ #category : #'recovery reconnections' }
DDSServiceMonitor >> ensurePublicationsAreRegistered: aTopic [
	self traceCr: 'WARN: re-publishing ' , aTopic name.
	[ 
	aTopic publisher publications
		do: [ :publication | 
			anyRecoveryMethodHasbeenExecuted := true.
			domain mirror forceReRegistrationOfPublication: publication for: aTopic publisher.
			self traceCr: 'INFO: re-publishing done successfully' ] ]
		on: Error
		do: [ :err | self traceCr: 'ERROR: During re registration of topic publisher ' ]
]

{ #category : #'recovery reconnections' }
DDSServiceMonitor >> ensurePublicationsOf: aTopic areDetailedIn: aSetOfPublications [
	aTopic publisher publications
		do:
			[ :publication | (aSetOfPublications includes: publication participant name)
				ifFalse:
					[ self
						traceCr:
							(''
								join:
									{'WARN: '.
									publication participant name.
									' does not appear as a publisher in topic '.
									aTopic name}).
					[ anyRecoveryMethodHasbeenExecuted := true.
					domain mirror forceReRegistrationOfPublication: publication for: aTopic publisher.
					self traceCr: 'INFO: topic registered successfully. ' ]
						on: Error
						do: [ :err | self traceCr: 'ERROR: during topic registration. Is the master working? Is the network stable?' ] ] ]
]

{ #category : #'recovery reconnections' }
DDSServiceMonitor >> ensureServiceIsRegistered: aService [
	self traceCr: 'WARN: re-publishing ' , aService name.
	[ anyRecoveryMethodHasbeenExecuted := true.
	domain mirror forceReRegistrationOfService: aService for: aService server.
	self traceCr: 'INFO: re-publishing done successfully' ]
		on: Error
		do: [ :err | self traceCr: 'ERROR: During re registration of topic publisher ' ]
]

{ #category : #'recovery reconnections' }
DDSServiceMonitor >> ensureSubscriptionsAreRegistered: aTopic [
	self traceCr: 'WARN: re-subscribing ' , aTopic name.
	[ aTopic subscriber subscriptions
		do: [ :subscription | 
			anyRecoveryMethodHasbeenExecuted := true.
			domain mirror
				forceReRegistrationOfSubscription: subscription
				for: aTopic subscriber.
			self traceCr: 'INFO: re-subscribing done successfully' ] ]
		on: Error
		do:
			[ :err | self traceCr: 'ERROR: During re registration of topic publisher ' ]
]

{ #category : #'recovery reconnections' }
DDSServiceMonitor >> ensureSubscriptionsOf: aTopic areDetailedIn: aSetOfSubscribers [
	aTopic subscriber subscriptions
		do:
			[ :subscription | (aSetOfSubscribers includes: subscription participant name)
				ifFalse:
					[ self
						traceCr:
							(''
								join:
									{'WARN: '.
									subscription participant name.
									' does not appear as a subscriber in topic '.
									aTopic name}).
					[ anyRecoveryMethodHasbeenExecuted := true.
					domain mirror forceReRegistrationOfSubscription: subscription for: aTopic subscriber.
					self traceCr: 'INFO: topic registered successfully. ' ]
						on: Error
						do: [ :err | self traceCr: 'ERROR: during topic registration. Is the master working? Is the network stable?' ] ] ]
]

{ #category : #initialization }
DDSServiceMonitor >> initialize [
	super initialize.
	backendConnected := false.
	timesChecked := 1.
	hasBeenReconnected := false.
	masterMetaDataHasChanged := false.
	threadshold := (self class routinePassageMaxThreadshold + self class routinePassageMinThreadshold) // 2.
	anyRecoveryMethodHasbeenExecuted := true.
	rate := 10 hz
]

{ #category : #testing }
DDSServiceMonitor >> isBackendConnected [
	^ backendConnected
]

{ #category : #notifications }
DDSServiceMonitor >> masterHasBeenReconnected [
	^ hasBeenReconnected
]

{ #category : #accessing }
DDSServiceMonitor >> masterMetaDataHasChanged [
	^ masterMetaDataHasChanged
]

{ #category : #private }
DDSServiceMonitor >> monitor [
	[ self analyzeCurrentState.
	domain mirror
		ifNotNil: [ self whenReconnectionOrRoutine: [ self synchronizeDomains ] ]
		ifNil: [ self
				traceCr:
					'WARNING: domain mirror is not yet setup. Service monitor cannot start to run' ].
	self wait ]
		on: Error
		do:
			[ :err | self traceCr: 'ERROR: service monitor error ' , err messageText ]
]

{ #category : #'threshold management' }
DDSServiceMonitor >> shiftDownCurrentThreadshold [
	threadshold := (threadshold - 1) max: self class routinePassageMinThreadshold.
]

{ #category : #'threshold management' }
DDSServiceMonitor >> shiftUpCurrentThreadshold [
	threadshold := (threadshold + 1) min: self class routinePassageMaxThreadshold.
]

{ #category : #query }
DDSServiceMonitor >> shouldScanDeepAsRoutine [
	^ timesChecked > threadshold
		ifTrue: [ 
			timesChecked := 1.
			true ]
		ifFalse: [ 
			timesChecked := timesChecked + 1.
			false ]
]

{ #category : #accessing }
DDSServiceMonitor >> start [
	process
		ifNil: [ "Priority 60."
			process := TKTParameterizableService new.
			process
				onSetUpDo:
					(MessageSend
						receiver: self
						selector: #traceCr:
						argument: 'DDS System monitor has started').
			process
				onTearDownDo: [ self traceCr: 'DDS System monitor has finished' ].
			process name: ' Service Monitor ' , UUID new asString.
			process step: (MessageSend receiver: self selector: #monitor).
			process start ]
]

{ #category : #accessing }
DDSServiceMonitor >> stop [
	process
		ifNotNil: [ 
			process stop.
			process := nil ]
]

{ #category : #synchronization }
DDSServiceMonitor >> synchronizeDomains [
	"
[publishers, subscribers, services]
publishers is of the form
[ [topic1, [topic1Publisher1...topic1PublisherN]] ... ]
subscribers is of the form
[ [topic1, [topic1Subscriber1...topic1SubscriberN]] ... ]
services is of the form
[ [service1, [service1Provider1...service1ProviderN]] ... ]
"

	lastReadedState
		ifNotNil:
			[ self synchronizeLocalPublishersWith: (lastReadedState at: 1).
			self synchronizeLocalSubscribersWith: (lastReadedState at: 2).
			self synchronizeLocalServiceServersWith: (lastReadedState at: 3) ]
]

{ #category : #synchronization }
DDSServiceMonitor >> synchronizeLocalPublishersWith: publisherSet [
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
]

{ #category : #synchronization }
DDSServiceMonitor >> synchronizeLocalServiceServersWith: serviceSet [
	" Check if the services locally declared for serve are declared in the Master"

	domain createdServices
		select: [ :service | (serviceSet contains: [ :tuple | (tuple at: 1) = service name ]) not and: [ service hasLocalServers ] ]
		thenDo: [ :service | self ensureServiceIsRegistered: service ]
]

{ #category : #synchronization }
DDSServiceMonitor >> synchronizeLocalSubscribersWith: subscriberSet [
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
]

{ #category : #synchronization }
DDSServiceMonitor >> synchronizePublisherOf: aTopic connectionsTo: aSetOfSubscribers [
	| join |
	aTopic publisher publications
		do: [ :publication | 
			join := aSetOfSubscribers
				differenceTableWith:
					(publication connections
						select: #isRemote
						thenCollect: #relatedParticipantName).
			join associations
				do: [ :association | 
					" if the value is true means that is in the master but not in local. 
					  if it is false means that is locally defined but not known by the master  "
					association value
						ifTrue: [ self
								traceCr:
									(''
										join:
											{'WARN: The subscriber '.
											association key.
											' is not actually connected with '.
											publication participant name}) ]
						ifFalse: [ self
								traceCr:
									(''
										join:
											{'WARN: The subscriber '.
											association key.
											' for: '.
											publication participant name.
											' is not registered in master. '}) ] ] ]
]

{ #category : #synchronization }
DDSServiceMonitor >> synchronizeSubscribersOf: aTopic connectionsTo: aSetOfPublishers [
	| join |
	aTopic subscriber subscriptions
		do:
			[ :subscription | join := aSetOfPublishers differenceTableWith: (subscription connections select: #isRemote thenCollect: #relatedParticipantName).
			join associations
				do:
					[ :association | association value
						ifTrue:
							[ self
								traceCr:
									(''
										join:
											{'WARN: The publisher '.
											association key.
											' is not actually connected with '.
											subscription participant name.
											' trying to connect'}).
							[ self ensureConnectionsOf: subscription participant at: aTopic subscriber to: (domain mirror remoteUriFor: association key).
							self traceCr: 'INFO: publisher connection successfully restored' ]
								on: Error
								do: [ :err | self
										traceCr:
											(''
												join:
													{'ERROR: error during publisher reconnection '.
													err messageText}) ] ]
						ifFalse:
							[ self
								traceCr:
									(''
										join:
											{' WARN: The publisher '.
											association key.
											' for: '.
											subscription participant name.
											' is not registered in master. '}) ] ]
			" if the value is true means that is in the master but not in local. 
					  if it is false means that is locally defined but not known by the master  " ]
]

{ #category : #accessing }
DDSServiceMonitor >> threadshold [
	^ threadshold
]

{ #category : #waiting }
DDSServiceMonitor >> wait [
	rate := anyRecoveryMethodHasbeenExecuted
		ifTrue: [ 10 hz ]
		ifFalse: [ 0.5 hz max: rate - 0.5 hz ].
	rate cycleDelay wait
]

{ #category : #'entry point' }
DDSServiceMonitor >> whenReconnectionOrRoutine: aBlock [
	| asRoutine |
	anyRecoveryMethodHasbeenExecuted := false.
	asRoutine := false.
	(self masterHasBeenReconnected
		or: [ 
			self masterMetaDataHasChanged
				or: [ 
					asRoutine := self shouldScanDeepAsRoutine.
					asRoutine ] ])
		ifTrue: [ 
			aBlock value.
			asRoutine
				ifTrue: [ 
					anyRecoveryMethodHasbeenExecuted
						ifTrue: [ self shiftDownCurrentThreadshold ]
						ifFalse: [ self shiftUpCurrentThreadshold ] ] ]
]
