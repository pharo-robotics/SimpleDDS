recovery reconnections
ensureSubscriptionsAreRegistered: aTopic
	self logCr: 'WARN: re-subscribing ' , aTopic name.
	[ 
	aTopic subscriber subscriptions
		do: [ :subscription | 
			anyRecoveryMethodHasbeenExecuted := true.
			domain mirror forceReRegistrationOfSubscription: subscription for: aTopic subscriber.
			self logCr: 'INFO: re-subscribing done successfully' ] ]
		on: Error
		do: [ :err | self logCr: 'ERROR: During re registration of topic publisher ' ]