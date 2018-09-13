as yet unclassified
findOrRegisterServiceByName: aServiceName type: aTypeName
	^ self
		findServiceByName: aServiceName
		ifFound: [ :s | 
			self assert: s type name equals: aTypeName.
			s ]
		ifNone: [ (mirror
				findOrRegisterServiceDescriptorByName: aServiceName
				type: aTypeName)
				domain: self;
				createService ]