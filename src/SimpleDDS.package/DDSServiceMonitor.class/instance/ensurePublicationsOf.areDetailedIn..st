recovery reconnections
ensurePublicationsOf: aTopic areDetailedIn: aSetOfPublications
	aTopic publisher publications
		do:
			[ :publication | (aSetOfPublications includes: publication participant name)
				ifFalse:
					[ self
						logCr:
							(''
								join:
									{'WARN: '.
									publication participant name.
									' does not appear as a publisher in topic '.
									aTopic name}).
					[ anyRecoveryMethodHasbeenExecuted := true.
					domain mirror forceReRegistrationOfPublication: publication for: aTopic publisher.
					self logCr: 'INFO: topic registered successfully. ' ]
						on: Error
						do: [ :err | self logCr: 'ERROR: during topic registration. Is the master working? Is the network stable?' ] ] ]