recovery reconnections
ensureSubscriptionsAreRegistered: aTopic
	self traceCr: 'WARN: re-subscribing ' , aTopic name.
	[ aTopic subscriber subscriptions
		do: [ :subscription | 
			anyRecoveryMethodHasbeenExecuted := true.
			domain mirror
				forceReRegistrationOfSubscription: subscription
				for: aTopic subscriber.
			self traceCr: 'INFO: re-subscribing done successfully' ] ]
		on: Error
		do:
			[ :err | self traceCr: 'ERROR: During re registration of topic publisher ' ]