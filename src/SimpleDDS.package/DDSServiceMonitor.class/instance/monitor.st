private
monitor
	[ self analyzeCurrentState.
	domain mirror
		ifNotNil: [ self whenReconnectionOrRoutine: [ self synchronizeDomains ] ]
		ifNil: [ self
				traceCr:
					'WARNING: domain mirror is not yet setup. Service monitor cannot start to run' ].
	self wait ]
		on: Error
		do:
			[ :err | self traceCr: 'ERROR: service monitor error ' , err messageText ]