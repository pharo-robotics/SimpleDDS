"
A namespace works only for parameter holding. Each caller can push parameters in it own namespace or in the root namespace. 

Then the parameter lookup is as an inheritance, each namespace can look at it parameters and to the parents. 
The definition of a parameter in a namespace makes invisible (overrides) the parent value for the same parameter name.
"
Class {
	#name : #DDSSNamespace,
	#superclass : #MDDSEntity,
	#instVars : [
		'parent',
		'namespaces',
		'parameters'
	],
	#category : 'SimpleDDSServer-Parameters'
}

{ #category : #'as yet unclassified' }
DDSSNamespace class >> domain: aDomain name: aName parent: aParent [
	^ self new
		domain: aDomain;
		name: aName;
		parent: aParent;
		yourself
]

{ #category : #'as yet unclassified' }
DDSSNamespace class >> newRootAt: aDomain [
	^ self domain: aDomain name:'' parent: nil.
]

{ #category : #accessing }
DDSSNamespace >> addParameter: aParameter [
	parameters add: aParameter.
	aParameter namespace: self
]

{ #category : #compact }
DDSSNamespace >> compact [
	namespaces valuesDo: #compact.
	self isRoot
		ifFalse: [ (parameters isEmpty and: [ namespaces isEmpty ])
				ifTrue: [ self delete ] ]
]

{ #category : #actions }
DDSSNamespace >> delete [
	parent deleteNamespace: self.
]

{ #category : #actions }
DDSSNamespace >> delete: aParameter [
	^ parameters remove: aParameter ifAbsent: [  ] 
]

{ #category : #accessing }
DDSSNamespace >> deleteNamespace: aNamespace [
	namespaces removeKey: aNamespace name.
]

{ #category : #accessing }
DDSSNamespace >> detectParameter: aParameterName ifNone: aBlock [
	" Detect parameters check in this namespace and in the parent namespace, iterating up to the root "

	^ parameters
		detect: [ :p | p name = aParameterName ]
		ifNone: [ 
			self isRoot
				ifTrue: aBlock
				ifFalse: [ parent detectParameter: aParameterName ifNone: aBlock ] ]
]

{ #category : #actions }
DDSSNamespace >> flatParameters [
	" Flat parameters makes a dictionary parameterName => flatValue. This exists for ROS compatibility "

	^ parameters
		inject: Dictionary new
		into: [ :dic :p | 
			dic at: p name put: p value.
			dic ]
]

{ #category : #initialization }
DDSSNamespace >> initialize [
	super initialize.
	parent := nil.
	namespaces := Dictionary new.
	parameters := Set new
]

{ #category : #accessing }
DDSSNamespace >> innerNamespace: aName [
	^ namespaces at: aName ifAbsentPut: [  self class domain: domain name: aName parent: self ].
	

]

{ #category : #testing }
DDSSNamespace >> isRoot [
	^ parent isNil
]

{ #category : #query }
DDSSNamespace >> lookupOrCreateParameterInPath: aParameterPath [
	^ self lookupParameterInPath: aParameterPath ifNone: [  aParameterPath createParameterOn: self ]
]

{ #category : #query }
DDSSNamespace >> lookupParameterInPath: aParameterPath [ 
	^ self lookupParameterInPath: aParameterPath ifNone: [ self error: 'There is not parameter setted in the given path' ]
	
]

{ #category : #query }
DDSSNamespace >> lookupParameterInPath: aParameterPath ifNone: aBlock [
	self isRoot
		ifFalse: [ parent lookupPath: aParameterPath ].
	^ aParameterPath fetchFrom: self ifAbsent: aBlock
]

{ #category : #accessing }
DDSSNamespace >> names [
	^ self isRoot
		ifTrue: [ parameters collect: #name ]
		ifFalse: [ parent names , parameters collect: #name ]
]

{ #category : #accessing }
DDSSNamespace >> parent [
	^ parent
]

{ #category : #accessing }
DDSSNamespace >> parent: aParent [
	parent := aParent
	
]

{ #category : #evaluating }
DDSSNamespace >> value [
	^ self flatParameters
]
