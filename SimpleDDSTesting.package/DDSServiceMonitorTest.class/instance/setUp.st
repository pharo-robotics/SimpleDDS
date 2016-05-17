as yet unclassified
setUp
	monitor := DDSServiceMonitor new
		domain: self buildDomainForTest;
		yourself.
	