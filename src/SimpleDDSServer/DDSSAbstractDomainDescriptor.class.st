"
A domain descriptor is an object that follows the changes on the domain system and track them in order to make them consultable. 

This object is used by the domain descriptor server to delegate all what is domain management. 
"
Class {
	#name : #DDSSAbstractDomainDescriptor,
	#superclass : #MDDSProtoDomain,
	#instVars : [
		'topics',
		'participants',
		'announcer'
	],
	#category : 'SimpleDDSServer-Domain'
}

{ #category : #'as yet unclassified' }
DDSSAbstractDomainDescriptor >> constructParticipantDescriptorNamed: aName connectedAt: anUri [.
	 ^ MDDSParticipantDescriptor domain: self name: aName uri: anUri.
]

{ #category : #'as yet unclassified' }
DDSSAbstractDomainDescriptor >> createParticipantFor: aParticipantDescriptor [
	 ^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DDSSAbstractDomainDescriptor >> initialize [
	super initialize.
	topics := Set new.
	participants := Set new.
	announcer := Announcer new.
	
	self when: MDDSIsPublishingAnnouncement send: #notePublication: to: self. 
	self when: MDDSIsNotPublishingAnnouncement send: #notePublicationFinished: to: self. 
	self when: MDDSIsSubscribedAnnouncement send: #noteSubscription: to: self. 
	self when: MDDSIsNotSubscribedAnnouncement send: #noteSubscriptionFinished: to: self. 

]

{ #category : #'as yet unclassified' }
DDSSAbstractDomainDescriptor >> note: anAnnouncement [
	announcer announce: anAnnouncement.
]

{ #category : #'as yet unclassified' }
DDSSAbstractDomainDescriptor >> participantDescriptorFor: aName connectedAt: anUri [
	^ participants detect: [ : p | p name = aName  ] ifNone: [ 
		| participant |
		participant := self constructParticipantDescriptorNamed: aName connectedAt: anUri.
		participants add: participant.
		participant.
	 ]
]

{ #category : #'as yet unclassified' }
DDSSAbstractDomainDescriptor >> participants [
	^ participants
]

{ #category : #'as yet unclassified' }
DDSSAbstractDomainDescriptor >> topicDescriptorFor: aTopicName [
	^ self topicDescriptorFor: aTopicName ifNone: [ self error: ' There is not topic named ' , aTopicName ]
]

{ #category : #'as yet unclassified' }
DDSSAbstractDomainDescriptor >> topicDescriptorFor: aTopicName andType: aTopicMessageType [
	^ self
		topicDescriptorFor: aTopicName
		ifNone: [ 
			| type topic |
			type := MDDSTypeDescriptor domain: self name: aTopicMessageType.
			topic := DDSSServerSideTopic domain: self name: aTopicName type: type.
			topics add: topic.
			topic ]
]

{ #category : #'as yet unclassified' }
DDSSAbstractDomainDescriptor >> topicDescriptorFor: aTopicName ifNone: aBlock [
	^ topics detect: [ :t | t name = aTopicName ] ifNone: aBlock
]

{ #category : #'as yet unclassified' }
DDSSAbstractDomainDescriptor >> topics [
	^ topics
]

{ #category : #'as yet unclassified' }
DDSSAbstractDomainDescriptor >> typeDefinition: aString ifAbsent: aBlock [
	self error: ' This makes no sense. Does it? '
]

{ #category : #'as yet unclassified' }
DDSSAbstractDomainDescriptor >> when: anEventSelector send: aMessage to: anObject [
	announcer weak when: anEventSelector send: aMessage to: anObject
]
