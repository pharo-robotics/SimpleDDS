waiting
wait
	rate := anyRecoveryMethodHasbeenExecuted
		ifTrue: [ 10 hz ]
		ifFalse: [ 0.5 hz max: rate - 0.5 hz ].
	rate cycleDelay wait