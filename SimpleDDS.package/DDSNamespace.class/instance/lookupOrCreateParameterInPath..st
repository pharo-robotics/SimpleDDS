accessing
lookupOrCreateParameterInPath: aParameterPath
	^ self lookupParameterInPath: aParameterPath ifNone: [  aParameterPath createParameterOn: self ]