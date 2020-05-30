Class {
	#name : #DDSServiceInfrastructureTest,
	#superclass : #DDSInternallyDefinedDomainServiceRelatedTests,
	#category : 'SimpleDDSTesting-Services'
}

{ #category : #'as yet unclassified' }
DDSServiceInfrastructureTest >> testLookupFindServiceIfFoundIfNoneExecutesIfFound [
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
DDSServiceInfrastructureTest >> testLookupFindServiceIfFoundIfNoneExecutesIfNone [
	| val |
	val := false.
	domain findServiceByName: '/service' ifFound: [ val := false ] ifNone: [ val := true ].
	self assert: val
]

{ #category : #'as yet unclassified' }
DDSServiceInfrastructureTest >> testLookupFindServiceIfNoneExecutesIfNone [
	| val |
	val := false.
	domain findServiceByName: '/service' ifNone: [ val := true ].
	self assert: val
]

{ #category : #'as yet unclassified' }
DDSServiceInfrastructureTest >> testLookupServiceGivesAService [
	service := domain findOrRegisterServiceByName: '/service'.
	self assert: (service isKindOf: DDSService).
]

{ #category : #'as yet unclassified' }
DDSServiceInfrastructureTest >> testLookupServiceRegistersAService [
	service := domain findOrRegisterServiceByName: '/service'.
	self assert: (domain findServiceByName: '/service') equals: service
]

{ #category : #'as yet unclassified' }
DDSServiceInfrastructureTest >> testLookupServiceRegistersAServiceWithTypeHolders [
	service := domain findOrRegisterServiceByName: '/service'.
	self assert: service type isTypePlaceHolder
]

{ #category : #'as yet unclassified' }
DDSServiceInfrastructureTest >> testLookupServiceRegistersWithTypeAServiceIsTyped [
	service := domain
		findOrRegisterServiceByName: '/service'
		type: #'service_type/Adhoc'.
	self deny: service type isTypePlaceHolder
]

{ #category : #'as yet unclassified' }
DDSServiceInfrastructureTest >> testLookupServiceRegistersWithTypeHasMarshallers [
	service := domain findOrRegisterServiceByName: '/service' type: #'service_type/Adhoc'.
	self assert: (service type requestMarshaller isKindOf: MDDSCompositeType).
	self assert: (service type responseMarshaller isKindOf: MDDSCompositeType)
]

{ #category : #'as yet unclassified' }
DDSServiceInfrastructureTest >> testLookupUnexistantServiceExplodes [
	self should: [ service := domain findServiceByName: '/service' ] raise: MDDSError
]
