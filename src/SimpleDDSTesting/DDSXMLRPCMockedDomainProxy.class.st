"
This class is a plain subclass of the DDSXMLRPCDomainProxy that just override the remote invocation for testing proposes.


"
Class {
	#name : #DDSXMLRPCMockedDomainProxy,
	#superclass : #DDSXMLRPCDomainProxy,
	#instVars : [
		'calledMethod',
		'calledArguments'
	],
	#category : 'SimpleDDSTesting-Proxy'
}

{ #category : #'as yet unclassified' }
DDSXMLRPCMockedDomainProxy >> calledArguments [
	^ calledArguments
]

{ #category : #'as yet unclassified' }
DDSXMLRPCMockedDomainProxy >> calledMethod [
	^ calledMethod
]

{ #category : #'as yet unclassified' }
DDSXMLRPCMockedDomainProxy >> invokeMethod: aMethodName withArgs: aCollectionOfArguments [
	calledMethod := aMethodName.
	calledArguments := aCollectionOfArguments.
	^ {1.
	''.
	Object}
]
