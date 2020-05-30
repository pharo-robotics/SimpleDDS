Class {
	#name : #DDSExternallyDefinedDomainServiceRelatedTests,
	#superclass : #MDDSPharoBasedTests,
	#instVars : [
		'domain',
		'service',
		'server',
		'serverDescriptor'
	],
	#category : 'SimpleDDSServerTesting-services'
}

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomainServiceRelatedTests >> adhocServiceType [
	" The name is just to show that we can use the same name specification as in ROS but in Pharo. For Pharo it self it does not make much sense, since there is not a concept of installed packages or related namespace "

	^ DDSServiceTypeDefinition
		named: 'service_type/Adhoc'
		request: {(MDDSFieldDefinition name: #data type: (MDDSBasicTypeDefinition for: MDDSInt16Type new))}
		response: {(MDDSFieldDefinition name: #data type: (MDDSBasicTypeDefinition for: MDDSInt16Type new))}
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomainServiceRelatedTests >> createDomain [
	| remoteProxy domainProxy  |
	server := DDSSDomainDescriptorServer xmlrpcServerOn: DDSSDomainDescriptor new.
	serverDescriptor := DDSSDomainDescriptor new.
	server domain: serverDescriptor.
	server serveAt: 11311.
	" domain "
	domainProxy := DDSDomainProxy onProxy: server.
	domainProxy typeLoader: DDSTestTypeLoader new.
	domainProxy typeLoader initializeWith: domainProxy.
	remoteProxy := DDSRemoteDomainMirror on: domainProxy.
	^ (DDSExternallyDefinedDomain on: remoteProxy)
		addProtocol: (DDSTCPProtocol encoding: MDDSEncoder decoding: MDDSDecoder);
		yourself
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomainServiceRelatedTests >> setUp [
	super setUp.
	domain := self createDomain.
	domain registerTypeDefinition: self adhocServiceType
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomainServiceRelatedTests >> tearDown [
	domain destroy.
	server stop.
	serverDescriptor destroy.
	
	" domain := nil."
	super tearDown .
]
