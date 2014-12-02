as yet unclassified
tearDown
	super tearDown.
	
	domain destroy.
	domain := nil.
	server stop.
	server := nil.
	
	5 timesRepeat: [ Smalltalk garbageCollect ]