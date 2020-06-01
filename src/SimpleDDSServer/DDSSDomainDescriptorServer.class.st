"
A domain descriptor server defines an API and it has one default way to serve it, that is through XMLRPC (ROS Compatible). It should be served in other protocols as well. 

In ros is what its called a Master
"
Class {
	#name : #DDSSDomainDescriptorServer,
	#superclass : #Object,
	#instVars : [
		'domain',
		'parameters'
	],
	#classInstVars : [
		'server',
		'serverDescriptor'
	],
	#category : #'SimpleDDSServer-Domain'
}

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer class >> serve: aDomain [
	^ self new domain: aDomain; yourself
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer class >> startSingleServer [
	server
		ifNil: [ server := self xmlrpcServerOn: DDSSDomainDescriptor new.
			serverDescriptor := DDSSDomainDescriptor new.
			server domain: serverDescriptor.
			server serveAt: 11311.
			self inform: 'Starting at port 11311' ]
		ifNotNil: [ self error: 'server already there.' ]
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer class >> stopSingleServer [
	server
		ifNotNil: [ server stop.
			server domain: nil.
			server := nil.
			serverDescriptor := nil ]
		ifNil: [ self error: 'server not there.' ]
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer class >> worldMenuOn: aBuilder [
	<worldMenu>
	

	(aBuilder item: 'Start SimpleDDS Server')
		parent: #Tools;
		order: 0;
		icon:( self iconNamed: #glamorousGo);
		help: 'Start an instance ';
		action: [ self startSingleServer ].
		
		(aBuilder item: 'Stop SimpleDDS Server')
		parent: #Tools;
		order: 0;
		icon:( self iconNamed: #stop);
		help: 'Stop an instance ';
		action: [ self stopSingleServer ]
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer class >> xmlrpcServerOn: aDomain [
	^ DDSDomainDescriptorXMLRPCServer serve: aDomain.
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer >> deleteParam: aCallerId named: aParameterName [
	^ (parameters lookupParameterInPath: (DDSSParameterPath fromRos: aCallerId and: aParameterName)) delete.
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer >> domain: aDomain [
	domain := aDomain.
	parameters := DDSSNamespace newRootAt: aDomain.
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer >> getParam: aCallerId named: aParameterName [
	^ (parameters lookupParameterInPath: (DDSSParameterPath fromRos: aCallerId and: aParameterName)) value
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer >> getParamNames: aCallerId [
	^ (parameters lookupParameterInPath: (DDSSParameterPath fromRos: aCallerId )) names asArray
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer >> getPid: aCallerID [
	^self error: 'Must implement'
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer >> getSystemState: aCallerId [
	^ {((domain topics
		collect: [ :t | 
			{(t name).
			((t subscribed collect: #name) asArray)} ]) asArray).
	((domain topics
		collect: [ :t | 
			{(t name).
			((t publishers collect: #name) asArray)} ]) asArray).
	{}}
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer >> getTopicTypes: aCallerId [
	^ (domain topics
		collect: [ :t | 
			{(t name).
			(t type name)} ]) asArray
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer >> getUri: aCallerId [
	^ 'http://127.0.0.1:11311'
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer >> hasParam: aCallerId named: aParameterName [
	^ (parameters lookupParameterInPath: (DDSSParameterPath fromRos: aCallerId and: aParameterName)) value isNotNil
]

{ #category : #implemented }
DDSSDomainDescriptorServer >> lookupNode: aCallerId named: aName [
	^ (domain participants detect: [ :p | p name = aName ]) url
]

{ #category : #unimplemented }
DDSSDomainDescriptorServer >> lookupService: aCallerId named: aName [
	^ { }
]

{ #category : #implemented }
DDSSDomainDescriptorServer >> registerPublisher: aCallerId to: aTopicName with: aTopicMessageType andCallerUri: anUri [
	| topic participant |
	topic := domain topicDescriptorFor: aTopicName andType: aTopicMessageType.
	participant := domain participantDescriptorFor: aCallerId connectedAt: anUri.
	topic publisher publishing: participant.
	^ (topic subscribed collect: #uri) asArray
]

{ #category : #unimplemented }
DDSSDomainDescriptorServer >> registerServiceFor: aCallerId named: serviceName at: aROSRPCUrl for: aXMLRPCUrl [ 
	^ {  } .
]

{ #category : #implemented }
DDSSDomainDescriptorServer >> registerSubscriber: aCallerId to: aTopicName with: aTopicMessageType andCallerUri: anUri [
	| topic participant |
	topic := domain topicDescriptorFor: aTopicName andType: aTopicMessageType.
	participant := domain participantDescriptorFor: aCallerId connectedAt: anUri.
	topic subscriber subscribe: participant.
	^ (topic publishers collect: #uri) asArray
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer >> serveAt: aPort [
	self subclassResponsibility.
	
]

{ #category : #unimplemented }
DDSSDomainDescriptorServer >> setParam: aCallerId named: aParameterName with: anObject [
	(parameters lookupOrCreateParameterInPath: (DDSSParameterPath fromRos: aCallerId and: aParameterName)) value: anObject.
	^ true
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer >> stop [
	
]

{ #category : #unimplemented }
DDSSDomainDescriptorServer >> subscribeParam: aCallerId  callingBack: anUri forParameter: aParameterName [ 
	(domain participantDescriptorFor: aCallerId connectedAt: anUri)
		subscribe: (parameters lookupOrCreateParameterInPath: (DDSSParameterPath fromRos: aCallerId and: aParameterName)).
	^ true
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptorServer >> unimplemented [
	
	self error: #unimplemented

]

{ #category : #implemented }
DDSSDomainDescriptorServer >> unregisterPublisher: aCallerId from: aTopicName andCallerUri: anUri [
	| topic participant ret |
	topic := domain topicDescriptorFor: aTopicName.
	participant := domain participantDescriptorFor: aCallerId connectedAt: anUri.
	[ 
	topic publisher stopPublishing: participant.
	ret := 1 ]
		on: Error
		do: [ ret := 0 ].
	^ ret
]

{ #category : #unimplemented }
DDSSDomainDescriptorServer >> unregisterService: serviceName at: aROSRPCUrl for: aXMLRPCUrl [ 
	^ 1.
]

{ #category : #implemented }
DDSSDomainDescriptorServer >> unregisterSubscriber: aCallerId from: aTopicName andCallerUri: anUri [
	| topic participant ret |
	topic := domain topicDescriptorFor: aTopicName.
	participant := domain participantDescriptorFor: aCallerId connectedAt: anUri.
	[ 
	topic subscriber unsubscribe: participant.
	ret := 1 ]
		on: Error
		do: [ ret := 0 ].
	^ ret
]

{ #category : #unimplemented }
DDSSDomainDescriptorServer >> unsubscribeParam: aParameterName callingBack: anXMLRPCUrl for: aCallerId [
	self unimplemented
]
