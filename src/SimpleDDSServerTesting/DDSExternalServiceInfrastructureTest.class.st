Class {
	#name : #DDSExternalServiceInfrastructureTest,
	#superclass : #DDSExternallyDefinedDomainServiceRelatedTests,
	#category : 'SimpleDDSServerTesting-services'
}

{ #category : #'as yet unclassified' }
DDSExternalServiceInfrastructureTest >> testLookupFindServiceIfFoundIfNoneExecutesIfFound [
	| val |
	val := false.
	domain findOrRegisterServiceByName: '/service'.
	domain
		findServiceByName: '/service'
		ifFound: [ val := true ]
		ifNone: [ val := false ].
	self assert: val
]

{ #category : #'as yet unclassified' }
DDSExternalServiceInfrastructureTest >> testLookupFindServiceIfFoundIfNoneExecutesIfNone [
	| val |
	val := false.
	domain findServiceByName: '/service' ifFound: [ val := false ] ifNone: [ val := true ].
	self assert: val
]

{ #category : #'as yet unclassified' }
DDSExternalServiceInfrastructureTest >> testLookupFindServiceIfNoneExecutesIfNone [
	| val |
	val := false.
	domain findServiceByName: '/service' ifNone: [ val := true ].
	self assert: val
]

{ #category : #'as yet unclassified' }
DDSExternalServiceInfrastructureTest >> testLookupServiceGivesAService [
	service := domain findOrRegisterServiceByName: '/service'.
	self assert: (service isKindOf: DDSService).
]

{ #category : #'as yet unclassified' }
DDSExternalServiceInfrastructureTest >> testLookupServiceRegistersAService [
	service := domain findOrRegisterServiceByName: '/service'.
	self assert: (domain findServiceByName: '/service') equals: service
]

{ #category : #'as yet unclassified' }
DDSExternalServiceInfrastructureTest >> testLookupServiceRegistersAServiceWithTypeHolders [
	service := domain findOrRegisterServiceByName: '/service'.
	self assert: service type isTypePlaceHolder
]

{ #category : #'as yet unclassified' }
DDSExternalServiceInfrastructureTest >> testLookupServiceRegistersWithTypeAServiceIsTyped [
	service := domain
		findOrRegisterServiceByName: '/service'
		type: #'service_type/Adhoc'.
	self deny: service type isTypePlaceHolder
]

{ #category : #'as yet unclassified' }
DDSExternalServiceInfrastructureTest >> testLookupServiceRegistersWithTypeHasMarshallers [
	service := domain findOrRegisterServiceByName: '/service' type: #'service_type/Adhoc'.
	self assert: (service type requestMarshaller isKindOf: MDDSCompositeType).
	self assert: (service type responseMarshaller isKindOf: MDDSCompositeType)
]

{ #category : #'as yet unclassified' }
DDSExternalServiceInfrastructureTest >> testLookupUnexistantServiceExplodes [
	self should: [ service := domain findServiceByName: '/service' ] raise: MDDSError
]
