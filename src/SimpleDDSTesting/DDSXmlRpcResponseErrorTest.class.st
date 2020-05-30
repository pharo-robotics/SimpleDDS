Class {
	#name : #DDSXmlRpcResponseErrorTest,
	#superclass : #DDSXmlRpcResponseTest,
	#category : 'SimpleDDSTesting-Proxy'
}

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseErrorTest >> elementsToTest [
	^ {-1.
	(self messageValue).
	nil}
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseErrorTest >> messageValue [
	^ 'Error'
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseErrorTest >> testErrorContainMessage [
	| message |
	[ response value ]
		on: Error
		do: [ :err | message := err messageText ].
	self assert: message equals: response statusMessage.
	self assert: message equals: self messageValue
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseErrorTest >> testResponseIsError [
	self assert: response isError
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseErrorTest >> testResponseIsNotFailure [
	self deny: response isFailure
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseErrorTest >> testResponseIsNotSuccess [
	self deny: response isSuccess
]

{ #category : #'as yet unclassified' }
DDSXmlRpcResponseErrorTest >> testValueCrashes [
	self should: [ response value ] raise: Error
]
