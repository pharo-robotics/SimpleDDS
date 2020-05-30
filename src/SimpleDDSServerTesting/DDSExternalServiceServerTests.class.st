Class {
	#name : #DDSExternalServiceServerTests,
	#superclass : #DDSExternallyDefinedDomainServiceRelatedTests,
	#instVars : [
		'caller',
		'participant',
		'participantIP'
	],
	#category : 'SimpleDDSServerTesting-services'
}

{ #category : #'as yet unclassified' }
DDSExternalServiceServerTests >> participant [
	participantIP := '127.0.0.1'.
	^ DDSDomainParticipant domain: domain name: 'adhoc-participant' ip: participantIP
]

{ #category : #'as yet unclassified' }
DDSExternalServiceServerTests >> setUp [
	super setUp.
	service := domain findOrRegisterServiceByName: '/service' type: #'service_type/Adhoc'.
	participant := self participant.
	service serve: [ :rq :rp | rp data: rq data ] for: participant
]

{ #category : #'as yet unclassified' }
DDSExternalServiceServerTests >> testExposedServerTCPWorksAtSameIPThanParticipant [
	self assert: service server tcpUrl asUrl host equals: participantIP
]

{ #category : #'as yet unclassified' }
DDSExternalServiceServerTests >> testExposedServerXMLRPCWorksAtSameIPThanParticipant [
	self assert: service server xmlrpcUrl asUrl host equals: participantIP
]

{ #category : #'as yet unclassified' }
DDSExternalServiceServerTests >> testServerDoneByExternalDomainCreatesAnExposedServer [
	self assert: (service server isKindOf: DDSExposedServiceServer)
]

{ #category : #'as yet unclassified' }
DDSExternalServiceServerTests >> testServerIsRunningJustAfterCreation [
	self assert: service server isRunning
]
