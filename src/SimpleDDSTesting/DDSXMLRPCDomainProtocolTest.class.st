Class {
	#name : #DDSXMLRPCDomainProtocolTest,
	#superclass : #TestCase,
	#instVars : [
		'proxy'
	],
	#category : 'SimpleDDSTesting-Proxy'
}

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> setUp [
	super setUp.
	proxy := DDSXMLRPCMockedDomainProxy new.
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testDeleteParam [
	proxy deleteParam: 'aCallerId' named: 'aParameterName'.
	self assert: proxy calledMethod equals: #deleteParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aParameterName'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testGetParam [
	proxy getParam: 'aCallerId' named: 'aParameterName'.
	self assert: proxy calledMethod equals: #getParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aParameterName'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testGetParamNames [
	proxy getParamNames: 'aCallerId'.
	self assert: proxy calledMethod equals: #getParamNames.
	self assert: proxy calledArguments equals: {'aCallerId'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testGetSystemState [
	proxy getSystemState: 'aCallerId'.
	self assert: proxy calledMethod equals: #getSystemState.
	self assert: proxy calledArguments equals: {'aCallerId'}
	
	
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testGetTopicTypes [
	proxy getTopicTypes: 'aCallerId'.
	self assert: proxy calledMethod equals: #getTopicTypes.
	self assert: proxy calledArguments equals: {'aCallerId'}

]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testGetUri [
	proxy getUri: 'aCallerId'.
	self assert: proxy calledMethod equals: #getUri.
	self assert: proxy calledArguments equals: {'aCallerId'}

]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testHasParam [
	proxy hasParam: 'aCallerId' named: 'aParameterName'.
	self assert: proxy calledMethod equals: #hasParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aParameterName'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testLookupNode [
	proxy lookupNode: 'nodeName' with: 'ID'.
	self assert: proxy calledMethod equals: #lookupNode.
	self
		assert: proxy calledArguments
		equals:
			{'ID'.
			'nodeName'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testLookupService [
	proxy lookupService: 'serviceName' with: 'ID'.
	self assert: proxy calledMethod equals: 'lookupService'.
	self
		assert: proxy calledArguments
		equals:
			{'ID'.
			'serviceName'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testRegisterPublisher [
	proxy
		registerPublisher: 'aCallerId'
		to: 'aTopicName'
		with: 'aTopicMessageType'
		andCallerUri: 'anUri'.
	self assert: proxy calledMethod equals: #registerPublisher.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aTopicName'.
			'aTopicMessageType'.
			'anUri'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testRegisterService [
	proxy
		registerServiceFor: 'ID'
		named: 'serviceName'
		at: 'aROSRPCUrl'
		for: 'aXMLRPCUrl'.
	self assert: proxy calledMethod equals: 'registerService'.
	self
		assert: proxy calledArguments
		equals: {'ID'. 'serviceName'. 'aROSRPCUrl'. 'aXMLRPCUrl'. }
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testRegisterSubscriber [
	proxy
		registerSubscriber: 'aCallerId'
		to: 'aTopicName'
		with: 'aTopicMessageType'
		andCallerUri: 'anUri'.
	self assert: proxy calledMethod equals: #registerSubscriber.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aTopicName'.
			'aTopicMessageType'.
			'anUri'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testSearchParam [
	proxy searchParam: 'aCallerId' forParameter: 'aParameterName'.
	self assert: proxy calledMethod equals: #searchParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aParameterName'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testSetParam [
	proxy setParam: 'aCallerId' named: 'aParameterName' with: 'value'.
	self assert: proxy calledMethod equals: #setParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aParameterName'.
			'value'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testSubscribeParam [
	proxy subscribeParam: 'aCallerId' callingBack: 'anXMLRPCUrl' forParameter: 'aParameterName'.
	self assert: proxy calledMethod equals: #subscribeParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'anXMLRPCUrl'.
			'aParameterName'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testUnegisterPublisher [
	proxy unregisterPublisher: 'aCallerId' from: 'aTopicName' andCallerUri: 'anUri'.
	self assert: proxy calledMethod equals: #unregisterPublisher.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aTopicName'.
			'anUri'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testUnegisterSubscriber [
	proxy unregisterSubscriber: 'aCallerId' from: 'aTopicName' andCallerUri: 'anUri'.
	self assert: proxy calledMethod equals: #unregisterSubscriber.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aTopicName'.
			'anUri'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainProtocolTest >> testUnsubscribeParam [
	proxy unsubscribeParam: 'aCallerId' callingBack: 'anXMLRPCUrl' forParameter: 'aParameterName'.
	self assert: proxy calledMethod equals: #unsubscribeParam.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'anXMLRPCUrl'.
			'aParameterName'}
]
