"
Proxy to access information from a remote domain.
"
Class {
	#name : #DDSDomainProxy,
	#superclass : #MDDSAbstractDomainProxy,
	#instVars : [
		'typeLoader',
		'registeredTopics',
		'portResolver',
		'proxy',
		'participantServers',
		'registeredServices'
	],
	#category : #'SimpleDDS-Proxy'
}

{ #category : #'as yet unclassified' }
DDSDomainProxy class >> on: anURL [

	^ self onProxy: (DDSXMLRPCDomainProxy url: anURL)
]

{ #category : #'as yet unclassified' }
DDSDomainProxy class >> onProxy: aProxy [
	^ self new
		proxy: aProxy;
		yourself
]

{ #category : #converting }
DDSDomainProxy >> asString [
	^ 'DDS-Proxy', proxy asString
]

{ #category : #parameters }
DDSDomainProxy >> createOrObtainTypeContainer: aRegistryName for: aTypeLoader [
	| value |
	[ value := proxy getParam: aTypeLoader name named: aRegistryName ]
		on: Error
		do: [ 
			value := Dictionary new.
			proxy setParam: aTypeLoader name named: aRegistryName with: value ].
	proxy subscribeParam: aTypeLoader name callingBack: aTypeLoader uri forParameter: aRegistryName.
	^ value
]

{ #category : #parameters }
DDSDomainProxy >> createParameterNamed: aName for: aParticipant [
	^ self
		parameterNamed: aName
		for: (self reflectParticipant: aParticipant)
		ifNone: [ 
			proxy
				subscribeParam: aParticipant name
				callingBack: (self uriFor: (self reflectParticipant: aParticipant))
				forParameter: aName.
			DDSBindedParameter name: aName participant: aParticipant initialized: nil ]
]

{ #category : #abstract }
DDSDomainProxy >> createPublicationFor: aMDDSDomainParticipant with: aType [
	^ DDSPublication publishing: aMDDSDomainParticipant with: aType marshaller
]

{ #category : #creating }
DDSDomainProxy >> createServerFor: aParticipantMirror [
	^ DDSParticipantXMLRPCServer participantMirror: aParticipantMirror.
]

{ #category : #abstract }
DDSDomainProxy >> destroy [
	super destroy.
	registeredTopics removeAll.
	typeLoader
		ifNotNil: [ typeLoader unload.
			typeLoader := nil ].
	proxy := nil.
	portResolver := nil.
	participantServers do: #destroy.
	participantServers removeAll
]

{ #category : #query }
DDSDomainProxy >> findOrRegisterServiceDescriptorByName: aServiceName type: aTypeName [
	^ self registeredServices
		detect: [ :s | s name = aServiceName ]
		ifNone:
			[ 
			self
				registerService:
					(DDSServiceDescriptor
						name: aServiceName
						type: (DDSServiceTypeDescriptor named: aTypeName)) ]
]

{ #category : #query }
DDSDomainProxy >> findServiceByName: aServiceName ifFound: ifFound ifNone: ifNone [
	^ (self registeredServices detect: [ :s | s name = aServiceName ] ifFound: ifFound ifNone: ifNone)
]

{ #category : #'type management' }
DDSDomainProxy >> informTypeRegistry: aTypeRegistry hasBeenModifiedAt: aDDSXMLRPCTypeLoaderServer [ 
	proxy setParam: aDDSXMLRPCTypeLoaderServer name named: aDDSXMLRPCTypeLoaderServer containerName with: aTypeRegistry .
]

{ #category : #initialization }
DDSDomainProxy >> initialize [
	super initialize.
	participantServers := Set new.
	portResolver  := MDDSPortResolver obtain.
	registeredTopics := Set new
]

{ #category : #accessing }
DDSDomainProxy >> ip [
	^ proxy ip
]

{ #category : #testing }
DDSDomainProxy >> isRegisteredTopic: aName [
	^ self registeredTopics anySatisfy: [ :td | td name = aName ]
]

{ #category : #testing }
DDSDomainProxy >> itIsBeingServed: aParticipantMirror [
	^ participantServers contains: [ :e | e itServes: aParticipantMirror ]
]

{ #category : #abstract }
DDSDomainProxy >> loadTypeDefinitionNamed: aName definedFromString: aStringDefinition [
	^ self typeLoader loadTypeDefinitionNamed: aName definedFromString: aStringDefinition
]

{ #category : #query }
DDSDomainProxy >> lookupServiceServerFor: aMDDSDomainParticipant forCalling: aDDSService [
	^ proxy lookupService: aMDDSDomainParticipant name named: aDDSService name
]

{ #category : #parameters }
DDSDomainProxy >> noteParameterSetted: aParameterAnnouncement [
	| param |
	param := aParameterAnnouncement parameter.
	proxy setParam: param participant name named: param name with: param get
]

{ #category : #port }
DDSDomainProxy >> obtainPort [
	^ portResolver obtainPort.
]

{ #category : #parameters }
DDSDomainProxy >> parameterNamed: aParameterName for: aParticipantMirror ifNone: aBlock [
	| val |
	val := nil.
	[ val := proxy getParam: aParticipantMirror name named: aParameterName ]
		on: Error
		do: [ :e | ^ aBlock value ].
	val ifNil: [ ^ aBlock value ].
	proxy
		subscribeParam: aParticipantMirror participant name
		callingBack: (self uriFor: aParticipantMirror)
		forParameter: aParameterName.
	^ DDSBindedParameter name: aParameterName participant: aParticipantMirror participant initialized: val
]

{ #category : #abstract }
DDSDomainProxy >> participantServerFor: aParticipantMirror [
	^ participantServers detect: [ :e | e itServes: aParticipantMirror ]
]

{ #category : #abstract }
DDSDomainProxy >> plainTypeDefinitionFor: aType [
	^ typeLoader plainTypeDefinitionFor: aType
]

{ #category : #printing }
DDSDomainProxy >> printOn: aStream [
	self asString printOn: aStream
]

{ #category : #accessing }
DDSDomainProxy >> proxy: aProxy [
	proxy := aProxy. 
]

{ #category : #accessing }
DDSDomainProxy >> queryid [
	^ 'PhaROSDomainProxy-Query'
]

{ #category : #accessing }
DDSDomainProxy >> reflectParticipant: aMDDSParticipant [
	| mirror |
	mirror := aMDDSParticipant asMirror.
	self serveParticipant: mirror.
	^ mirror
]

{ #category : #private }
DDSDomainProxy >> registerAll: aSetOfTopics [
	registeredTopics addAll: aSetOfTopics
]

{ #category : #registration }
DDSDomainProxy >> registerExposure: anExposure [
	participantServers add: anExposure
]

{ #category : #registration }
DDSDomainProxy >> registerService: aDDSServiceDescriptor [
	registeredServices add: aDDSServiceDescriptor.
	^ aDDSServiceDescriptor
]

{ #category : #API }
DDSDomainProxy >> registerServiceFor: aCallerId named: serviceName at: aROSRPCUrl for: aXMLRPCUrl [
	^ proxy
		registerServiceFor: aCallerId
		named: serviceName
		at: aROSRPCUrl
		for: aXMLRPCUrl
]

{ #category : #abstract }
DDSDomainProxy >> registerTopicPublisher: aPublisher for: aParticipantMirror in: aDomain [
	proxy
		registerPublisher: aParticipantMirror name
		to: aPublisher topic name
		with: aPublisher topic type name
		andCallerUri: (self uriFor: aParticipantMirror)
]

{ #category : #abstract }
DDSDomainProxy >> registerTopicSubscriber: aSubscriber for: aParticipantMirror in: aDomain [
	| publishers |
	publishers := proxy
		registerSubscriber: aParticipantMirror name
		to: aSubscriber topic name
		with: aSubscriber topic type name
		andCallerUri: (self uriFor: aParticipantMirror).
	(self participantServerFor: aParticipantMirror) register: publishers for: aSubscriber
]

{ #category : #abstract }
DDSDomainProxy >> registerTypeDefinition: aTypeDefinition [
	^ self typeLoader registerTypeDefinition: aTypeDefinition
]

{ #category : #accessing }
DDSDomainProxy >> registeredServices [
	^ registeredServices ifNil: [ registeredServices := Set new ]
]

{ #category : #accessing }
DDSDomainProxy >> registeredTopics [
	^ registeredTopics
]

{ #category : #abstract }
DDSDomainProxy >> remoteUriFor: aParticipantName [
	^ proxy lookupNode: self queryid named: aParticipantName. 
]

{ #category : #query }
DDSDomainProxy >> serveParticipant: aParticipantMirror [
	(self itIsBeingServed: aParticipantMirror)
		ifFalse: [ 
			| server |
			server := self createServerFor: aParticipantMirror.
			server port: self obtainPort.
			server serve.
			self registerExposure: server ].
	^ aParticipantMirror
]

{ #category : #'type management' }
DDSDomainProxy >> serviceTypeDefinition: aTypeName ifAbsent: aBlockClosure [
	^ self typeLoader serviceTypeDefinition: aTypeName ifAbsent: aBlockClosure
]

{ #category : #abstract }
DDSDomainProxy >> subscriberFor: aTopic in: aDomain [
	^ MDDSSubscriber domain: aDomain named: aTopic name , '-subscriber' on: aTopic
]

{ #category : #accessing }
DDSDomainProxy >> systemState [
	^ proxy getSystemState: '/NotAnActualID'
]

{ #category : #abstract }
DDSDomainProxy >> topics [
	| remoteTopics |
	[ remoteTopics := proxy getTopicTypes: self queryid ]
		on: ConnectionTimedOut
		do: [ remoteTopics := {} ].
	self
		registerAll:
			(remoteTopics
				reject: [ :array | self isRegisteredTopic: (array at: 1) ]
				thenCollect: [ :array | MDDSTopicDescriptor name: (array at: 1) type: (MDDSTypeDescriptor named: (array at: 2)) ]).
	^ self registeredTopics
]

{ #category : #abstract }
DDSDomainProxy >> typeDefinition: aTypeName ifAbsent: aBlock [
	^ self typeLoader typeDefinition: aTypeName ifAbsent: aBlock
]

{ #category : #accessing }
DDSDomainProxy >> typeLoader [
	^ typeLoader
		ifNil: [ 
			typeLoader := DDSXMLRPCTypeLoaderServer new
				initializeWith: self;
				yourself ]
]

{ #category : #accessing }
DDSDomainProxy >> typeLoader: aTypeLoader [
	typeLoader := aTypeLoader
]

{ #category : #abstract }
DDSDomainProxy >> unregisterTopicPublisher: aPublisher for: aParticipantMirror [
	^ proxy unregisterPublisher: aParticipantMirror name from: aPublisher topic name andCallerUri: (self uriFor: aParticipantMirror)
]

{ #category : #abstract }
DDSDomainProxy >> unregisterTopicSubscriber: aSubscriber for: aParticipantMirror [
	^ proxy unregisterSubscriber: aParticipantMirror name from: aSubscriber topic name andCallerUri: (self uriFor: aParticipantMirror)
]

{ #category : #abstract }
DDSDomainProxy >> uriFor: aParticipantMirror [
	^ 'http://{1}:{2}/'
		format:
			{ NetNameResolver stringFromAddress: aParticipantMirror ip .
			((self participantServerFor: aParticipantMirror) port)}
]

{ #category : #accessing }
DDSDomainProxy >> url [
	^ proxy url asString
]
