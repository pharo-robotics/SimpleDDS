"
This publications adds the existance of a publication server. 
"
Class {
	#name : #DDSPublication,
	#superclass : #MDDSPublication,
	#instVars : [
		'welcomeMessage'
	],
	#category : #'SimpleDDS-Publishing'
}

{ #category : #accessing }
DDSPublication >> destroy [
	| rt |
	rt := self stopPublishing.
	super destroy.
	^ rt
]

{ #category : #notifications }
DDSPublication >> noteIsNotRegisteredAnymore [
	self stopPublishing.
	super noteIsNotRegisteredAnymore.
	
]

{ #category : #accessing }
DDSPublication >> noteIsRegisteredIn: aPublisher [
	connectionOffer := MDDSConnectionOffer
		publisher: aPublisher
		participant: participant
		onNewConnection: [ :connection | 
			self register: connection.
			
		].
	participant registerConnectionOffer: connectionOffer
]

{ #category : #accessing }
DDSPublication >> publicationServers [
	^ participant servers
]

{ #category : #accessing }
DDSPublication >> register: aWritingConnection [
	super register: aWritingConnection.
	self shouldSendWelcomeMessage
		ifTrue: [ | value |
			value := self marshaller newInstance.
			welcomeMessage value: value.
			self publishValue: value to: aWritingConnection ]
		
]

{ #category : #run }
DDSPublication >> shouldSendWelcomeMessage [
	^ welcomeMessage isNotNil
]

{ #category : #run }
DDSPublication >> stopPublishing [
	connectionOffer ifNotNil: [ participant unregisterConnectionOffer: connectionOffer ]
]

{ #category : #run }
DDSPublication >> welcomeMessage: aBlock [
	welcomeMessage := aBlock
]
