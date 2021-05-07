"
A participant in ROS 1 is called node. This is the real proxy and it manages the raw xmlrpc protocol.
"
Class {
	#name : #DDSXMLRPCDomainParticipantProxy,
	#superclass : #DDSXMLRPCProxy,
	#category : #'SimpleDDS-Proxy'
}

{ #category : #'ros-xml-reponses' }
DDSXMLRPCDomainParticipantProxy >> from: aCallerID update: aParameterName with: aValue [
self halt.
	^ self
		invokeMethod: 'paramUpdate'
		withArgs:
			{aCallerID.
			aParameterName.
			aValue}
]

{ #category : #'ros-xml-reponses' }
DDSXMLRPCDomainParticipantProxy >> getBusInfo: aCallerID [
	^ self invokeMethod: 'getBusInfo' withArgs: {aCallerID}
]

{ #category : #'ros-xml-reponses' }
DDSXMLRPCDomainParticipantProxy >> getPid: aCallerID [
	^ self invokeMethod: 'getPid' withArgs: {aCallerID}
]

{ #category : #'publishing metadata' }
DDSXMLRPCDomainParticipantProxy >> informFrom: aCallerID for: aTopicName publishers: anArrayOfPublishers [
	^ self
		invokeMethod: 'publisherUpdate'
		withArgs:
			{aCallerID.
			aTopicName.
			anArrayOfPublishers asArray}
]

{ #category : #'as yet unclassified' }
DDSXMLRPCDomainParticipantProxy >> requestFor: aCallerId theTopic: aTopicName withProtocol: aSetOfProtocols [
	^ self
		invokeMethod: 'requestTopic'
		withArgs:
			{aCallerId.
			aTopicName.
			{(aSetOfProtocols asArray)}}
]

{ #category : #service }
DDSXMLRPCDomainParticipantProxy >> shutdown: aCallerID cause: aCause [
	^ self
		invokeMethod: 'shutdown'
		withArgs:
			{aCallerID.
			aCause}
]
