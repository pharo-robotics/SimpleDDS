"
A DDSDomainDescriptor is a concrete implementation. Basic for a server 
s
"
Class {
	#name : #DDSSDomainDescriptor,
	#superclass : #DDSSAbstractDomainDescriptor,
	#category : 'SimpleDDSServer-Domain'
}

{ #category : #'as yet unclassified' }
DDSSDomainDescriptor >> constructParticipantDescriptorNamed: aName connectedAt: anUri [.
	 ^ DDSParticipantDescriptor domain: self name: aName uri: anUri.
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptor >> createParticipantFor: aParticipantDescriptor [
	 ^ DDSParticipantProxy on: aParticipantDescriptor uri.
]

{ #category : #destroy }
DDSSDomainDescriptor >> destroy [
	topics removeAll.
	participants removeAll.
	announcer := nil.
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptor >> finalize [
	self destroy

]

{ #category : #initialization }
DDSSDomainDescriptor >> initialize [
	super initialize.
	self when: DDSParameterHasChanged send: #noteParameterChanged: to: self
]

{ #category : #accessing }
DDSSDomainDescriptor >> noteParameterChanged: aParameterChangedAnnouncement [
	participants select: [ : p | p isSubscribedTo: aParameterChangedAnnouncement parameter ] thenDo: [: p | p noteParameterChanged: aParameterChangedAnnouncement ]
]

{ #category : #'as yet unclassified' }
DDSSDomainDescriptor >> notePublication: aMDDSIsPublishingAnnouncement [
	aMDDSIsPublishingAnnouncement topic subscribed
		do: [ :participantDescriptor | 
			participantDescriptor participant
				informFrom: '/master'
				for: aMDDSIsPublishingAnnouncement topic
				publishers: aMDDSIsPublishingAnnouncement topic publishers ]
]
