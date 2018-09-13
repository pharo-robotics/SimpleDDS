as yet unclassified
testSecondNilSystemStateLectureDoesNotReconnectBackend
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected.
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected