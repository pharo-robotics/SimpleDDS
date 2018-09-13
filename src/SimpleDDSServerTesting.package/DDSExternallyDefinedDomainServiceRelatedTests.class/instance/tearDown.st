as yet unclassified
tearDown
	domain destroy.
	server stop.
	serverDescriptor destroy.
	
	" domain := nil."
	super tearDown .