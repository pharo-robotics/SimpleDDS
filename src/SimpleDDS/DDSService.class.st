"
A service is a reification of a callable service. It may be exposed for remote usage or called for demanding a service to a remote participant.
"
Class {
	#name : #DDSService,
	#superclass : #MDDSEntity,
	#instVars : [
		'type',
		'servers'
	],
	#category : 'SimpleDDS-Services'
}

{ #category : #constructor }
DDSService class >> domain: aDomain name: aServiceName type: aType [
	^ self new
		name: aServiceName;
		type: aType;
		domain: aDomain;
		yourself
]

{ #category : #'as yet unclassified' }
DDSService >> callerFor: aParticipant [ 
	^ domain createServiceCallerFor: aParticipant forCalling: self.
]

{ #category : #accessing }
DDSService >> destroy [
	servers
		do: #destroy;
		removeAll.
	super destroy
]

{ #category : #'as yet unclassified' }
DDSService >> hasLocalServers [
	^ servers isNotEmpty and: [ servers anySatisfy: #isLocalServer ]
]

{ #category : #'as yet unclassified' }
DDSService >> hasServers [
	^ servers isNotEmpty
]

{ #category : #initialization }
DDSService >> initialize [
	super initialize.
	servers := OrderedCollection new
]

{ #category : #'as yet unclassified' }
DDSService >> registerServer: aServiceServer [
	servers add: aServiceServer.
	^ aServiceServer
]

{ #category : #'as yet unclassified' }
DDSService >> scanForServersFor: aParticipant ifNone: aBlock [
	domain lookupAndRegisterServiceServerFor: aParticipant forCalling: self.
	self hasServers
		ifFalse: [ aBlock value ]
]

{ #category : #'as yet unclassified' }
DDSService >> serve: aValuable for: aParticipant [
	^ self
		registerServer: (domain createServiceServerFor: aParticipant serving: aValuable for: self)
]

{ #category : #accessing }
DDSService >> server [
	self assert: servers asSet size = 1.
	^ servers first
]

{ #category : #accessing }
DDSService >> servers [
	^ servers
]

{ #category : #accessing }
DDSService >> type [
	^ type
]

{ #category : #accessing }
DDSService >> type: aType [
	type := aType
]
