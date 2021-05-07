"
A service type descritpor is a meta level that has name and is fetchable
"
Class {
	#name : #DDSServiceTypeDescriptor,
	#superclass : #MDDSTypeDescriptor,
	#category : 'SimpleDDS-Services'
}

{ #category : #'as yet unclassified' }
DDSServiceTypeDescriptor >> createType [
	^ (self isUnknown or: [ self isUndefined ])
		ifTrue: [ domain createTypePlaceHolder: name asString ]
		ifFalse:
			[ domain createServiceTypeNamed: name asString definedBy: self definition ]
]

{ #category : #testing }
DDSServiceTypeDescriptor >> isUndefined [
	^  (domain isServiceTypeDefined: name) not 
]
