as yet unclassified
testServerDoneByExternalDomainCreatesAnExposedServer
	self assert: (service server isKindOf: DDSExposedServiceServer)