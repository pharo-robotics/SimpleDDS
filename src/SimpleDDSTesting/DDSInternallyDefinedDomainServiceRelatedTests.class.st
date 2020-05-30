Class {
	#name : #DDSInternallyDefinedDomainServiceRelatedTests,
	#superclass : #MDDSPharoBasedTests,
	#instVars : [
		'domain',
		'service',
		'loader'
	],
	#category : 'SimpleDDSTesting-Services'
}

{ #category : #'as yet unclassified' }
DDSInternallyDefinedDomainServiceRelatedTests >> adhocServiceType [
	" The name is just to show that we can use the same name specification as in ROS but in Pharo. For Pharo it self it does not make much sense, since there is not a concept of installed packages or related namespace "

	^ DDSServiceTypeDefinition
		named: 'service_type/Adhoc'
		request: {(MDDSFieldDefinition name: #data type: (MDDSBasicTypeDefinition for: MDDSInt16Type new))}
		response: {(MDDSFieldDefinition name: #data type: (MDDSBasicTypeDefinition for: MDDSInt16Type new))}
]

{ #category : #'as yet unclassified' }
DDSInternallyDefinedDomainServiceRelatedTests >> createDomain [
	^ DDSInternallyDefinedDomain new
]

{ #category : #'as yet unclassified' }
DDSInternallyDefinedDomainServiceRelatedTests >> setUp [
	super setUp.
	domain := self createDomain.
	loader := DDSTestTypeLoader new.
	loader installRegistry.
	domain installTypeLoader: loader.
	domain registerTypeDefinition: self adhocServiceType
]

{ #category : #'as yet unclassified' }
DDSInternallyDefinedDomainServiceRelatedTests >> tearDown [
	domain destroy.
	domain := nil.
	super tearDown .
]
