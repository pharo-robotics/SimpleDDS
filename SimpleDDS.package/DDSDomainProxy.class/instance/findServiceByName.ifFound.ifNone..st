query
findServiceByName: aServiceName ifFound: ifFound ifNone: ifNone
	^ (self registeredServices detect: [ :s | s name = aServiceName ] ifFound: ifFound ifNone: ifNone)