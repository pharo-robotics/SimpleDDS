as yet unclassified
callBlockExecutor: anAmmountOfTimes
	| value |
	value := false.
	anAmmountOfTimes
		timesRepeat: [ 
			monitor whenReconnectionOrRoutine: [ value := true ].
			self deny: value ]