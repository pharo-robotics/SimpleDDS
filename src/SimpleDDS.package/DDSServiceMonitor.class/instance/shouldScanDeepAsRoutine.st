query
shouldScanDeepAsRoutine
	^ timesChecked > threadshold
		ifTrue: [ 
			timesChecked := 1.
			true ]
		ifFalse: [ 
			timesChecked := timesChecked + 1.
			false ]