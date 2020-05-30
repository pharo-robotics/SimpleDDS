Class {
	#name : #DDSXmlRpcResponseSuccessTest,
	#superclass : #DDSXmlRpcResponseTest,
	#category : 'SimpleDDSTesting-Proxy'
}

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseSuccessTest >> elementsToTest [
	^ {1.
	''.
	(self resultValue)}
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseSuccessTest >> resultValue [
	^ Object
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseSuccessTest >> testResponseIsSuccess [
	self assert: response isSuccess
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseSuccessTest >> testSuccessIsNotError [
	self deny: response isError
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseSuccessTest >> testSuccessIsNotFailure [
	self deny: response isFailure
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseSuccessTest >> testValueIsTheConfiguredOne [
	self assert: response value equals: self resultValue
]
