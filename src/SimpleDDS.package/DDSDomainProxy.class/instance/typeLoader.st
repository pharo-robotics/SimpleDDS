accessing
typeLoader
	^ typeLoader
		ifNil: [ 
			typeLoader := DDSXMLRPCTypeLoaderServer new
				initializeWith: self;
				yourself ]