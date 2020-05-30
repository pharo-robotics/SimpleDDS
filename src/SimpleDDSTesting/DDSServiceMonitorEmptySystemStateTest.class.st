Class {
	#name : #DDSServiceMonitorEmptySystemStateTest,
	#superclass : #DDSServiceMonitorTest,
	#category : 'SimpleDDSTesting-ServiceMonitor'
}

{ #category : #'as yet unclassified' }
DDSServiceMonitorEmptySystemStateTest >> buildDomainForTest [
	^ DDSExternallyDefinedDomainMock new
		selfMirror;
		systemState: {};
		yourself
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorEmptySystemStateTest >> testDoesNotReconnectedBackendWithNilState [
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorEmptySystemStateTest >> testEmptyStateMasterDataHasNotChange [
	monitor analyzeCurrentState.
	self deny: monitor masterMetaDataHasChanged 
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorEmptySystemStateTest >> testMonitorStartsAsDisconnected [
	monitor analyzeCurrentState.
	self deny: monitor isBackendConnected
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorEmptySystemStateTest >> testNilSystemStateDoesNotReconnectBackend [
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorEmptySystemStateTest >> testSecondNilSystemStateLectureDoesNotReconnectBackend [
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected.
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected
]
