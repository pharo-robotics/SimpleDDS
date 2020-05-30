Class {
	#name : #DDSTCPProtocolTest,
	#superclass : #TestCase,
	#instVars : [
		'tcpProtocol'
	],
	#category : 'SimpleDDSTesting-TCP'
}

{ #category : #'as yet unclassified' }
DDSTCPProtocolTest >> setUp [
	super setUp.
	tcpProtocol := DDSTCPProtocol new.
]

{ #category : #'as yet unclassified' }
DDSTCPProtocolTest >> testAlwaysTheSameHeaderDefinition [
	self assert: tcpProtocol class headerDefinition == tcpProtocol class headerDefinition.
]

{ #category : #'as yet unclassified' }
DDSTCPProtocolTest >> testCreatesAProperListener [
	| socket |
	socket  := tcpProtocol createSocketForlistenAt: (NetNameResolver addressFromString: '127.0.0.1') on: (MDDSPortResolver new obtainPort). 
	self assert: socket isWaitingForConnection.
	self assert: (socket isKindOf:Socket).
	socket close.
	socket destroy.
]

{ #category : #'as yet unclassified' }
DDSTCPProtocolTest >> testHeaderRelatedClassPublisher [
	self assert: tcpProtocol header relatedClass = MDDSHandshakeHeader 
]

{ #category : #'as yet unclassified' }
DDSTCPProtocolTest >> testNewPublisherHeaderInstance [
	self assert: (tcpProtocol header newInstance isKindOf: MDDSHandshakeHeader )
]
