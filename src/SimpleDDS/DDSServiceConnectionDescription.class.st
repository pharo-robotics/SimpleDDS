"
A service connection description is a descriptor for connecting  in or out. just for services, since the connection constructed is different and the idea is to open input-output eventual connections
"
Class {
	#name : #DDSServiceConnectionDescription,
	#superclass : #MDDSConnectionDescription,
	#instVars : [
		'service'
	],
	#category : #'SimpleDDS-Protocols'
}

{ #category : #'as yet unclassified' }
DDSServiceConnectionDescription >> configureHeader: aMDDSHandshakeHeader [
	aMDDSHandshakeHeader
		callerId: self participant name;
		latching: self latching;
		service: service name;
		type: service type name;
		requestType:  service type name, 'Request';
		responseType:  service type name, 'Response';
		md5sum: (service type md5sum ifNil: [ '' ] );
		message_definition: service type plainDefinition
]

{ #category : #'as yet unclassified' }
DDSServiceConnectionDescription >> createConnectionFor: aProtocol on: aSocket and: aStream for: aParticipantName [
	^ self
		noteNewConnection:
			(DDSReadWriteNetworkConnection
				protocol: aProtocol
				socket: aSocket
				stream: aStream
				relatedParticipantName: aParticipantName)
]

{ #category : #'as yet unclassified' }
DDSServiceConnectionDescription >> noteNewConnection: aDDSReadWriteNetworkConnection [
	^ aDDSReadWriteNetworkConnection
]

{ #category : #accessing }
DDSServiceConnectionDescription >> service: aService [
	service := aService
]

{ #category : #'as yet unclassified' }
DDSServiceConnectionDescription >> validateAndProcessHeader: aMDDSHandshakeHeader [
	^ aMDDSHandshakeHeader probe = 1
		or: [ aMDDSHandshakeHeader md5sum = service type md5sum ]
]
