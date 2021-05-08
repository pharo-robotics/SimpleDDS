"
This remote mirror adds management for parameters
"
Class {
	#name : #DDSRemoteDomainMirror,
	#superclass : #MDDSRemoteDomainMirror,
	#instVars : [
		'parameters'
	],
	#category : 'SimpleDDS-Domain'
}

{ #category : #construction }
DDSRemoteDomainMirror class >> onSimpleDDS: anURL [
	^ self  on: (DDSDomainProxy on: anURL asString )
]

{ #category : #parameters }
DDSRemoteDomainMirror >> createParameterNamed: aName for: aParticipant [
	| parameter |
	parameter := proxy createParameterNamed: aName for: aParticipant.
	parameter domain: domain.
	parameters add: parameter.
	^ parameter
]

{ #category : #'as yet unclassified' }
DDSRemoteDomainMirror >> createServiceCallerFor: aMDDSDomainParticipant forCalling: aDDSService [
	aDDSService hasServers
		ifFalse: [ self lookupAndRegisterServiceServerFor: aMDDSDomainParticipant forCalling: aDDSService ].
	^ DDSServiceCaller for: aMDDSDomainParticipant on: aDDSService
]

{ #category : #query }
DDSRemoteDomainMirror >> findOrRegisterServiceDescriptorByName: aServiceName type: aTypeName [
	^ proxy
		findOrRegisterServiceDescriptorByName: aServiceName
		type: aTypeName
]

{ #category : #delegate }
DDSRemoteDomainMirror >> findParticipantByName: aName [
	^ proxy findParticipantByName: aName
]

{ #category : #service }
DDSRemoteDomainMirror >> findServiceByName: aServiceName [
	^ proxy findServiceByName: aServiceName
]

{ #category : #query }
DDSRemoteDomainMirror >> findServiceByName: aServiceName ifFound: aBlockClosure ifNone: anOtherBlock [ 
	^ proxy findServiceByName: aServiceName ifFound: aBlockClosure ifNone: anOtherBlock 
]

{ #category : #'as yet unclassified' }
DDSRemoteDomainMirror >> forceReRegistrationOfPublication: aPublication for: aPublisher [ 
	| mirror |
	mirror := self reflectParticipant: aPublication participant.
	^ proxy registerTopicPublisher: aPublisher for: mirror in: domain.
]

{ #category : #'as yet unclassified' }
DDSRemoteDomainMirror >> forceReRegistrationOfService: aService for: aServiceServer [
	^ proxy
		registerServiceFor: aServiceServer participant name
		named: aService name
		at: (aServiceServer tcpUrl asZnUrl scheme: 'rosrpc') asString
		for: aServiceServer xmlrpcUrl asString
]

{ #category : #'as yet unclassified' }
DDSRemoteDomainMirror >> forceReRegistrationOfSubscription: aSubscription for: aSubscriber [ 
	| mirror |
	mirror := self reflectParticipant: aSubscription participant.
	^ proxy registerTopicSubscriber: aSubscriber for: mirror in: domain.
]

{ #category : #accessing }
DDSRemoteDomainMirror >> forceReconnect: aParticipant of: aSubscriber to: anUrl [
	| mirror |
	mirror := self reflectParticipant: aParticipant.
	^ (proxy participantServerFor: mirror) register: {anUrl} for: aSubscriber
]

{ #category : #initialization }
DDSRemoteDomainMirror >> initialize [
	super initialize.
	parameters := Set new.
]

{ #category : #'as yet unclassified' }
DDSRemoteDomainMirror >> lookupAndRegisterServiceServerFor: aMDDSDomainParticipant forCalling: aDDSService [
	| url |
	url := proxy
		lookupServiceServerFor: aMDDSDomainParticipant
		forCalling: aDDSService.
	url isNotEmpty
		ifTrue:
			[ 
			aDDSService
				registerServer: (DDSServiceRemoteServer on: url with: aDDSService at: domain) ]
]

{ #category : #parameters }
DDSRemoteDomainMirror >> noteParameterDeleted: aParameterAnnouncement [
	parameters remove: aParameterAnnouncement ifAbsent: [  ].

]

{ #category : #parameters }
DDSRemoteDomainMirror >> noteParameterSetted: aParameterAnnouncement [
	(parameters includes: aParameterAnnouncement parameter)
		ifTrue: [ proxy noteParameterSetted: aParameterAnnouncement ]
]

{ #category : #parameters }
DDSRemoteDomainMirror >> parameterNamed: aName for: aMDDSDomainParticipant ifNone: aBlockClosure [
	^ parameters
		detect: [ :p | p name = aName and: [ p participant = aMDDSDomainParticipant ] ]
		ifNone: [ 
			| parameter |
			parameter := proxy
				parameterNamed: aName
				for: (self reflectParticipant: aMDDSDomainParticipant)
				ifNone: [ ^ aBlockClosure value ].
			parameter domain: domain.
			parameters add: parameter.
			parameter ]
]

{ #category : #abstract }
DDSRemoteDomainMirror >> participantServerFor: aDDSDomainParticipant [
	^ proxy participantServerFor: aDDSDomainParticipant
]

{ #category : #API }
DDSRemoteDomainMirror >> registerServiceFor: aCallerId named: serviceName at: aROSRPCUrl for: aXMLRPCUrl [
	^ proxy
		registerServiceFor: aCallerId
		named: serviceName
		at: aROSRPCUrl
		for: aXMLRPCUrl
]

{ #category : #abstract }
DDSRemoteDomainMirror >> remoteUriFor: aParticipantName [
	^ proxy remoteUriFor: aParticipantName
]

{ #category : #accessing }
DDSRemoteDomainMirror >> removeParameterBindingNamed: aName for: aMDDSDomainParticipant [
	parameters
		detect: [ :p | p name = aName and: [ p participant = aMDDSDomainParticipant ] ]
		ifFound: [ :p | parameters remove: p ]
]

{ #category : #'type management' }
DDSRemoteDomainMirror >> serviceTypeDefinition: aTypeName ifAbsent: aBlockClosure [
	^ typesRegistry
		at: aTypeName
		ifAbsentPut: [ proxy serviceTypeDefinition: aTypeName ifAbsent: aBlockClosure ]
]

{ #category : #accessing }
DDSRemoteDomainMirror >> systemState [
	^ proxy systemState
]

{ #category : #abstract }
DDSRemoteDomainMirror >> uriFor: aMDDSDomainParticipantMirror [
	^ proxy uriFor: aMDDSDomainParticipantMirror
]

{ #category : #accessing }
DDSRemoteDomainMirror >> url [
	^ proxy url
]
