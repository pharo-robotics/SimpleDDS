Class {
	#name : #DDSXMLRPCDomainParticipantProtocolTest,
	#superclass : #TestCase,
	#instVars : [
		'proxy'
	],
	#category : 'SimpleDDSTesting-Proxy'
}

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainParticipantProtocolTest >> setUp [
	super setUp.
	proxy := DDSXMLRPCMockedDomainParticipantProxy new.
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainParticipantProtocolTest >> testGetBusInfo [
	proxy getBusInfo:'aCallerID'.
	self assert: proxy calledMethod equals: #getBusInfo.
	self assert: proxy calledArguments equals: {'aCallerID'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainParticipantProtocolTest >> testGetPid [
	proxy getPid:'aCallerID'.
	self assert: proxy calledMethod equals: #getPid.
	self assert: proxy calledArguments equals: {'aCallerID'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainParticipantProtocolTest >> testInformPublishers [
	proxy informFrom: 'aCallerID' for: 'aTopicName' publishers: {'anArrayOfPublishers'}.
	self assert: proxy calledMethod equals: #publisherUpdate.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerID'.
			'aTopicName'.
			{'anArrayOfPublishers'}}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainParticipantProtocolTest >> testParamUpdate [
	proxy from: 'aCallerID' update: 'aParameterName' with: 'aValue'.
	self assert: proxy calledMethod equals: #paramUpdate.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerID'.
			'aParameterName'.
			'aValue'}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainParticipantProtocolTest >> testRequestTopic [
	proxy requestFor: 'aCallerId' theTopic: 'aTopicName' withProtocol: {'aSetOfProtocols'}.
	self assert: proxy calledMethod equals: #requestTopic.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerId'.
			'aTopicName'.
			{{'aSetOfProtocols'}}}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainParticipantProtocolTest >> testShutdown [
	proxy shutdown: 'aCallerID' cause: 'aCause'.
	self assert: proxy calledMethod equals: #shutdown.
	self
		assert: proxy calledArguments
		equals:
			{'aCallerID'.
			'aCause'}
]
