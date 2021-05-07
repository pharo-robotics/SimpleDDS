"
This example works with an internal domain. Then it has not dependencies to be fitted
"
Class {
	#name : #DDSTopicExamplesInternalDomain,
	#superclass : #DDSTopicExamples,
	#instVars : [
		'domain'
	],
	#category : 'SimpleDDS-Examples'
}

{ #category : #private }
DDSTopicExamplesInternalDomain >> createExampleDomain [
	^ domain
]

{ #category : #running }
DDSTopicExamplesInternalDomain >> setUp [
	domain := MDDSInternallyDefinedDomain new.	" Add the protocol support "
	domain addProtocol: (DDSTCPProtocol encoding: MDDSEncoder decoding: MDDSDecoder).

]

{ #category : #running }
DDSTopicExamplesInternalDomain >> tearDown [
	super tearDown.
	domain destroy
]
