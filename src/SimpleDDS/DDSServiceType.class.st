"
A service type is a type with two marshallers: one for incoming data and other for outgoing data.
"
Class {
	#name : #DDSServiceType,
	#superclass : #MDDSEntity,
	#instVars : [
		'responseMarshaller',
		'requestMarshaller',
		'md5sum'
	],
	#category : 'SimpleDDS-Services'
}

{ #category : #construction }
DDSServiceType class >> domain: aDomain name: aServiceTypeName responseMarshaller: aResponseMarshaller requestMarshaller: aRequestMarshaller md5sum: aStringMd5Code [
	^ self new
		domain: aDomain;
		name: aServiceTypeName;
		responseMarshaller: aResponseMarshaller;
		requestMarshaller: aRequestMarshaller;
		md5sum: aStringMd5Code;
		yourself
]

{ #category : #testing }
DDSServiceType >> isTypePlaceHolder [
	^ false
]

{ #category : #accessing }
DDSServiceType >> md5sum [
	^ md5sum
]

{ #category : #accessing }
DDSServiceType >> md5sum: aStringMd5sum [
	md5sum := aStringMd5sum
]

{ #category : #accessing }
DDSServiceType >> plainDefinition [
	^ ''
]

{ #category : #accessing }
DDSServiceType >> requestMarshaller [
	^ requestMarshaller
]

{ #category : #accessing }
DDSServiceType >> requestMarshaller: aMarsaller [ 
	requestMarshaller := aMarsaller
]

{ #category : #accessing }
DDSServiceType >> responseMarshaller [
	^ responseMarshaller
]

{ #category : #accessing }
DDSServiceType >> responseMarshaller: aMarsaller [ 
	responseMarshaller := aMarsaller
]
