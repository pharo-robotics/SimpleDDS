"
The DDSDomainParticipant adds a server collection. One per available protocol. 
"
Class {
	#name : #DDSDomainParticipant,
	#superclass : #MDDSDomainParticipant,
	#instVars : [
		'servers',
		'offers'
	],
	#category : 'SimpleDDS-Publishing'
}

{ #category : #initialization }
DDSDomainParticipant >> initialize [
	super initialize.
	servers := OrderedCollection new
]

{ #category : #accessing }
DDSDomainParticipant >> offers [
	^ offers ifNil: [ offers := Set new ]
]

{ #category : #accessing }
DDSDomainParticipant >> offersOfConnection [
	^ offers
]

{ #category : #registration }
DDSDomainParticipant >> registerConnectionOffer: aConnectionOffer [
	self offers add: aConnectionOffer.
	self offers size = 1 ifTrue: [ self startServers ]
]

{ #category : #accessing }
DDSDomainParticipant >> relatedTcpServer [
	^ servers detect: [ :s | s isTCP ]
]

{ #category : #accessing }
DDSDomainParticipant >> relatedXmlRpcServerUrl [
	^ domain uriFor: (domain reflectParticipant: self)
]

{ #category : #accessing }
DDSDomainParticipant >> servers [
	^ servers
]

{ #category : #run }
DDSDomainParticipant >> startServers [
	servers isEmptyOrNil
		ifTrue:
			[ 
			servers := self protocols
				collect: [ :protocol | 
					DDSParticipantProtocolServer
						startOn: self ip
						at: (self obtainPortFor: protocol)
						for: protocol
						participant: self ] ].
]

{ #category : #run }
DDSDomainParticipant >> stopServers [
	servers
		do: #stop;
		removeAll
]

{ #category : #registration }
DDSDomainParticipant >> unregisterConnectionOffer: aConnectionOffer [
	offers remove: aConnectionOffer.
	offers isEmpty ifTrue: [ self stopServers ]
]
