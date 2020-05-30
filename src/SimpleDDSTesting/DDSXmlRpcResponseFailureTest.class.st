Class {
	#name : #DDSXmlRpcResponseFailureTest,
	#superclass : #DDSXmlRpcResponseTest,
	#category : 'SimpleDDSTesting-Proxy'
}

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseFailureTest >> elementsToTest [
	^ {0.
	(self messageValue).
	nil}
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseFailureTest >> messageValue [
	^ 'Failure'
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseFailureTest >> testErrorContainMessage [
	| message |
	[ response value ]
		on: Error
		do: [ :err | message := err messageText ].
	self assert: message equals: response statusMessage.
	self assert: message equals: self messageValue
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseFailureTest >> testResponseIsFailure [
	self assert: response isFailure
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseFailureTest >> testResponseIsNotError [
	self deny: response isError
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseFailureTest >> testResponseIsNotSuccess [
	self deny: response isSuccess
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseFailureTest >> testValueCrashes [
	self should: [ response value ] raise: Error
]
