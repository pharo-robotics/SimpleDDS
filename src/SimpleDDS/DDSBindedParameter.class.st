"
A DDSBindedParameter is a reification of a parameter. It has the actual value and the participant which it belongs to.
"
Class {
	#name : #DDSBindedParameter,
	#superclass : #MDDSEntity,
	#instVars : [
		'value',
		'setted',
		'participant'
	],
	#category : 'SimpleDDS-Parameter'
}

{ #category : #constructor }
DDSBindedParameter class >> name: aName participant: aParticipant initialized: anInitialValue [
	^ self new
		name: aName;
		participant: aParticipant;
		basicSet: anInitialValue;
		yourself
]

{ #category : #constructor }
DDSBindedParameter class >> name: aName participant: aParticipant value: aValue [
	^ self new
		name: aName;
		participant: aParticipant;
		set: aValue;
		yourself
]

{ #category : #accessing }
DDSBindedParameter >> basicGet [
	^ value
]

{ #category : #accessing }
DDSBindedParameter >> basicSet: aValue [
	setted := true.
	value := aValue.
]

{ #category : #retrieving }
DDSBindedParameter >> get [
	setted
		ifFalse: [ self error: 'Parameter has not being setted yet' ].
	^ self basicGet
]

{ #category : #initialization }
DDSBindedParameter >> initialize [
	super initialize.
	setted := false.
]

{ #category : #accessing }
DDSBindedParameter >> participant [
	^ participant
]

{ #category : #accessing }
DDSBindedParameter >> participant: aMDDSDomainParticipant [
	participant := aMDDSDomainParticipant
]

{ #category : #accessing }
DDSBindedParameter >> set: aValue [
	self basicSet: aValue.
	domain note: (DDSParameterAnnouncement hasBeenSetted: self).
]

{ #category : #accessing }
DDSBindedParameter >> transform: aBlock [
	self set: (aBlock value: self get)
]
