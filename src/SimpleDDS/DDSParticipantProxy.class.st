"
Proxy to access information from a remote participant.
"
Class {
	#name : #DDSParticipantProxy,
	#superclass : #MDDSAbstractParticipantProxy,
	#instVars : [
		'proxy'
	],
	#category : #'SimpleDDS-Proxy'
}

{ #category : #'as yet unclassified' }
DDSParticipantProxy class >> on: anURL [

	^ self new proxy: (DDSXMLRPCDomainParticipantProxy url: anURL); yourself.
]

{ #category : #'as yet unclassified' }
DDSParticipantProxy >> busInfo [
	^ proxy getBusInfo: '/NotActualIDNeededHere'
]

{ #category : #'as yet unclassified' }
DDSParticipantProxy >> getPid [
	^ proxy getPid: '/NotActualIDNeededHere'
]

{ #category : #'publishing metadata' }
DDSParticipantProxy >> informFrom: aCallerID for: aTopic publishers: aSetOfPublishers [
	proxy informFrom: aCallerID for: aTopic name publishers: (aSetOfPublishers collect: #uri) asArray.
	
]

{ #category : #'as yet unclassified' }
DDSParticipantProxy >> noteParameterChanged: aParameter for: aCallerID [
	[ proxy from: aCallerID update: aParameter name with: aParameter value ]
		on: ConnectionTimedOut
		do: [ 
			self traceCr: 'Error informing parameter' ]
]

{ #category : #'as yet unclassified' }
DDSParticipantProxy >> possibleConnectionsFor: aSubscriber for: aParticipantMirror in: aDomain [
	| retrieve |
	retrieve := proxy
		requestFor: aParticipantMirror name
		theTopic: aSubscriber topic name
		withProtocol: (aParticipantMirror protocols collect: #name).
	^ MDDSConnectionPetition
		protocolName: (retrieve at: 1)
		ip: (retrieve at: 2)
		port: (retrieve at: 3)
		subscriber: aSubscriber
		participant: aParticipantMirror
]

{ #category : #accessing }
DDSParticipantProxy >> proxy [ 
	^ proxy
]

{ #category : #accessing }
DDSParticipantProxy >> proxy: aProxy [
	proxy := aProxy 
]

{ #category : #handlers }
DDSParticipantProxy >> shutdown: aCause [
	^ proxy shutdown:'/NotActualIDNeededHere' cause: aCause.
]
