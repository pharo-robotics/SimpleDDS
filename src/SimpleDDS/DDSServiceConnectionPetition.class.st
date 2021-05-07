"
A service connection petition has related the information of the related service and the necesary code for starting up a well configured input-output connection
"
Class {
	#name : #DDSServiceConnectionPetition,
	#superclass : #DDSServiceConnectionDescription,
	#instVars : [
		'url'
	],
	#category : 'SimpleDDS-Protocols'
}

{ #category : #'as yet unclassified' }
DDSServiceConnectionPetition class >> participant: aDDSDomainParticipant url: anUrl service: aService [
	^ self new
		url: anUrl asZnUrl;
		service: aService;
		participant: aDDSDomainParticipant;
		yourself
]

{ #category : #accessing }
DDSServiceConnectionPetition >> ip [
	^ url host
]

{ #category : #accessing }
DDSServiceConnectionPetition >> port [
	^ url port
]

{ #category : #accessing }
DDSServiceConnectionPetition >> url: anUrl [
	url := anUrl
]
