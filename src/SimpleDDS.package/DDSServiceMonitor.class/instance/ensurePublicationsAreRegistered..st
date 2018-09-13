recovery reconnections
ensurePublicationsAreRegistered: aTopic
	self logCr: 'WARN: re-publishing ' , aTopic name.
	[ 
	aTopic publisher publications
		do: [ :publication | 
			anyRecoveryMethodHasbeenExecuted := true.
			domain mirror forceReRegistrationOfPublication: publication for: aTopic publisher.
			self logCr: 'INFO: re-publishing done successfully' ] ]
		on: Error
		do: [ :err | self logCr: 'ERROR: During re registration of topic publisher ' ]