"
A DDSTypeLoader shares API with MDDSTypeLoader, but it relies sharing information with the external domain
"
Class {
	#name : #DDSTypeLoader,
	#superclass : #Object,
	#instVars : [
		'registry',
		'proxy'
	],
	#category : 'SimpleDDS-Discovery'
}

{ #category : #accessing }
DDSTypeLoader >> containerName [
	^ '/type_registry'
]

{ #category : #'type-encoding' }
DDSTypeLoader >> encodeTypeDefinition: aTypeDefinition [
	^ String
		streamContents: [ :stream | 
			STON writer
				on: stream;
				nextPut: aTypeDefinition ]
]

{ #category : #'ros-xml-reponses' }
DDSTypeLoader >> from: aCallerID update: aParameterName with: aValue [
	registry := registry union: aValue
]

{ #category : #initialization }
DDSTypeLoader >> initializeWith: aDomainProxy [ 
	self serve.
	proxy := aDomainProxy.
	registry := aDomainProxy createOrObtainTypeContainer: self containerName for: self.

]

{ #category : #abstract }
DDSTypeLoader >> loadTypeDefinitionNamed: aName definedFromString: aStringDefinition [
	| definition |
	definition := STON reader
		on: aStringDefinition readStream;
		next.
	^ definition
]

{ #category : #accessing }
DDSTypeLoader >> name [
	^ '/type_loader'
]

{ #category : #abstract }
DDSTypeLoader >> plainTypeDefinitionFor: aType [
	^ self encodeTypeDefinition: (self typeDefinition: aType name)
]

{ #category : #private }
DDSTypeLoader >> privateRegisterTypeDefinition: aMDDSTypeDefinition [
	registry at: aMDDSTypeDefinition name put: (self encodeTypeDefinition: aMDDSTypeDefinition).
	proxy informTypeRegistry: registry hasBeenModifiedAt: self.
	^ aMDDSTypeDefinition
]

{ #category : #abstract }
DDSTypeLoader >> registerTypeDefinition: aMDDSTypeDefinition [
	^ aMDDSTypeDefinition beRegisteredBy: self
]

{ #category : #exposition }
DDSTypeLoader >> serve [
	self subclassResponsibility 
]

{ #category : #'type management' }
DDSTypeLoader >> serviceTypeDefinition: aTypeName ifAbsent: aBlock [ 
	^ registry
		at: aTypeName
		ifPresent: [ :val | self loadTypeDefinitionNamed: aTypeName definedFromString: val ]
		ifAbsent: aBlock
]

{ #category : #abstract }
DDSTypeLoader >> typeDefinition: aTypeId [
	^ self typeDefinition: aTypeId ifAbsent: [ self error: ' There is no type named ' , aTypeId]
]

{ #category : #abstract }
DDSTypeLoader >> typeDefinition: aTypeName ifAbsent: aBlock [
	^ registry
		at: aTypeName
		ifPresent: [ :val | self loadTypeDefinitionNamed: aTypeName definedFromString: val ]
		ifAbsent: aBlock
]

{ #category : #installing }
DDSTypeLoader >> unload [
	self unserve.
	registry removeAll.
	proxy := nil.
	
]

{ #category : #exposition }
DDSTypeLoader >> unserve [
	^ self subclassResponsibility 
]
