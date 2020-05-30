Class {
	#name : #DDSXmlRpcResponseTest,
	#superclass : #TestCase,
	#instVars : [
		'response'
	],
	#category : 'SimpleDDSTesting-Proxy'
}

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseTest >> elementsToTest [ 
	^ self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseTest >> setUp [
	super setUp.
	response := DDSXmlRpcResponse elements: self elementsToTest .

]
