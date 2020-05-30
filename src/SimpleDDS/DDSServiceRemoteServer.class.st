"
A DDSServiceRemoteServer represnets a remote implementation of a service. This object is able to call a remote service throguh a given protocol, object that will care about the marshalling 
"
Class {
	#name : #DDSServiceRemoteServer,
	#superclass : #Object,
	#instVars : [
		'serverUrl',
		'service',
		'domain'
	],
	#category : 'SimpleDDS-Services'
}

{ #category : #'as yet unclassified' }
DDSServiceRemoteServer class >> on: aStringUrl with: aService at: aDomain [
	^ self new
		serverUrl: aStringUrl asUrl;
		service: aService;
		domain: aDomain;
		yourself
]

{ #category : #'as yet unclassified' }
DDSServiceRemoteServer >> connectAndCloseFor: aDDSDomainParticipant for: aBlockClosure [
	| connection |
	connection := self protocol
		connect:
			(DDSServiceConnectionPetition
				participant: aDDSDomainParticipant
				url: serverUrl
				service: service).
	connection setAsClientSideConnection.
	connection
		inputMarshaller: service type responseMarshaller;
		outputMarshaller: service type requestMarshaller.
	^ [ aBlockClosure value: connection ]
		ensure: [ connection destroy ]
]

{ #category : #accessing }
DDSServiceRemoteServer >> destroy [
	domain := nil.
	service := nil
]

{ #category : #accessing }
DDSServiceRemoteServer >> domain: aDomain [
	domain := aDomain
]

{ #category : #'as yet unclassified' }
DDSServiceRemoteServer >> evaluate: aRequest for: aDDSDomainParticipant [
	^ self
		connectAndCloseFor: aDDSDomainParticipant
		for: [ :rwconn | 
			rwconn write: aRequest.
			rwconn read ]
]

{ #category : #testing }
DDSServiceRemoteServer >> isLocalServer [
	^ false
]

{ #category : #accessing }
DDSServiceRemoteServer >> protocol [
	^ domain protocols anyOne
]

{ #category : #accessing }
DDSServiceRemoteServer >> serverUrl: aZnUrl [
	serverUrl := aZnUrl
]

{ #category : #accessing }
DDSServiceRemoteServer >> service: aService [
	service := aService
]
