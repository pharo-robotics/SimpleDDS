as yet unclassified
testDoesNotReconnectedDuringSecondLectureBackendWithNewState
	monitor analyzeCurrentState.
	self assert: monitor masterHasBeenReconnected.
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected