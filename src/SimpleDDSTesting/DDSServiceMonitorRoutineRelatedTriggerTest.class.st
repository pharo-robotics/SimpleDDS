Class {
	#name : #DDSServiceMonitorRoutineRelatedTriggerTest,
	#superclass : #DDSServiceMonitorTest,
	#category : 'SimpleDDSTesting-ServiceMonitor'
}

{ #category : #'as yet unclassified' }
DDSServiceMonitorRoutineRelatedTriggerTest >> buildDomainForTest [
	^ DDSExternallyDefinedDomainMock new.
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorRoutineRelatedTriggerTest >> callBlockExecutor: anAmmountOfTimes [
	| value |
	value := false.
	anAmmountOfTimes
		timesRepeat: [ 
			monitor whenReconnectionOrRoutine: [ value := true ].
			self deny: value ]
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorRoutineRelatedTriggerTest >> testBlockApplierTriggersTheRoutinePassage [
	| value |
	value := false.
	self
		callBlockExecutor:
			(DDSServiceMonitor routinePassageMinThreadshold + DDSServiceMonitor routinePassageMaxThreadshold) // 2.
	monitor whenReconnectionOrRoutine: [ value := true ].
	self assert: value
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorRoutineRelatedTriggerTest >> testRoutineCallArrives [
	(DDSServiceMonitor routinePassageMinThreadshold + DDSServiceMonitor routinePassageMaxThreadshold) // 2
		timesRepeat: [ self deny: monitor shouldScanDeepAsRoutine ].
	self assert: monitor shouldScanDeepAsRoutine
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorRoutineRelatedTriggerTest >> testRoutineCallThreadsholdShiftsUpArrives [
	| value |
	0 to: (DDSServiceMonitor routinePassageMinThreadshold + DDSServiceMonitor routinePassageMaxThreadshold) // 2 - 1 do: [ :time | 
		value := false.
		self
			callBlockExecutor:
				((DDSServiceMonitor routinePassageMinThreadshold + DDSServiceMonitor routinePassageMaxThreadshold) // 2) + time.
		monitor whenReconnectionOrRoutine: [ value := true ].
		self assert: value ].
	
	self assert: monitor threadshold equals: DDSServiceMonitor routinePassageMaxThreadshold.
]
