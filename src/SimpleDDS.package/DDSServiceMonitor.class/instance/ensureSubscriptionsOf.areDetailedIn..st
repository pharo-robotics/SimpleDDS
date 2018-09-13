recovery reconnections
ensureSubscriptionsOf: aTopic areDetailedIn: aSetOfSubscribers
	aTopic subscriber subscriptions
		do:
			[ :subscription | (aSetOfSubscribers includes: subscription participant name)
				ifFalse:
					[ self
						logCr:
							(''
								join:
									{'WARN: '.
									subscription participant name.
									' does not appear as a subscriber in topic '.
									aTopic name}).
					[ anyRecoveryMethodHasbeenExecuted := true.
					domain mirror forceReRegistrationOfSubscription: subscription for: aTopic subscriber.
					self logCr: 'INFO: topic registered successfully. ' ]
						on: Error
						do: [ :err | self logCr: 'ERROR: during topic registration. Is the master working? Is the network stable?' ] ] ]