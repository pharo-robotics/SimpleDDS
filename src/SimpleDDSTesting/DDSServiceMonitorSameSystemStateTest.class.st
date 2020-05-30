Class {
	#name : #DDSServiceMonitorSameSystemStateTest,
	#superclass : #DDSServiceMonitorTest,
	#category : 'SimpleDDSTesting-ServiceMonitor'
}

{ #category : #'as yet unclassified' }
DDSServiceMonitorSameSystemStateTest >> buildDomainForTest [
	^ DDSExternallyDefinedDomainMock new
		selfMirror;
		systemState: self systemState;
		yourself
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorSameSystemStateTest >> systemState [
	^ {
	" publisher "
	{ #topic1. 	{'pub'. 'pub2'}}.	
	" subscriber "
	{  #topic2. {'sub'. 'sub2'}}.	
	" publisher "
	{}
}
		
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorSameSystemStateTest >> testDoesNotReconnectedDuringSecondLectureBackendWithNewState [
	monitor analyzeCurrentState.
	self assert: monitor masterHasBeenReconnected.
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorSameSystemStateTest >> testDoesReconnectedBackendWithNewState [
	monitor analyzeCurrentState.
	self assert: monitor masterHasBeenReconnected
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorSameSystemStateTest >> testMonitorStartsAsDisconnected [
	self deny: monitor isBackendConnected.
	
	
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorSameSystemStateTest >> testSameDataMasterDataHasChange [
	monitor analyzeCurrentState.
	self assert: monitor masterMetaDataHasChanged 
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorSameSystemStateTest >> testSameDataMasterDataHasNotChangeAtSecondLecture [
	monitor analyzeCurrentState.
	self assert: monitor masterMetaDataHasChanged.
	monitor analyzeCurrentState.
	self deny: monitor masterMetaDataHasChanged
]
