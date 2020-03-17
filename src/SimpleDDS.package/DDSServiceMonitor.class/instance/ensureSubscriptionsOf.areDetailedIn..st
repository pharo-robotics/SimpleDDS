recovery reconnections
ensureSubscriptionsOf: aTopic areDetailedIn: aSetOfSubscribers
	aTopic subscriber subscriptions
		do:
			[ :subscription | (aSetOfSubscribers includes: subscription participant name)
				ifFalse:
					[ self
						traceCr:
							(''
								join:
									{'WARN: '.
									subscription participant name.
									' does not appear as a subscriber in topic '.
									aTopic name}).
					[ anyRecoveryMethodHasbeenExecuted := true.
					domain mirror forceReRegistrationOfSubscription: subscription for: aTopic subscriber.
					self traceCr: 'INFO: topic registered successfully. ' ]
						on: Error
						do: [ :err | self traceCr: 'ERROR: during topic registration. Is the master working? Is the network stable?' ] ] ]