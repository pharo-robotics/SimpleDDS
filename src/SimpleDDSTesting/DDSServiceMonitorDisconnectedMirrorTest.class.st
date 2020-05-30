Class {
	#name : #DDSServiceMonitorDisconnectedMirrorTest,
	#superclass : #DDSServiceMonitorTest,
	#category : 'SimpleDDSTesting-ServiceMonitor'
}

{ #category : #'as yet unclassified' }
DDSServiceMonitorDisconnectedMirrorTest >> buildDomainForTest [
	^ DDSExternallyDefinedDomainMock new
		disconnectedMirror;
		selfMirror;
		yourself
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorDisconnectedMirrorTest >> testBrokenConnectionsDoesnotReconnectBackend [
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorDisconnectedMirrorTest >> testBrokenMasterDataHasNotChange [
	monitor analyzeCurrentState.
	self deny: monitor masterMetaDataHasChanged 
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorDisconnectedMirrorTest >> testDoesNotReconnectedBackendWithNilState [
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorDisconnectedMirrorTest >> testMonitorStartsAsDisconnected [
	self deny: monitor isBackendConnected.
	
	
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorDisconnectedMirrorTest >> testSecondLectureWithBrokenConnectionsDoesnotReconnectBackend [
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected.
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected
]
