"
A service type definition is a definition that allows to define the layout of a packet for response and an other for request
"
Class {
	#name : #DDSServiceTypeDefinition,
	#superclass : #Object,
	#instVars : [
		'name',
		'response',
		'request',
		'md5sum'
	],
	#category : 'SimpleDDS-Services'
}

{ #category : #'as yet unclassified' }
DDSServiceTypeDefinition class >> named: aName request: aRequestDefinition response: aResponseDefinition [
	^ self new
		name: aName request: aRequestDefinition response: aResponseDefinition;
		yourself
]

{ #category : #accessing }
DDSServiceTypeDefinition >> beRegisteredBy: aTypeLoader [
	self response privateRegisterFieldsAndConstantsInto: aTypeLoader.
	self request privateRegisterFieldsAndConstantsInto: aTypeLoader.
	aTypeLoader privateRegisterTypeDefinition: self
]

{ #category : #accessing }
DDSServiceTypeDefinition >> md5sum [
	^ md5sum
]

{ #category : #accessing }
DDSServiceTypeDefinition >> md5sum: aString [ 
	md5sum := aString
]

{ #category : #accessing }
DDSServiceTypeDefinition >> name [
	^ name
]

{ #category : #'as yet unclassified' }
DDSServiceTypeDefinition >> name: aName request: aRequestDefinition response: aResponseDefinition [
	name := aName.
	request := MDDSTypeDefinition named: aName , 'Request' defined: aRequestDefinition.
	response := MDDSTypeDefinition named: aName , 'Response' defined: aResponseDefinition
]

{ #category : #accessing }
DDSServiceTypeDefinition >> request [
	^ request
]

{ #category : #accessing }
DDSServiceTypeDefinition >> response [
	^ response
]
