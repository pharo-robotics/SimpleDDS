"
A RoStMasterProxy is the proxy for the ROS Master, that is the node that gives access to all other nodes and to system information.
"
Class {
	#name : #DDSXMLRPCDomainProxy,
	#superclass : #DDSXMLRPCProxy,
	#category : 'SimpleDDS-Proxy'
}

{ #category : #'API-Parameter-Server' }
DDSXMLRPCDomainProxy >> deleteParam: aCallerId named: aParameterName [
	^ self
		invokeMethod: 'deleteParam'
		withArgs:
			{aCallerId.
			aParameterName}
]

{ #category : #'API-Parameter-Server' }
DDSXMLRPCDomainProxy >> getParam: aCallerId named: aParameterName [
	^ self
		invokeMethod: 'getParam'
		withArgs:
			{aCallerId.
			aParameterName}
]

{ #category : #'API-Parameter-Server' }
DDSXMLRPCDomainProxy >> getParamNames: aCallerId [
	^ self invokeMethod: 'getParamNames' withArgs: {aCallerId}
]

{ #category : #'API-Data-Accessors' }
DDSXMLRPCDomainProxy >> getSystemState: aCallerId [
	^ self invokeMethod: 'getSystemState' withArgs: {aCallerId}
]

{ #category : #'API-Data-Accessors' }
DDSXMLRPCDomainProxy >> getTopicTypes: aCallerId [
	^ self invokeMethod: 'getTopicTypes' withArgs: {aCallerId}
]

{ #category : #'API-Data-Accessors' }
DDSXMLRPCDomainProxy >> getUri: aCallerId [
	^ self invokeMethod: 'getUri' withArgs: {aCallerId}
]

{ #category : #'API-Parameter-Server' }
DDSXMLRPCDomainProxy >> hasParam: aCallerId named: aParameterName [
	^ self
		invokeMethod: 'hasParam'
		withArgs:
			{aCallerId.
			aParameterName}
]

{ #category : #implemented }
DDSXMLRPCDomainProxy >> lookupNode: aCallerID named: aNodeName [ 
	^ self lookupNode: aNodeName with: aCallerID
]

{ #category : #API }
DDSXMLRPCDomainProxy >> lookupNode: nodeName with: aCallerId [
	^ self
		invokeMethod: 'lookupNode'
		withArgs:
			{aCallerId.
			nodeName}
]

{ #category : #unimplemented }
DDSXMLRPCDomainProxy >> lookupService: aCallerId named: aServiceName [
	^ self
		invokeMethod: 'lookupService'
		withArgs:
			{aCallerId.
			aServiceName}
]

{ #category : #API }
DDSXMLRPCDomainProxy >> lookupService: serviceName with: aCallerId [
	^ self
		invokeMethod: 'lookupService'
		withArgs:
			{aCallerId.
			serviceName}
]

{ #category : #implemented }
DDSXMLRPCDomainProxy >> registerPublisher: aCallerId to: aTopicName with: aTopicMessageType andCallerUri: anUri [
	^ self
		invokeMethod: 'registerPublisher'
		withArgs:
			{aCallerId.
			aTopicName.
			aTopicMessageType.
			anUri}
]

{ #category : #API }
DDSXMLRPCDomainProxy >> registerServiceFor: aCallerId named: serviceName at: aROSRPCUrl for: aXMLRPCUrl [ 
	^ self
		invokeMethod: 'registerService'
		withArgs:
			{aCallerId.
			serviceName.
			aROSRPCUrl.
			aXMLRPCUrl}
]

{ #category : #implemented }
DDSXMLRPCDomainProxy >> registerSubscriber: aCallerId to: aTopicName with: aTopicMessageType andCallerUri: anUri [
	^ self
		invokeMethod: 'registerSubscriber'
		withArgs:
			{aCallerId.
			aTopicName.
			aTopicMessageType.
			anUri}
]

{ #category : #'API-Parameter-Server' }
DDSXMLRPCDomainProxy >> searchParam: aCallerId  forParameter: aParameterName [
	^ self
		serviceResult:
			(self
				invokeMethod: 'searchParam'
				withArgs:
					{aCallerId.
					aParameterName})
]

{ #category : #private }
DDSXMLRPCDomainProxy >> serviceResult: aResult [
	^ (aResult at: 1) = 1
		ifTrue: [ aResult at: 3 ]
		ifFalse: [ self error: (aResult at: 2) ]
]

{ #category : #'API-Parameter-Server' }
DDSXMLRPCDomainProxy >> setParam: aCallerId named: aParameterName with: anObject [
	^ self
		invokeMethod: 'setParam'
		withArgs:
			{aCallerId.
			aParameterName.
			anObject}
]

{ #category : #'API-Parameter-Server' }
DDSXMLRPCDomainProxy >> subscribeParam: aCallerId callingBack: anXMLRPCUrl forParameter: aParameterName [
	^ self
		invokeMethod: 'subscribeParam'
		withArgs:
			{aCallerId.
			anXMLRPCUrl.
			aParameterName}
]

{ #category : #implemented }
DDSXMLRPCDomainProxy >> unregisterPublisher: aCallerId from: aTopicName andCallerUri: anUri [
	^ self
		invokeMethod: 'unregisterPublisher'
		withArgs:
			{aCallerId.
			aTopicName.
			anUri}
]

{ #category : #implemented }
DDSXMLRPCDomainProxy >> unregisterSubscriber: aCallerId from: aTopicName andCallerUri: anUri [
	^ self
		invokeMethod: 'unregisterSubscriber'
		withArgs:
			{aCallerId.
			aTopicName.
			anUri}
]

{ #category : #'API-Parameter-Server' }
DDSXMLRPCDomainProxy >> unsubscribeParam: aCallerId callingBack: anXMLRPCUrl forParameter: aParameterName [
	^ self
		serviceResult:
			(self
				invokeMethod: 'unsubscribeParam'
				withArgs:
					{aCallerId.
					anXMLRPCUrl.
					aParameterName})
]
