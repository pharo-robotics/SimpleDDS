Class {
	#name : #DDSParameterManagement,
	#superclass : #TestCase,
	#instVars : [
		'tcpProtocol',
		'domain',
		'mirror',
		'participant',
		'participant2',
		'server'
	],
	#category : 'SimpleDDSServerTesting-parameters'
}

{ #category : #'as yet unclassified' }
DDSParameterManagement >> createNewParameterNamed: aName [ 
	^ domain createParameterNamed: aName for: participant
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> createTestedParameterWithValue: aValue [
	^ (domain createParameterNamed: '/tested_parameter' for: participant) set: aValue.
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> expectedFailures [
	" Must be implemented first "

	^ #(#testForBugJustCreatedParameterHasBeenProperlyBinded)
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> getParameterNamed: aName [ 
	^self getParameterNamed: aName or: [ self error: 'Parameter not found']
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> getParameterNamed: aName or: aBlock [
	^ domain parameterNamed: aName for: participant ifNone: aBlock
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> getParameterTestedParameterOr: aBlock [
	^ self getParameterNamed: '/tested_parameter' or: aBlock 
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> getParameterWithDifferentParticipantNamed: aName [
	^ domain parameterNamed: aName for: participant2 ifNone: [ self error:' unknown parameter ' , aName ].
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> removeParameterBindingNamed: aName [ 
	^ domain removeParameterBindingNamed: aName for: participant.
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> setUp [
	super setUp.
	" server "
	server := DDSSDomainDescriptorServer xmlrpcServerOn: DDSSDomainDescriptor new.
	server domain: DDSSDomainDescriptor new.
	server serveAt: 11311.
	" domain "
	domain := DDSExternallyDefinedDomain onLocalSimpleDDS: server.
	mirror := domain mirror.
	participant := MDDSDomainParticipant domain: domain name: 'adhoc-participant' ip: '127.0.0.1'.
	participant2 := MDDSDomainParticipant domain: domain name: 'other-participant' ip: '127.0.0.1'
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> sexpectedFailures [
	" Must be implemented first "

	^ #(#testForBugJustCreatedParameterHasBeenProperlyBinded)
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> tearDown [
	super tearDown.
	
	domain destroy.
	domain := nil.
	server stop.
	server := nil.
	
	5 timesRepeat: [ Smalltalk garbageCollect ]
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> testAccessExistantParameter [
	| parameter thereIsNoParameter |
	thereIsNoParameter := false.
	self createTestedParameterWithValue: false.
	parameter := self getParameterTestedParameterOr: [ thereIsNoParameter := true ].
	self deny: thereIsNoParameter.
	self assert: (parameter isKindOf: DDSBindedParameter)
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> testCreateParameterModifyDomain [
	| createdParameter gettedParameter |

	createdParameter := self createNewParameterNamed: '/parameter'.
	createdParameter set: 'Value'.
	self removeParameterBindingNamed: createdParameter name.
	gettedParameter := self getParameterNamed: '/parameter'.
	self assert: gettedParameter get = createdParameter get.
	self deny: gettedParameter = createdParameter.
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> testDictionaryValue [
	| parameter thereIsNoParameter |
	thereIsNoParameter := false.
	self createTestedParameterWithValue: false.
	parameter := self getParameterTestedParameterOr: [ thereIsNoParameter := true ].

	parameter set: Dictionary new. 
	parameter transform: [ : val | val at: 'lalaas' put: 'blas'. val ].
	self assert: (parameter get at: 'lalaas')= 'blas'
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> testForBugJustCreatedParameterHasBeenProperlyBinded [
	| parameter parameter2 name |
	name := '/parameter' , UUID new asString.
	parameter := self createNewParameterNamed: name.
	parameter set: 'value'.
	parameter2 := self getParameterWithDifferentParticipantNamed: name.
	self assert: parameter2 get = parameter get.
	self assert: parameter2 get = 'value'.
	self deny: parameter2 = parameter.
	self deny: parameter2 participant = parameter participant.
	parameter2 set:'othervalue'.
	500 milliSeconds wait. 
	self assert: parameter2 get = parameter get.
	self assert: parameter2 get = 'othervalue'.
	parameter set:'anOtherValue'.
	500 milliSeconds wait. 
	self assert: parameter2 get = parameter get.
	self assert: parameter2 get = 'anOtherValue'.
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> testGetParameterGetsSameParameter [
	| parameter thereIsNoParameter |
	self createTestedParameterWithValue: false.
	thereIsNoParameter := false.
	parameter := self getParameterTestedParameterOr: [ thereIsNoParameter := true ].
	self deny: thereIsNoParameter.
	self assert: (parameter == (self getParameterTestedParameterOr: [ thereIsNoParameter := true ])).
	self deny: thereIsNoParameter
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> testNonSetedParameterExecutesBlock [
	| blockExecuted |
	blockExecuted := false.
	self getParameterNamed: '/non_setted_parameter' or: [ blockExecuted := true ].
	self assert: blockExecuted
]

{ #category : #'as yet unclassified' }
DDSParameterManagement >> testSetParameterChangesValue [
	| parameter parameter2 thereIsNoParameter |
	thereIsNoParameter := false.
	self createTestedParameterWithValue: false.
	parameter := self getParameterTestedParameterOr: [ thereIsNoParameter := true ].
	self deny: thereIsNoParameter.
	self deny: parameter get.
	parameter set: true.
	self assert: parameter get.
	self removeParameterBindingNamed: parameter name.
	parameter2 := self getParameterTestedParameterOr: [ thereIsNoParameter := true ].
	self deny: thereIsNoParameter.
	self deny: parameter == parameter2.
	self assert: parameter2 get
]
