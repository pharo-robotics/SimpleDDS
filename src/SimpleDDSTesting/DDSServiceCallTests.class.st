Class {
	#name : #DDSServiceCallTests,
	#superclass : #DDSInternallyDefinedDomainServiceRelatedTests,
	#instVars : [
		'caller',
		'participant'
	],
	#category : 'SimpleDDSTesting-Services'
}

{ #category : #'as yet unclassified' }
DDSServiceCallTests >> participant [
	^ MDDSDomainParticipant domain: domain name: 'adhoc-participant' ip: '127.0.0.1'
]

{ #category : #'as yet unclassified' }
DDSServiceCallTests >> setUp [
	super setUp.
	
	service := domain findOrRegisterServiceByName: '/service' type: #'service_type/Adhoc'.
	participant := self participant
]

{ #category : #'as yet unclassified' }
DDSServiceCallTests >> testServiceCallerExplodesAtCallingANonYetServedService [
	caller := service callerFor: participant.
	self should: [ caller call: [ :req |  ] ] raise: MDDSError
]

{ #category : #'as yet unclassified' }
DDSServiceCallTests >> testServiceCallerSpawnProperObject [
	caller := service callerFor: participant.
	self assert: (caller isKindOf: DDSServiceCaller)
]

{ #category : #'as yet unclassified' }
DDSServiceCallTests >> testTheServiceBlockIsAppliedAsExpected [
	| response |
	service serve: [ :rq :rp | rp data: rq data ] for: participant.
	caller := service callerFor: participant.
	response := caller call: [ :rq | rq data: 'test' ].
	self assert: response data equals: 'test'
]

{ #category : #'as yet unclassified' }
DDSServiceCallTests >> testTheTypeInjectedIntoTheBlockIsTheExpectedOne [
	| request |
	service serve: [ :rq :rp | rp data: rq data ] for: participant.
	caller := service callerFor: participant.
	caller call: [ :s | request := s ].
	self assert: (request isKindOf: (Smalltalk at: #Service_type_AdhocRequest))
]

{ #category : #'as yet unclassified' }
DDSServiceCallTests >> testTheTypeOfTheResponseIsTheExpected [
	| response |
	service serve: [ :rq :rp | rp data: rq data ] for: participant.
	caller := service callerFor: participant.
	response := caller call: [ :s |  ].
	self assert: (response isKindOf: (Smalltalk at: #Service_type_AdhocResponse))
]
