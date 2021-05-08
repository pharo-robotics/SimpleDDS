"
This connection is an Inputoutput connections, basiclly needed for services. 

Since is just used for services, it has two modes: client and server.

The main difference is the way to inform the errors
"
Class {
	#name : #DDSReadWriteNetworkConnection,
	#superclass : #MDDSConnection,
	#instVars : [
		'stream',
		'socket',
		'participantName',
		'outputMarshaller',
		'inputMarshaller',
		'isAServerSideConnection'
	],
	#category : 'SimpleDDS-Services'
}

{ #category : #'as yet unclassified' }
DDSReadWriteNetworkConnection class >> protocol: aProtocol socket: aSocket stream: aStream relatedParticipantName: aRelatedParticipantName [
	^ self new
		protocol: aProtocol;
		socket: aSocket;
		stream: aStream;
		participantName: aRelatedParticipantName;
		yourself
]

{ #category : #'as yet unclassified' }
DDSReadWriteNetworkConnection class >> protocol: aProtocol socket: aSocket stream: aStream relatedParticipantName: aRelatedParticipantName inputMarshaller: aMarshaller outputMarshaller: anOtherMarshaller [
	^ self new
		protocol: aProtocol;
		socket: aSocket;
		stream: aStream;
		participantName: aRelatedParticipantName;
		inputMarshaller: aMarshaller;
		outputMarshaller: anOtherMarshaller;
		yourself
]

{ #category : #'initialize-release' }
DDSReadWriteNetworkConnection >> close [
	stream close
]

{ #category : #accessing }
DDSReadWriteNetworkConnection >> destroy [
	stream close.
	stream := nil.
	socket := nil.
	inputMarshaller := nil.
	outputMarshaller := nil
]

{ #category : #initialization }
DDSReadWriteNetworkConnection >> initialize [
	super initialize.
	isAServerSideConnection := false.
]

{ #category : #accessing }
DDSReadWriteNetworkConnection >> inputMarshaller: anInputMarshaller [
	inputMarshaller := anInputMarshaller
]

{ #category : #testing }
DDSReadWriteNetworkConnection >> isError [
	" Mind that is error does not consumes data "

	^ (stream peek: 4) = #[0 0 0 0]
]

{ #category : #accessing }
DDSReadWriteNetworkConnection >> outputMarshaller: anOutputMarshaller [
	outputMarshaller := anOutputMarshaller
]

{ #category : #accessing }
DDSReadWriteNetworkConnection >> participantName: aParticipantName [
	participantName := aParticipantName
]

{ #category : #accessing }
DDSReadWriteNetworkConnection >> read [
	isAServerSideConnection
		ifFalse:
			[ self isError
				ifTrue:
					[ DDSServiceCallFailed signal: 'Remote error executing the called service'.
					^ self ] ].
	^ protocol loadStream: stream with: inputMarshaller
]

{ #category : #'as yet unclassified' }
DDSReadWriteNetworkConnection >> setAsClientSideConnection [
	isAServerSideConnection := false.
]

{ #category : #'as yet unclassified' }
DDSReadWriteNetworkConnection >> setAsServerSideConnection [
	isAServerSideConnection := true.
]

{ #category : #accessing }
DDSReadWriteNetworkConnection >> socket: aSocket [
	socket := aSocket
]

{ #category : #accessing }
DDSReadWriteNetworkConnection >> stream: aStream [
	stream := aStream
]

{ #category : #'filter streaming' }
DDSReadWriteNetworkConnection >> write: aDataValue [
	^ socket
		sendData:
			(isAServerSideConnection
				ifTrue: [ {1. } ]
				ifFalse: [ {} ]) asByteArray , (protocol dump: aDataValue with: outputMarshaller)
]
