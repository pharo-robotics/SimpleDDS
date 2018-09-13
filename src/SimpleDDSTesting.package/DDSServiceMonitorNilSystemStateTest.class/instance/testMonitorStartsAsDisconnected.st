as yet unclassified
testMonitorStartsAsDisconnected
	monitor analyzeCurrentState.
	self deny: monitor isBackendConnected.
	
	