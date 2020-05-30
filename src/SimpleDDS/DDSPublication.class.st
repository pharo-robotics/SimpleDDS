"
This publications adds the existance of a publication server. 
"
Class {
	#name : #DDSPublication,
	#superclass : #MDDSPublication,
	#category : 'SimpleDDS-Publishing'
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
		onNewConnection: [ :connection | self register: connection ].
	participant registerConnectionOffer: connectionOffer
]

{ #category : #accessing }
DDSPublication >> publicationServers [
	^ participant servers
]

{ #category : #run }
DDSPublication >> stopPublishing [
	connectionOffer ifNotNil: [ participant unregisterConnectionOffer: connectionOffer ]
]
