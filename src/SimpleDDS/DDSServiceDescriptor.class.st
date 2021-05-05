"
A service descriptor is a meta level of service. Is used for describing the system
"
Class {
	#name : #DDSServiceDescriptor,
	#superclass : #MDDSEntity,
	#instVars : [
		'type'
	],
	#category : 'SimpleDDS-Services'
}

{ #category : #'as yet unclassified' }
DDSServiceDescriptor class >> domain: aDomain name: aName type: aTypeDescriptor [
	^ self new
		name: aName;
		type: aTypeDescriptor;
		domain: aDomain;
		yourself
]

{ #category : #'as yet unclassified' }
DDSServiceDescriptor class >> name: aName type: aServiceTypeDescriptor [
	^ self new
		name: aName;
		type: aServiceTypeDescriptor;
		yourself
]

{ #category : #'as yet unclassified' }
DDSServiceDescriptor >> createService [
	^ domain createServiceNamed: name type: type createType
]

{ #category : #accessing }
DDSServiceDescriptor >> domain: aDomain [
	type domain: aDomain.
	^ super domain: aDomain
]

{ #category : #accessing }
DDSServiceDescriptor >> name [
	^( super name beginsWith:'/' ) ifTrue: [ super name ] ifFalse: [ '/', super name ].
]

{ #category : #abstract }
DDSServiceDescriptor >> participants [
	self shouldBeImplemented.
]

{ #category : #accessing }
DDSServiceDescriptor >> type [
	^ type
]

{ #category : #accessing }
DDSServiceDescriptor >> type: aServiceType [
	type := aServiceType
]
