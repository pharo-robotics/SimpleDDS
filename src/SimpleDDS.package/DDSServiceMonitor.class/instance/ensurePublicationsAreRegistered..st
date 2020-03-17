recovery reconnections
ensurePublicationsAreRegistered: aTopic
	self traceCr: 'WARN: re-publishing ' , aTopic name.
	[ 
	aTopic publisher publications
		do: [ :publication | 
			anyRecoveryMethodHasbeenExecuted := true.
			domain mirror forceReRegistrationOfPublication: publication for: aTopic publisher.
			self traceCr: 'INFO: re-publishing done successfully' ] ]
		on: Error
		do: [ :err | self traceCr: 'ERROR: During re registration of topic publisher ' ]