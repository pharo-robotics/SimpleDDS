"
This descriptor adds some descriptions needed for serving a domain, allowing to track related participants
"
Class {
	#name : #DDSSServerSideTopic,
	#superclass : #MDDSEntity,
	#instVars : [
		'type',
		'subscribed',
		'publishers'
	],
	#category : 'SimpleDDSServer-Domain'
}

{ #category : #'as yet unclassified' }
DDSSServerSideTopic class >> domain: aDomain name: aName type: aType [
	^ self new name: aName; type: aType; domain: aDomain; yourself.
]

{ #category : #'as yet unclassified' }
DDSSServerSideTopic >> initialize [
	super initialize.
	publishers := Set new.
	subscribed := Set new.
]

{ #category : #'as yet unclassified' }
DDSSServerSideTopic >> participants [
	^ subscribed , publishers 
]

{ #category : #'as yet unclassified' }
DDSSServerSideTopic >> publisher [
	^ self
]

{ #category : #'as yet unclassified' }
DDSSServerSideTopic >> publishers [
	^ publishers
]

{ #category : #'as yet unclassified' }
DDSSServerSideTopic >> publishing: aParticipant [
	publishers
		like: aParticipant
		ifAbsent: [ 
			publishers add: aParticipant.
			domain note: (MDDSTopicAnnouncement participant: aParticipant isNowPublishingOn: self through: self) ]
]

{ #category : #'as yet unclassified' }
DDSSServerSideTopic >> stopPublishing: aParticipant [
	publishers remove: aParticipant ifAbsent: [ ^ self ].
	domain note: (MDDSTopicAnnouncement participant: aParticipant isNotPublishingAnymoreOn: self through: self).
]

{ #category : #'as yet unclassified' }
DDSSServerSideTopic >> subscribe: aParticipant [
	subscribed
		like: aParticipant
		ifAbsent: [ 
			subscribed add: aParticipant.
			domain note: (MDDSTopicAnnouncement participant: aParticipant isNowSubscribedTo: self with: self) ]
]

{ #category : #'as yet unclassified' }
DDSSServerSideTopic >> subscribed [
	^ subscribed 
]

{ #category : #'as yet unclassified' }
DDSSServerSideTopic >> subscriber [
	^ self
]

{ #category : #'as yet unclassified' }
DDSSServerSideTopic >> type [ 
	^ type
]

{ #category : #'as yet unclassified' }
DDSSServerSideTopic >> type: aType [
	type := aType.
]

{ #category : #'as yet unclassified' }
DDSSServerSideTopic >> unsubscribe: aParticipant [
	subscribed remove: aParticipant ifAbsent: [ ^ self ].
	domain note: (MDDSTopicAnnouncement participant: aParticipant isNotSubscribedAnymoreTo: self with: self)
]
