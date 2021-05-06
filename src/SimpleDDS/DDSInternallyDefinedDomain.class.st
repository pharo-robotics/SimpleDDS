"
This is an internally defined domain that adds support for services description, services, services types definition and services types. 


"
Class {
	#name : #DDSInternallyDefinedDomain,
	#superclass : #MDDSInternallyDefinedDomain,
	#instVars : [
		'createdServices'
	],
	#category : 'SimpleDDS-Domain'
}

{ #category : #creationg }
DDSInternallyDefinedDomain >> createAndRegisterServiceNamed: aServiceName [
	self
		createAndRegisterServiceNamed: aServiceName
		type: MDDSTypeDescriptor unknownWildcard
]

{ #category : #'as yet unclassified' }
DDSInternallyDefinedDomain >> createServiceCallerFor: aParticipant forCalling: aDDSService [ 
	^ DDSServiceCaller for: aParticipant on: aDDSService.
		
]

{ #category : #'as yet unclassified' }
DDSInternallyDefinedDomain >> createServiceNamed: aServiceName type: aType [
	^ createdServices
		at: aServiceName
		ifAbsentPut:
			[ DDSService domain: self name: aServiceName type: aType ]
]

{ #category : #'as yet unclassified' }
DDSInternallyDefinedDomain >> createServiceServerFor: aParticipant serving: aValuable for: aDDSService [
	^ DDSServiceServer
		for: aParticipant
		serving: aValuable
		for: aDDSService
]

{ #category : #'as yet unclassified' }
DDSInternallyDefinedDomain >> createServiceTypeNamed: aName definedBy: aDDSServiceTypeDefinition [
	^ DDSServiceType
		domain: self
		name: aName
		responseMarshaller:
			aDDSServiceTypeDefinition response typeBuilder buildTypeMarshaller
		requestMarshaller:
			aDDSServiceTypeDefinition request typeBuilder buildTypeMarshaller
		md5sum: aDDSServiceTypeDefinition md5sum
]

{ #category : #query }
DDSInternallyDefinedDomain >> findOrRegisterServiceByName: aServiceName [
	^ self
		findOrRegisterServiceByName: aServiceName
		type: MDDSTypeDescriptor unknownWildcard
]

{ #category : #'as yet unclassified' }
DDSInternallyDefinedDomain >> findOrRegisterServiceByName: aServiceName type: aTypeName [
	| found typeDesc |
	typeDesc := DDSServiceTypeDescriptor domain: self name: aTypeName.
	found := self
		findServiceByName: aServiceName
		ifNone:
			[ 
			(DDSServiceDescriptor domain: self name: aServiceName type: typeDesc)
				createService ].
	((typeDesc describes: found type) not
		and: [ found type isTypePlaceHolder ])
		ifTrue: [ found type: typeDesc createType ].
	^ found
]

{ #category : #service }
DDSInternallyDefinedDomain >> findServiceByName: aServiceName [
	^ self
		findServiceByName: aServiceName
		ifNone:
			[ MDDSError signal: 'There is not service called ' , aServiceName ]
]

{ #category : #query }
DDSInternallyDefinedDomain >> findServiceByName: aServiceName ifFound: aBlockClosure ifNone: anOtherBlock [
	^ self services
		detect: [ :s | s name = aServiceName ]
		ifFound: aBlockClosure
		ifNone: anOtherBlock
]

{ #category : #query }
DDSInternallyDefinedDomain >> findServiceByName: aServiceName ifNone: aBlockClosure [
	^ self services
		detect: [ :s | s name = aServiceName ]
		ifNone: aBlockClosure
]

{ #category : #initialization }
DDSInternallyDefinedDomain >> initialize [
	super initialize.
	createdServices := Dictionary new
]

{ #category : #query }
DDSInternallyDefinedDomain >> installTypeLoader: aTypeLoader [
	types := aTypeLoader
]

{ #category : #testing }
DDSInternallyDefinedDomain >> isServiceTypeDefined: aServiceTypeName [
	self serviceTypeDefinition: aServiceTypeName ifAbsent: [ ^ false ].
	^ true
]

{ #category : #'as yet unclassified' }
DDSInternallyDefinedDomain >> lookupAndRegisterServiceServerFor: aMDDSDomainParticipant forCalling: aDDSService [ 
	^ DDSServiceServer for: aMDDSDomainParticipant serving: nil for: aDDSService
]

{ #category : #'type management' }
DDSInternallyDefinedDomain >> serviceTypeDefinition: typeName ifAbsent: aBlockClosure [ 
	^ types serviceTypeDefinition: typeName ifAbsent: aBlockClosure
]

{ #category : #'System-FileRegistry' }
DDSInternallyDefinedDomain >> services [
	^ createdServices values
]
