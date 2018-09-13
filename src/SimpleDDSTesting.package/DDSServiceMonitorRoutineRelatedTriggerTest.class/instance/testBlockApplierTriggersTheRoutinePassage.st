as yet unclassified
testBlockApplierTriggersTheRoutinePassage
	| value |
	value := false.
	self
		callBlockExecutor:
			(DDSServiceMonitor routinePassageMinThreadshold + DDSServiceMonitor routinePassageMaxThreadshold) // 2.
	monitor whenReconnectionOrRoutine: [ value := true ].
	self assert: value