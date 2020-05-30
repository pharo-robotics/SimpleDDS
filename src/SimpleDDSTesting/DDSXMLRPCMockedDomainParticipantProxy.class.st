"
This class is a plain subclass of the DDSXMLRPCDomainParticipantProxy that just override the remote invocation for testing proposes.


"
Class {
	#name : #DDSXMLRPCMockedDomainParticipantProxy,
	#superclass : #DDSXMLRPCDomainParticipantProxy,
	#instVars : [
		'calledMethod',
		'calledArguments'
	],
	#category : 'SimpleDDSTesting-Proxy'
}

{ #category : #'as yet unclassified' }
DDSXMLRPCMockedDomainParticipantProxy >> calledArguments [
	^ calledArguments
]

{ #category : #'as yet unclassified' }
DDSXMLRPCMockedDomainParticipantProxy >> calledMethod [
	^ calledMethod
]

{ #category : #'as yet unclassified' }
DDSXMLRPCMockedDomainParticipantProxy >> invokeMethod: aMethodName withArgs: aCollectionOfArguments [
	calledMethod := aMethodName.
	calledArguments := aCollectionOfArguments.
	^ {1.
	''.
	Object}
]
