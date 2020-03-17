recovery reconnections
ensureServiceIsRegistered: aService
	self traceCr: 'WARN: re-publishing ' , aService name.
	[ anyRecoveryMethodHasbeenExecuted := true.
	domain mirror forceReRegistrationOfService: aService for: aService server.
	self traceCr: 'INFO: re-publishing done successfully' ]
		on: Error
		do: [ :err | self traceCr: 'ERROR: During re registration of topic publisher ' ]