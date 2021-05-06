"
A PhaROSParticipantServer class defines an api for giving to any interested all what is available about the local participant. It relies on subclasses for technologies
"
Class {
	#name : #DDSParticipantServer,
	#superclass : #Object,
	#instVars : [
		'participantMirror',
		'port',
		'discovery'
	],
	#category : #'SimpleDDS-ParticipantServer'
}

{ #category : #'as yet unclassified' }
DDSParticipantServer class >> new [
	^ super new.
]

{ #category : #'as yet unclassified' }
DDSParticipantServer class >> participantMirror: aParticipantMirror [
	^ self new
		participantMirror: aParticipantMirror;
		discovery: DDSDiscovery new;
		yourself
]

{ #category : #accessing }
DDSParticipantServer >> destroy [
	self unserve.
	participantMirror := nil.
	port := nil.
	discovery := nil
]

{ #category : #accessing }
DDSParticipantServer >> discovery: aDiscovery [
	discovery := aDiscovery 
]

{ #category : #'ros-xml-reponses' }
DDSParticipantServer >> from: aCallerID update: aParameterName with: aValue [
	| domain parameter parameterName |
	self halt.
	domain := participantMirror participant domain.
	parameterName := aParameterName last = $/
		ifTrue: [ aParameterName copyFrom: 1 to: aParameterName size - 1 ]
		ifFalse: [ aParameterName ].
	parameter := domain
		parameterNamed: parameterName
		for: participantMirror participant
		ifNone: [ self error: 'The parameter updated is not being watched ' , parameterName ].
	parameter basicSet: aValue.
	domain note: (DDSParameterAnnouncement hasChanged: parameter).
	^ {1 . 'Update' . true }.
]

{ #category : #'ros-xml-reponses' }
DDSParticipantServer >> getBusInfo: aCallerID [
	^ {1.
	' Bus Info '.
	((participantMirror relatedConnections
		collect: [ :conn | 
			{(conn id).
			(conn urlrpc).
			(conn isReader
				ifTrue: #i
				ifFalse: #o).
			(conn protocol name).
			"(conn topic name)."
			(conn isConnected)} ]) asArray)}
]

{ #category : #'ros-xml-reponses' }
DDSParticipantServer >> getPid: aCallerID [
	^ {1.
	'PID'.
	ThisOSProcess thisOSProcess pid}
]

{ #category : #'ros-xml-reponses' }
DDSParticipantServer >> getPublications: aCallerID [
	^ {1.
	' Publications '.
	((participantMirror publishedTopics
		collect: [ :topic | 
			{(topic name).
			(topic type name)} ]) asArray)}
]

{ #category : #'ros-xml-reponses' }
DDSParticipantServer >> getSubscriptions: aCallerID [
	^ {1.
	' Subscriptions '.
	((participantMirror subscribedTopics
		collect: [ :topic | 
			{(topic name).
			(topic type name)} ]) asArray)}
]

{ #category : #'publishing metadata' }
DDSParticipantServer >> informFrom: aCallerID for: aTopicName publishers: anArrayOfPublishers [
	| relatedSubscriber |
	relatedSubscriber := (participantMirror subscribedTopics detect: [ :t | t name = aTopicName ]) subscriber.
	self register: anArrayOfPublishers for: relatedSubscriber.
	^ { 1 . 'Inform' . true }
]

{ #category : #testing }
DDSParticipantServer >> itServes: aParticipant [
	^ participantMirror participant = aParticipant participant
]

{ #category : #accessing }
DDSParticipantServer >> participantMirror: aParticipantMirror [
	participantMirror  := aParticipantMirror 
]

{ #category : #accessing }
DDSParticipantServer >> port [
	^ port
]

{ #category : #accessing }
DDSParticipantServer >> port: aPort [
	port := aPort
]

{ #category : #'as yet unclassified' }
DDSParticipantServer >> register: anArrayOfPublishers for: relatedSubscriber [
	discovery
		manage: anArrayOfPublishers
		for: relatedSubscriber
		with: participantMirror
		in: participantMirror domain
]

{ #category : #'ros-xml-reponses' }
DDSParticipantServer >> requestTopic: aCallerId for: aTopicName availableFor: anArrayOfProtocols [
	| relatedServers selected |
	relatedServers := (participantMirror publicationForTopicNamed: aTopicName) publicationServers.
	selected := anArrayOfProtocols
		inject: Set new
		into: [ :set :protocol | 
			relatedServers detect: [ :server | server supports: (protocol at:1) ] ifFound: [ :server | set add: server ] ifNone: [  ].
			set ].
	^ {1.
	'Protocols'.
	((selected
		collect: [ :server | 
			{(server protocol name).
			(NetNameResolver stringFromAddress: server ip).
			(server port)} ]) anyOne asArray)}
]

{ #category : #exposition }
DDSParticipantServer >> serve [
	self subclassResponsibility 
]

{ #category : #exposition }
DDSParticipantServer >> unserve [
	self subclassResponsibility 
]
