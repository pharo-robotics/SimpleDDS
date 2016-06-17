query
findServiceByName: aServiceName ifFound: aBlockClosure ifNone: anOtherBlock
	^ self services
		detect: [ :s | s name = aServiceName ]
		ifFound: aBlockClosure
		ifNone: anOtherBlock