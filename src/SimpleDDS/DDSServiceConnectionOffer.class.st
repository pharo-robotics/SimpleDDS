"
A service connection offer has related the information of the related service and the necesary code for starting up a well configured input-output connection
"
Class {
	#name : #DDSServiceConnectionOffer,
	#superclass : #DDSServiceConnectionDescription,
	#instVars : [
		'onNewConnection'
	],
	#category : 'SimpleDDS-Protocols'
}

{ #category : #'as yet unclassified' }
DDSServiceConnectionOffer class >> service: aDDSService participant: aDDSDomainParticipant onNewConnection: aValuableWithOneArg [
	^ self new
		service: aDDSService;
		participant: aDDSDomainParticipant;
		onNewConnection: aValuableWithOneArg;
		yourself
]

{ #category : #'as yet unclassified' }
DDSServiceConnectionOffer >> noteNewConnection: aConnection [
	aConnection setAsServerSideConnection.
	onNewConnection ifNotNil: [ onNewConnection value: aConnection ].
	^ aConnection
]

{ #category : #accessing }
DDSServiceConnectionOffer >> onNewConnection: aValuableWithOneArg [
	onNewConnection := aValuableWithOneArg
]
