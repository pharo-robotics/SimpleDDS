"
This example has a local server, then it fitts automatically all the dependancies
"
Class {
	#name : #DDSTopicExamplesExternalDomainWithLocalServer,
	#superclass : #DDSTopicExamples,
	#instVars : [
		'server'
	],
	#category : 'SimpleDDSWithServerExtention'
}

{ #category : #private }
DDSTopicExamplesExternalDomainWithLocalServer >> createExampleDomain [
	| domain |
	domain := DDSExternallyDefinedDomain onLocalSimpleDDS: server.	" Add the protocol support "
	domain addProtocol: (DDSTCPProtocol encoding: MDDSEncoder decoding: MDDSDecoder).
	^ domain
]

{ #category : #private }
DDSTopicExamplesExternalDomainWithLocalServer >> setUp [
	server := DDSDomainDescriptorXMLRPCServer serve: DDSSDomainDescriptor new.
	server domain: DDSSDomainDescriptor new.
	server serveAt: 11311
]

{ #category : #private }
DDSTopicExamplesExternalDomainWithLocalServer >> tearDown [
	server stop.
	server domain: nil.
	server := nil
]
