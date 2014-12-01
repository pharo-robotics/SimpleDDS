as yet unclassified
initializeWith: aDomainProxy 
	self serve.
	proxy := aDomainProxy.
	registry := aDomainProxy createOrObtainTypeContainer: self containerName for: self.
