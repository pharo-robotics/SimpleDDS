as yet unclassified
initializeWith: aDomainProxy
	serving := false.
	ip := aDomainProxy ip.
	port := aDomainProxy obtainPort.
	super initializeWith: aDomainProxy