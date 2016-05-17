recovery reconnections
ensureServiceIsRegistered: aService
	self logCr: 'WARN: re-publishing ' , aService name.
	[ anyRecoveryMethodHasbeenExecuted := true.
	domain mirror forceReRegistrationOfService: aService for: aService server.
	self logCr: 'INFO: re-publishing done successfully' ]
		on: Error
		do: [ :err | self logCr: 'ERROR: During re registration of topic publisher ' ]