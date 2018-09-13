as yet unclassified
testSecondLectureWithBrokenConnectionsDoesnotReconnectBackend
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected.
	monitor analyzeCurrentState.
	self deny: monitor masterHasBeenReconnected