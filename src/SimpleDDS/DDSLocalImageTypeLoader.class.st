Class {
	#name : #DDSLocalImageTypeLoader,
	#superclass : #Object,
	#instVars : [
		'registry'
	],
	#category : #'SimpleDDS-Discovery'
}

{ #category : #abstract }
DDSLocalImageTypeLoader >> registerTypeDefinition: aDDSServiceTypeDefinition [

	self registry
		at: aDDSServiceTypeDefinition name
		put: aDDSServiceTypeDefinition
]

{ #category : #registry }
DDSLocalImageTypeLoader >> registry [
	 ^ registry ifNil: [ registry := Dictionary new  ]
]

{ #category : #'type management' }
DDSLocalImageTypeLoader >> serviceTypeDefinition: aString ifAbsent: aFullBlockClosure [

	^ self registry at: aString ifAbsent: aFullBlockClosure
]

{ #category : #abstract }
DDSLocalImageTypeLoader >> typeDefinition: aString ifAbsent: aFullBlockClosure [

	^ self registry at: aString ifAbsent: aFullBlockClosure
]

{ #category : #installing }
DDSLocalImageTypeLoader >> unload [

	registry removeAll
]
