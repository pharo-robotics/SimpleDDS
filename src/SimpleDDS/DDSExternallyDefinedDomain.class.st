"
This externally defined subclass adds parameter management.
"
Class {
	#name : #DDSExternallyDefinedDomain,
	#superclass : #MDDSExternallyDefinedDomain,
	#instVars : [
		'participants',
		'monitor',
		'createdServices'
	],
	#category : #'SimpleDDS-Domain'
}

{ #category : #construction }
DDSExternallyDefinedDomain class >> onSimpleDDS: anUrl [
	^ self on: (DDSRemoteDomainMirror onSimpleDDS: anUrl)
]

{ #category : #parameters }
DDSExternallyDefinedDomain >> createParameterNamed: aName for: aParticipant [
	^ mirror createParameterNamed: aName for: aParticipant
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomain >> createServiceCallerFor: aMDDSDomainParticipant forCalling: aDDSService [
	^ mirror
		createServiceCallerFor: aMDDSDomainParticipant
		forCalling: aDDSService
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomain >> createServiceNamed: aServiceName type: aDDSServiceType [
	^ self createdServices
		at: aServiceName
		ifAbsentPut: [ DDSService domain: self name: aServiceName type: aDDSServiceType ]
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomain >> createServiceServerFor: aMDDSDomainParticipant serving: aValuable for: aDDSService [
	^ aDDSService hasServers
		ifTrue:
			[ 
			aDDSService server participant = aMDDSDomainParticipant
				ifTrue: [ aDDSService server valuable: aValuable ]
				ifFalse: [ self error: ' Multi servers is not yet allowed' ] ]
		ifFalse:
			[ 
			| server |
			server := (DDSExposedServiceServer
				for: aMDDSDomainParticipant
				serving: aValuable
				for: aDDSService)
				start;
				yourself.
			self
				registerServiceFor: aMDDSDomainParticipant name
				named: aDDSService name
				at: (server tcpUrl asZnUrl scheme: 'rosrpc') asString
				for: server xmlrpcUrl asString.
			server ]
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomain >> createServiceTypeNamed: aName definedBy: aDDSServiceTypeDefinition [
	^ DDSServiceType
		domain: self
		name: aName
		responseMarshaller:
			aDDSServiceTypeDefinition response typeBuilder buildTypeMarshaller
		requestMarshaller:
			aDDSServiceTypeDefinition request typeBuilder buildTypeMarshaller
		md5sum: aDDSServiceTypeDefinition md5sum
]

{ #category : #accessing }
DDSExternallyDefinedDomain >> createdServices [
	^ createdServices 
]

{ #category : #accessing }
DDSExternallyDefinedDomain >> createdTopics [
	^ createdTopics values
]

{ #category : #accessing }
DDSExternallyDefinedDomain >> destroy [

	monitor ifNotNil: [ 
		monitor destroy.
		monitor := nil ].
	createdServices
		valuesDo: #destroy;
		removeAll.
	super destroy
]

{ #category : #query }
DDSExternallyDefinedDomain >> findOrRegisterServiceByName: aServiceName [
	^ self findOrRegisterServiceByName: aServiceName type: MDDSTypeDescriptor unknownWildcard
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomain >> findOrRegisterServiceByName: aServiceName type: aTypeName [
	^ self
		findServiceByName: aServiceName
		ifFound: [ :s | 
			self assert: s type name = aTypeName.
			s ]
		ifNone: [ (mirror
				findOrRegisterServiceDescriptorByName: aServiceName
				type: aTypeName)
				domain: self;
				createService ]
]

{ #category : #service }
DDSExternallyDefinedDomain >> findServiceByName: aServiceName [
	^ self findServiceByName: aServiceName ifNone: [ MDDSError signal: 'There is not service called ' , aServiceName ]
]

{ #category : #query }
DDSExternallyDefinedDomain >> findServiceByName: aServiceName ifFound: aBlockClosure ifNone: anOtherBlock [
	^ self services
		detect: [ :s | s name = aServiceName ]
		ifFound: aBlockClosure
		ifNone: [ 
			^ mirror
				findServiceByName: aServiceName
				ifFound: [ :serviceDescriptor | 
					serviceDescriptor domain: self.
					aBlockClosure cull: serviceDescriptor createService ]
				ifNone: anOtherBlock ]
]

{ #category : #query }
DDSExternallyDefinedDomain >> findServiceByName: aServiceName ifNone: aBlockClosure [
	^ self findServiceByName: aServiceName ifFound: [  ] ifNone: aBlockClosure
]

{ #category : #initialization }
DDSExternallyDefinedDomain >> initialize [
	super initialize.
	self when: DDSParameterHasBeenSetted send: #noteParameterSetted: to: self.
	self when: DDSParameterHasBeenDeleted send: #noteParameterDeleted: to: self.
	self when: DDSParameterHasChanged send: #noteParameterChanged: to: self.
	participants := Set new.
	createdServices := Dictionary new.
	monitor := DDSServiceMonitor for: self.
]

{ #category : #testing }
DDSExternallyDefinedDomain >> isConnected [

	^ [ 
	  mirror systemState.
	  ^ true ]
		  on: ConnectionTimedOut
		  do: [ :e | ^ false ]
]

{ #category : #testing }
DDSExternallyDefinedDomain >> isServiceTypeDefined: aServiceTypeName [
	self serviceTypeDefinition: aServiceTypeName ifAbsent: [ ^ false ].
	^ true
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomain >> lookupAndRegisterServiceServerFor: aDDSDomainParticipant forCalling: aDDSService [
	^ mirror lookupAndRegisterServiceServerFor: aDDSDomainParticipant forCalling: aDDSService
]

{ #category : #accessing }
DDSExternallyDefinedDomain >> name [
	^ 'ExternalDomain'
]

{ #category : #accessing }
DDSExternallyDefinedDomain >> noteParameterChanged: aParameterAnnouncement [

]

{ #category : #parameters }
DDSExternallyDefinedDomain >> noteParameterDeleted: aParameterAnnouncement [
	mirror noteParameterDeleted: aParameterAnnouncement 
]

{ #category : #parameters }
DDSExternallyDefinedDomain >> noteParameterSetted: aParameterAnnouncement [ 
	mirror noteParameterSetted: aParameterAnnouncement .
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomain >> parameterNamed: aParameterName for: aParticipant [
	^ self parameterNamed: aParameterName for: aParticipant ifNone: [ self error: 'There is not parameter named ' , aParameterName ]
]

{ #category : #parameters }
DDSExternallyDefinedDomain >> parameterNamed: aParameterName for: aParticipant ifNone: aBlock [
	^ mirror parameterNamed: aParameterName for: aParticipant ifNone: aBlock
]

{ #category : #abstract }
DDSExternallyDefinedDomain >> participantServerFor: aDDSDomainParticipant [ 
	^ mirror participantServerFor: aDDSDomainParticipant 
]

{ #category : #accessing }
DDSExternallyDefinedDomain >> participants [
	| freshParticipants toRemove |
	freshParticipants := super participants.
	toRemove := Set new.
	" Does a first pass through the cached participants to check removed and updated participants "
	participants
		do:
			[ :participant | freshParticipants
				detect: [ :fresh | fresh name = participant name ]
				ifFound: [ :relative | participant proxy url = relative proxy url
						ifFalse: [ participant proxy setUrl: relative proxy url ] ]
				ifNone: [ toRemove add: participant ] ].
	" Remove the removed participants "
	participants removeAll: toRemove.

	"Add all the participants in freshParticipants that have not relative "
	participants
		addAll:
			(freshParticipants reject: [ :fresh | participants detect: [ :p | p name = fresh name ] ifFound: [ true ] ifNone: [ false ] ]).
	^ participants
]

{ #category : #accessing }
DDSExternallyDefinedDomain >> reflectParticipant: aDDSDomainParticipant [
	^ mirror reflectParticipant: aDDSDomainParticipant
]

{ #category : #API }
DDSExternallyDefinedDomain >> registerServiceFor: aCallerId named: serviceName at: aROSRPCUrl for: aXMLRPCUrl [
	^ mirror
		registerServiceFor: aCallerId
		named: serviceName
		at: aROSRPCUrl
		for: aXMLRPCUrl
]

{ #category : #accessing }
DDSExternallyDefinedDomain >> removeParameterBindingNamed: aName for: aMDDSDomainParticipant [ 
	mirror removeParameterBindingNamed: aName for: aMDDSDomainParticipant .
		
]

{ #category : #'type management' }
DDSExternallyDefinedDomain >> serviceTypeDefinition: typeName ifAbsent: aBlockClosure [ 
	^ mirror serviceTypeDefinition: typeName ifAbsent: aBlockClosure
]

{ #category : #'System-FileRegistry' }
DDSExternallyDefinedDomain >> services [
	^ self createdServices values
]

{ #category : #abstract }
DDSExternallyDefinedDomain >> uriFor: aMDDSDomainParticipantMirror [ 
	^ mirror uriFor: aMDDSDomainParticipantMirror 
]
