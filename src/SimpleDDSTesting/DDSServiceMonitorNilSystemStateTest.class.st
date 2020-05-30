Class {
	#name : #DDSServiceMonitorNilSystemStateTest,
	#superclass : #DDSServiceMonitorTest,
	#category : 'SimpleDDSTesting-ServiceMonitor'
}

{ #category : #'as yet unclassified' }
DDSServiceMonitorNilSystemStateTest >> buildDomainForTest [
	^ DDSExternallyDefinedDomainMock new
		selfMirror;
		yourself
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorNilSystemStateTest >> testDoesNotReconnectedBackendWithNilState [
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorNilSystemStateTest >> testMonitorStartsAsDisconnected [
	monitor analyzeCurrentState.
	self deny: monitor isBackendConnected.
	
	
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorNilSystemStateTest >> testNilStateMasterDataHasNotChange [
	monitor analyzeCurrentState.
	self deny: monitor masterMetaDataHasChanged 
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorNilSystemStateTest >> testNilSystemStateDoesNotReconnectBackend [
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorNilSystemStateTest >> testSecondNilSystemStateLectureDoesNotReconnectBackend [
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected.
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected
]
