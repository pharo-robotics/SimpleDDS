private
tearDown: aDomain
	aDomain destroy.
	20 timesRepeat: [ Smalltalk garbageCollect  ].