"
Example running with a externally domain that points to a local server 
"
Class {
	#name : #DDSParameterExamplesExternalDomainWithLocalServer,
	#superclass : #DDSParameterExamples,
	#instVars : [
		'server'
	],
	#category : 'SimpleDDS-Examples'
}

{ #category : #private }
DDSParameterExamplesExternalDomainWithLocalServer >> createExampleDomain [
	| domain |
	domain := DDSExternallyDefinedDomain onLocalSimpleDDS: server.	" Add the protocol support "
	domain addProtocol: (DDSTCPProtocol encoding: MDDSEncoder decoding: MDDSDecoder).
	^ domain
]

{ #category : #running }
DDSParameterExamplesExternalDomainWithLocalServer >> setUp [
	server := DDSDomainDescriptorXMLRPCServer serve: DDSSDomainDescriptor new.
	server domain: DDSSDomainDescriptor new.
	server serveAt: 11311
]

{ #category : #running }
DDSParameterExamplesExternalDomainWithLocalServer >> tearDown [
	super tearDown.
	server domain destroy.
	server stop.
	server domain: nil.
	
]
