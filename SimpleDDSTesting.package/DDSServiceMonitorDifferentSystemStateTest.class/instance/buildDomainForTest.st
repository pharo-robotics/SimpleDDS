as yet unclassified
buildDomainForTest
	^ DDSExternallyDefinedDomainMock new
		selfMirror;
		systemState: self systemState;
		yourself