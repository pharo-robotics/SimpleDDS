accessing
tearDown
	super tearDown.
	server stop.
	server domain: nil.
	