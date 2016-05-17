as yet unclassified
findServiceByName: aServiceName ifFound: aBlockClosure ifNone: anOtherBlock
	^ self services
		detect: [ :s | s name = aServiceName ]
		ifFound: aBlockClosure
		ifNone: [ 
			^ mirror
				findServiceByName: aServiceName
				ifFound: [ :serviceDescriptor | 
					serviceDescriptor domain: self.
					aBlockClosure cull: serviceDescriptor createService ]
				ifNone: anOtherBlock ]