initialization
initializeWith: aDomainProxy
	serving := false.
	ip := aDomainProxy ip.
	port := aDomainProxy obtainPort.
	super initializeWith: aDomainProxy