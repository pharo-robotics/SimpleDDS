query
findServiceByName: aServiceName ifNone: aBlockClosure
	^ self services
		detect: [ :s | s name = aServiceName ]
		ifNone: aBlockClosure