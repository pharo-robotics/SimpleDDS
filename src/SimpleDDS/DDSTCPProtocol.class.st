"
Implementation of a protocol that uses all the default things (encoder decoder, etc). but each package has its own size at the very beginning. 


It uses as well a second protocol for the handshake time, and it manages what is connection (accepting and connecting) based on TCPprotocol
"
Class {
	#name : #DDSTCPProtocol,
	#superclass : #MDDSProtocol,
	#instVars : [
		'headerProtocol'
	],
	#classInstVars : [
		'headerDefinition',
		'header'
	],
	#category : 'SimpleDDS-Protocols'
}

{ #category : #'as yet unclassified' }
DDSTCPProtocol class >> header [
	^ header ifNil: [
		 header := self headerDefinition typeBuilder buildTypeMarshaller.
	]
]

{ #category : #'as yet unclassified' }
DDSTCPProtocol class >> headerDefinition [
	^ headerDefinition ifNil: [ headerDefinition := MDDSBasicTypeDefinition for: (MDDSHeaderType new).]
]

{ #category : #visitor }
DDSTCPProtocol >> acceptConnectionFrom: aSocketListener with: aSetOfOffers [
	| socket stream |
	socket := nil.
	[ socket isNil ] whileTrue: [ socket := aSocketListener waitForAcceptFor: 9000 ].
	stream := SocketStream on: socket.
	stream binary.
	self flag: #performance.	" this creation may be good to be done in the connection offer, to have different kind of writing connections per kind of topic it may be good. Check in the MDDSWritingConnection performance flag."
	^ self shakeHandsForAcceptWith: socket and: stream accordingTo: aSetOfOffers
]

{ #category : #'as yet unclassified' }
DDSTCPProtocol >> backlogSize [
	^ 255
]

{ #category : #'as yet unclassified' }
DDSTCPProtocol >> connect: aMDDSConnectionPetition [
	| socket stream |
	socket := Socket newTCP.
	stream := SocketStream on: socket.
	stream binary.
	socket
		connectTo: (self resolveIpForPetition: aMDDSConnectionPetition)
		port: aMDDSConnectionPetition port.
	^ self shakeHandsWith: socket and: stream accordingTo: aMDDSConnectionPetition
]

{ #category : #'as yet unclassified' }
DDSTCPProtocol >> createSocketForlistenAt: anIP on: aPort [
	^ Socket newTCP
		listenOn: aPort backlogSize: self backlogSize interface: anIP;
		yourself
]

{ #category : #reporting }
DDSTCPProtocol >> header [
	^ self class header
]

{ #category : #accessing }
DDSTCPProtocol >> headerProtocol [
	^ headerProtocol
		ifNil: [ headerProtocol := MDDSHeaderProtocol encoding: MDDSHeaderEncoder decoding: MDDSHeaderDecoder ]
]

{ #category : #testing }
DDSTCPProtocol >> isTCP [
	^ true
]

{ #category : #accessing }
DDSTCPProtocol >> name [ 
	^ 'TCP'.
]

{ #category : #'as yet unclassified' }
DDSTCPProtocol >> resolveIpForPetition: aDDSServiceConnectionPetition [
	^ NetNameResolver
		addressFromString:
			((aDDSServiceConnectionPetition ip = NetNameResolver localHostName
				or: [ aDDSServiceConnectionPetition ip = #localhost ])
				ifTrue: [ NetNameResolver localAddressString ]
				ifFalse: [ aDDSServiceConnectionPetition ip ])
]

{ #category : #'as yet unclassified' }
DDSTCPProtocol >> shakeHandsForAcceptWith: aSocket and: aStream accordingTo: aSetOfPetitionHandlers [
	| rawdata receivedHeader handlers |
	" Recv connection headers "
	receivedHeader := self headerProtocol loadStream: aStream with: self header.
	handlers := (aSetOfPetitionHandlers select: [ :h | h validateAndProcessHeader: receivedHeader ])
		asOrderedCollection.
	handlers isEmpty
		ifTrue: [ 
			aStream close.
			self error: 'Invalid header!' ].
	" Send connection headers "
	rawdata := self headerProtocol
		dump: (self header newInstance loadFrom: handlers first)
		with: self header.
	aSocket sendData: rawdata.
	^ receivedHeader probe = 1
		ifTrue: [  ]
		ifFalse:
			[ 
			handlers first
				createConnectionFor: self
				on: aSocket
				and: aStream
				for: receivedHeader callerId ]
]

{ #category : #'as yet unclassified' }
DDSTCPProtocol >> shakeHandsWith: aSocket and: aStream accordingTo: aMDDSConnectionPetition [
	| rawdata receivedHeader |
	" Send connection headers "
	rawdata := self headerProtocol
		dump:
			(self header newInstance loadFrom: aMDDSConnectionPetition)
		with: self header.
	aSocket sendData: rawdata.	" Recv connection headers "
	receivedHeader := self headerProtocol
		loadStream: aStream
		with: self header.
	(aMDDSConnectionPetition validateAndProcessHeader: receivedHeader)
		ifFalse: [ self error: 'Invalid header!' ].
	^ aMDDSConnectionPetition
		createConnectionFor: self
		on: aSocket
		and: aStream
		for: receivedHeader callerId
]
