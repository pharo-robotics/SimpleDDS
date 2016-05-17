entry point
wait
	anyRecoveryMethodHasbeenExecuted
		ifTrue: [ rate := 10 hz ]
		ifFalse: [ rate := 0.5 hz max: rate - 0.5 hz ].
	rate cycleDelay wait