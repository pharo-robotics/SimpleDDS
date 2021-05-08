"
This is an abstract implementation that just gives the mechanisms for evaluating.
"
Class {
	#name : #DDSServiceServer,
	#superclass : #Object,
	#instVars : [
		'participant',
		'service',
		'valuable'
	],
	#category : 'SimpleDDS-Services'
}

{ #category : #'as yet unclassified' }
DDSServiceServer class >> for: aParticipant serving: aValuable for: aDDSService [
	^ self new
		participant: aParticipant;
		service: aDDSService;
		valuable: aValuable;
		yourself
]

{ #category : #accessing }
DDSServiceServer >> destroy [
	participant := nil.
	service := nil
]

{ #category : #'as yet unclassified' }
DDSServiceServer >> evaluate: aRequest for: aParticipant [
	| response |
	response := service type responseMarshaller newInstance.
	valuable value: aRequest value: response.
	^ response
]

{ #category : #testing }
DDSServiceServer >> isRunning [
	self subclassResponsibility.
]

{ #category : #accessing }
DDSServiceServer >> participant [
	^ participant
]

{ #category : #accessing }
DDSServiceServer >> participant: aMDDSDomainParticipant [
	participant := aMDDSDomainParticipant
]

{ #category : #accessing }
DDSServiceServer >> service: aDDSService [
	service := aDDSService
]

{ #category : #accessing }
DDSServiceServer >> valuable: aValuable [
	valuable := aValuable
]
