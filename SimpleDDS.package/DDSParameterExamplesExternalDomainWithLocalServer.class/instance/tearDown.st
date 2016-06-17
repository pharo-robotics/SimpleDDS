running
tearDown
	super tearDown.
	server domain destroy.
	server stop.
	server domain: nil.
	