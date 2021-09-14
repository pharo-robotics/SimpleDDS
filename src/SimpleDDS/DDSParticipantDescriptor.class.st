"
A DDSParticipantDescriptor is just an particular case of MDDSPaticipantDescriptor but with parameters management.


"
Class {
	#name : #DDSParticipantDescriptor,
	#superclass : #MDDSParticipantDescriptor,
	#instVars : [
		'parameters'
	],
	#category : #'SimpleDDS-Domain'
}

{ #category : #initialization }
DDSParticipantDescriptor >> initialize [
	super initialize.
	parameters := Set new.
]

{ #category : #testing }
DDSParticipantDescriptor >> isSubscribedTo: aParameter [
	^ parameters includes: aParameter.
]

{ #category : #accessing }
DDSParticipantDescriptor >> noteParameterChanged: aParameterChangedAnnouncement [
	self participant noteParameterChanged: aParameterChangedAnnouncement parameter for: '/master'.
]

{ #category : #accessing }
DDSParticipantDescriptor >> pid [
	^ self participant getPid
]

{ #category : #'as yet unclassified' }
DDSParticipantDescriptor >> subscribe: aParameter [
	parameters add: aParameter
]

{ #category : #accessing }
DDSParticipantDescriptor >> url [ 
	^ uri
]
