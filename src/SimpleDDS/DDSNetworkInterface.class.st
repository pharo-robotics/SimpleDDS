Class {
	#name : #DDSNetworkInterface,
	#superclass : #Object,
	#instVars : [
		'name',
		'ipV4',
		'ipV6',
		'netmask',
		'isSolved'
	],
	#classInstVars : [
		'interfaces'
	],
	#category : #'SimpleDDS-Discovery'
}

{ #category : #accessing }
DDSNetworkInterface class >> initialize [

	SessionManager default
		registerSystemClassNamed: self name
		atPriority: 60
]

{ #category : #accessing }
DDSNetworkInterface class >> interfaces [
	^ interfaces ifNil: [ interfaces := OSPlatform current interfaces ]
]

{ #category : #accessing }
DDSNetworkInterface class >> interfacesIpV4 [

	^ self interfaces select: [ :i | i hasIpV4 ]
]

{ #category : #accessing }
DDSNetworkInterface class >> invalidateInterfaces [
	interfaces ifNotNil: [ interfaces do: [ :i | i invalidate ] ]
]

{ #category : #accessing }
DDSNetworkInterface class >> resetInterfaces [
	interfaces := nil.
]

{ #category : #accessing }
DDSNetworkInterface class >> startUp: isNewSession [ 
	isNewSession ifTrue: [ self invalidateInterfaces ]
]

{ #category : #accessing }
DDSNetworkInterface >> hasIpV4 [
	^ ('.' split: self ipV4) size = 4
]

{ #category : #accessing }
DDSNetworkInterface >> initialize [

	super initialize.
	isSolved := false.
	ipV4 := 'Not-available'.
	ipV6 := 'Not-available'.
	netmask := 'Not-available'.
]

{ #category : #'as yet unclassified' }
DDSNetworkInterface >> invalidate [ 
    isSolved := false.
]

{ #category : #accessing }
DDSNetworkInterface >> ipV4 [
	self resolveIp.
	^ ipV4 
]

{ #category : #accessing }
DDSNetworkInterface >> ipV4: aString [ 
	ipV4 := aString
]

{ #category : #'as yet unclassified' }
DDSNetworkInterface >> ipV4Mask: aString [ 
	netmask := aString
]

{ #category : #'as yet unclassified' }
DDSNetworkInterface >> ipV4NetworkInterval [
	self shouldBeImplemented.
]

{ #category : #accessing }
DDSNetworkInterface >> ipV6 [
	self resolveIp.
	^ ipV6
]

{ #category : #accessing }
DDSNetworkInterface >> ipV6: aString [ 
	ipV6 := aString
]

{ #category : #accessing }
DDSNetworkInterface >> name [
	^ name
]

{ #category : #accessing }
DDSNetworkInterface >> name: aName [
	name := aName
]

{ #category : #accessing }
DDSNetworkInterface >> netmask [

	self resolveIp.
	^ netmask
]

{ #category : #accessing }
DDSNetworkInterface >> printOn: aStream [

	aStream
		nextPutAll: ' Interface: ';
		nextPutAll: self name.
	ipV4 ifNotNil: [ 
		aStream
			nextPutAll: ' IPV4: ';
			nextPutAll: self ipV4 ].
	netmask ifNotNil: [ 
		aStream
			nextPutAll: ' NetMask: ';
			nextPutAll: self netmask ].
	ipV6 ifNotNil: [ 
		aStream
			nextPutAll: ' IPV6: ';
			nextPutAll: self ipV6 ]
]

{ #category : #'as yet unclassified' }
DDSNetworkInterface >> resolveIp [

	isSolved ifFalse: [ 
		isSolved := true.

		OSPlatform current resolveIpInto: self ]
]

{ #category : #'as yet unclassified' }
DDSNetworkInterface >> setInvalid: isInvalidIface [ 
	self assert: isInvalidIface .
	ipV4 := 'Invalid Interface Name'.
	ipV6 := 'Invalid Interface Name'.
	netmask := 'Invalid Interface Name'.
	isSolved := OSPlatform current isWindows 
]
