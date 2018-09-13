private
monitor
	[ self analyzeCurrentState.
	domain mirror
		ifNotNil: [ self whenReconnectionOrRoutine: [ self synchronizeDomains ] ]
		ifNil: [ self logCr: 'WARNING: domain mirror is not yet setup. Service monitor cannot start to run' ].
	self wait ]
		on: Error
		do: [ :err | self logCr: 'ERROR: service monitor error ' , err messageText ]