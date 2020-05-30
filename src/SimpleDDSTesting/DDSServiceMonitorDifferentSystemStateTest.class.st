Class {
	#name : #DDSServiceMonitorDifferentSystemStateTest,
	#superclass : #DDSServiceMonitorTest,
	#instVars : [
		'generator'
	],
	#category : 'SimpleDDSTesting-ServiceMonitor'
}

{ #category : #'as yet unclassified' }
DDSServiceMonitorDifferentSystemStateTest >> buildDomainForTest [
	^ DDSExternallyDefinedDomainMock new
		selfMirror;
		systemState: self systemState;
		yourself
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorDifferentSystemStateTest >> generatedState: aNumber [
	^{
		" publisher "
		{ #topic1. 	{'pub'. 'pub2' . aNumber }}.	
		" subscriber "
		{  #topic2. {'sub'. 'sub2' . aNumber}}.	
		" publisher "
		{}
	}
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorDifferentSystemStateTest >> systemState [
	generator ifNil: [ generator := Generator on: [ :g | 1 to: 1000 do: [ :i | g yield: (self generatedState: i) ] ] ].
	^ [ generator next ]
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorDifferentSystemStateTest >> testDoesNotReconnectedDuringSecondLectureBackendWithNewState [
	monitor analyzeCurrentState.
	self assert: monitor masterHasBeenReconnected.
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorDifferentSystemStateTest >> testDoesReconnectedBackendWithNewState [
	monitor analyzeCurrentState.
	self assert: monitor masterHasBeenReconnected
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorDifferentSystemStateTest >> testMonitorStartsAsDisconnected [
	self deny: monitor isBackendConnected.
	
	
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorDifferentSystemStateTest >> testSameDataMasterDataHasChange [
	monitor analyzeCurrentState.
	self assert: monitor masterMetaDataHasChanged 
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorDifferentSystemStateTest >> testSameDataMasterDataHasChangeAtSecondLecture [
	monitor analyzeCurrentState.
	self assert: monitor masterMetaDataHasChanged.
	monitor analyzeCurrentState.
	self assert: monitor masterMetaDataHasChanged
]
