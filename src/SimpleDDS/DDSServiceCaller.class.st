"
A service caller is an object capable to find the object in charge of 'serving' locally  (a local implementation or a proxy to a remote implementation), and ask for the service, giving back the response of the service execution. 
"
Class {
	#name : #DDSServiceCaller,
	#superclass : #Object,
	#instVars : [
		'participant',
		'service'
	],
	#category : 'SimpleDDS-Services'
}

{ #category : #'as yet unclassified' }
DDSServiceCaller class >> for: aMDDSDomainParticipant on: aDDSService [
	^ self new
		participant: aMDDSDomainParticipant;
		service: aDDSService;
		yourself
]

{ #category : #'as yet unclassified' }
DDSServiceCaller >> call: aBlockClosure [
	| request |
	
 	self isConnected
		ifFalse: [ self scanForServersIfNone: [ MDDSError signal: 'The service is not connected' ] ].
	service type isTypePlaceHolder
		ifTrue: [ MDDSError signal: 'The service type is not correctly defined' ].
	request := service type requestMarshaller newInstance.
	aBlockClosure value: request.
	^ self invokeWith: request
]

{ #category : #invoking }
DDSServiceCaller >> invokeWith: aRequest [
	self assert: service servers size = 1 description: 'Multiservers?'.
	^ service servers first evaluate: aRequest for: participant
]

{ #category : #testing }
DDSServiceCaller >> isConnected [
	^ service hasServers
]

{ #category : #accessing }
DDSServiceCaller >> participant: aMDDSDomainParticipant [
	participant := aMDDSDomainParticipant
]

{ #category : #'as yet unclassified' }
DDSServiceCaller >> scanForServersIfNone: aBlock [
	^ service scanForServersFor: participant ifNone: aBlock
]

{ #category : #accessing }
DDSServiceCaller >> service: aDDSService [
	service := aDDSService
]
